package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.common.HttpUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.pdf.print.PdfSimpleTemplatePrinter;
import com.jfeat.pdf.services.domain.dao.QueryPdfTableDao;
import com.jfeat.pdf.services.domain.service.PdfExportService;
import com.jfeat.pdf.services.domain.service.PdfRequestService;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.net.URLDecoder;
import java.nio.charset.Charset;

/**
 * Created on 2020/3/16.
 *
 * @author Wen Hao
 */

@Service
public class PdfExportServiceImpl implements PdfExportService {

    protected final static Logger logger = LoggerFactory.getLogger(PdfExportServiceImpl.class);

    @Resource
    PdfRequestService pdfRequestService;

    @Resource
    QueryPdfTableDao queryPdfTableDao;

    public static final String STATISTICS_TABLE = "statistics";

    public static final String API_TABLE = "api";

    public static final Integer ROWS_LIMIT = 5;

    @Override
    public ByteArrayInputStream export(String tableName) {
        logger.info("pdfTable name --> {}", tableName);
        PdfTable pdfTable = queryPdfTableDao.findPdfTableByName(tableName);
        logger.info("pdfTable --> {}", pdfTable);
        if (pdfTable == null) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "列表名不存在");
        }
        // type
        String type = pdfTable.getType();
        // pdf request
        JSONObject request = null;
        if (STATISTICS_TABLE.equals(type)) {
            request = getStatisticsRequest(pdfTable);
        } else if (API_TABLE.equals(type)) {
            request = getApiRequest(pdfTable);
        } else {
            throw new BusinessException(BusinessCode.InvalidKey, "非法列表类别");
        }
        // template content
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // export
        ByteArrayOutputStream baos = PdfSimpleTemplatePrinter.print(template, request);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    @Override
    public ByteArrayInputStream exportPreview(String tableName) {
        logger.info("pdfTable name --> {}", tableName);
        PdfTable pdfTable = queryPdfTableDao.findPdfTableByName(tableName);
        logger.info("pdfTable --> {}", pdfTable);
        if (pdfTable == null) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "列表名不存在");
        }
        // type
        String type = pdfTable.getType();
        // pdf request
        JSONObject request = null;
        if (STATISTICS_TABLE.equals(type)) {
            request = getStatisticsRequest(pdfTable);
        } else if (API_TABLE.equals(type)) {
            request = getApiRequest(pdfTable);
        } else {
            throw new BusinessException(BusinessCode.InvalidKey, "非法列表类别");
        }
        // template content
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // 加入rows数量限制
        request.put("${rowsLimit}", ROWS_LIMIT);
        // export
        ByteArrayOutputStream baos = PdfSimpleTemplatePrinter.print(template, request);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    @Override
    public ByteArrayInputStream exportMultiApis(String tableName, Long id) {

        PdfTable pdfTable = queryPdfTableDao.findPdfTableByName(tableName);
        if (pdfTable == null) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "列表名不存在");
        }
        // only API type
        // API
        String api = pdfTable.getApi() + id;
        // authorization
        String authorization = HttpUtil.getHttpAuthorization();
        logger.info("api : {}", api);
        logger.info("authorization: {}", authorization);
        // api data
        JSONObject apiData = HttpUtil.getResponse(api, authorization).getJSONObject("data");
        // request
        JSONObject request = pdfRequestService.getApiRequest(apiData);

        // 子API
        JSONArray subApis = JSONObject.parseArray(pdfTable.getSubApis());
        logger.info("subApis --> {}", pdfTable.getSubApis());
        processSubApiRequests(request, subApis, id);
        // template content
        int templateType = pdfTable.getTemplateType();
        JSONObject template = null;
        /*if (TemplateTypeEnum.NOT_IN_FILE.getValue() == (templateType)) {
            // 数据库形式
            template = JSONObject.parseObject(pdfTable.getTemplateContent());
        } else if (TemplateTypeEnum.IN_FILE.getValue() ==  (templateType)) {
            template = JSONObject.parseObject(pdfTable.getTemplateContent());
        } else {
            throw new RuntimeException("模版文件存放格式异常");
        }*/
        template = JSONObject.parseObject(pdfTable.getTemplateContent());


        // export
        ByteArrayOutputStream baos = PdfSimpleTemplatePrinter.print(template, request);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    public JSONObject getApiRequest(PdfTable pdfTable) {
        // api
       // String api = pdfTable.getApi();
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        // process search
        //api = processSearch(api);
        //api改为直接从请求中的api参数获取
        String api = getApi();
        logger.info("search api --> {}", api);
        // process total page
        api = processTotalPage(api, authorization);
        logger.info("process total api --> {}", api);
        api = urlDecodeURL(api);
        logger.info("urlEncodeURL api --> {}", api);
        // api data
        JSONObject apiData = HttpUtil.getResponse(api, authorization).getJSONObject("data");
        logger.info("apiData --> {}", apiData);
        // template content
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // request
        JSONObject request = pdfRequestService.getApiRequest(apiData);
        logger.info("api request --> {}", request);
        return request;
    }

    private void processSubApiRequests(JSONObject request, JSONArray apisArray, Long id) {
        if (apisArray != null) {
            for (int i = 0; i < apisArray.size(); i++) {
                JSONObject subApiJSON = apisArray.getJSONObject(i);
                // api
                String api = subApiJSON.getString("api") + id;
                // Authorization
                String authorization = HttpUtil.getHttpAuthorization();
                // field data
                String fieldName = subApiJSON.getString("fieldName");
                // map name
                String mapName = subApiJSON.getString("mapName");
                // api data
                Object apiData = HttpUtil.getResponse(api, authorization).get("data");
                if (apiData instanceof JSONObject) {
                    JSONObject fieldData = ((JSONObject) apiData).getJSONObject(fieldName);
                    request.put(mapName, fieldData);
                } else {
                    request.put(mapName, apiData);
                }
            }
        }
    }

    public JSONObject getStatisticsRequest(PdfTable pdfTable) {
        // field
        String field = pdfTable.getField();

        // template content
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // request
        JSONObject request = pdfRequestService.getStatisticsRequest(field, template);
        logger.info("statistics request --> {}", request);
        return  request;
    }

    private String processSearch(String api) {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();

        String queryString = request.getQueryString();
        return HttpUtil.setQueryParams(api, queryString);
    }

    private String getApi() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();

        String api = request.getParameter("api");
        return api;
    }

    private String processTotalPage(String api, String authorization) {
        // 检测total
        // get pageSize
        String pageSize = HttpUtil.getQueryParam(api, "pageSize");
        // set pageSize
        if (pageSize == null) {
            // get total
            JSONObject data = HttpUtil.getResponse(api, authorization).getJSONObject("data");
            String total = data.getString("total");
            if (total != null) {
                api = HttpUtil.setQueryParam(api, "pageSize", total);
            }
        }
        return api;
    }


    public static String urlDecodeURL(String url) {
        try {
            String result = URLDecoder.decode(url, Charset.forName("UTF-8"));
            return result;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
