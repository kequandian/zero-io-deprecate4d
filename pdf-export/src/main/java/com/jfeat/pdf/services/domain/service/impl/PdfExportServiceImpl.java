package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.pdf.print.PdfSimpleTemplatePrinter;
import com.jfeat.pdf.services.domain.dao.QueryPdfTableDao;
import com.jfeat.pdf.services.domain.service.PdfExportService;
import com.jfeat.pdf.services.domain.service.PdfRequestService;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import com.jfeat.pdf.util.HttpUtil;
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

    public JSONObject getApiRequest(PdfTable pdfTable) {
        // api
        String api = pdfTable.getApi();
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        // process api
        api = processApi(api, authorization);
        // api data
        JSONObject apiData = HttpUtil.getResponse(api, authorization).getJSONObject("data");

        // template content
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // request
        JSONObject request = pdfRequestService.getApiRequest(apiData, template);
        logger.info("api request --> {}", request);
        return request;
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

    private String processApi(String api, String authorization) {
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


    private static String requestForPageSize(String url, String auth) {
        return "20";
    }

    public static void main(String[] args) {
        String api = "http://47.112.34.149/api/crud/project/projects";
        String auth = "";
        // get pageSize
        String pageSize = HttpUtil.getQueryParam(api, "pageSize");
        // setPageSize
        if (pageSize == null) {
            // pageSize = requestForPageSize(api, auth);
            pageSize = "20";
            api = HttpUtil.setQueryParam(api, "pageSize", pageSize);
        }
        System.out.println(api);
        // return api;
    }

}
