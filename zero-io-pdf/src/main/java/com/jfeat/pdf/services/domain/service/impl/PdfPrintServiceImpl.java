package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.common.HttpUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.pdf.enums.TemplateType;
import com.jfeat.pdf.print.PdfSimpleTemplatePrinter;
import com.jfeat.pdf.properties.PdfPrintProperties;
import com.jfeat.pdf.services.domain.service.PdfPrintService;
import com.jfeat.pdf.services.domain.service.PdfRequestService;
import com.jfeat.pdf.services.domain.model.PdfPrintModel;
import com.jfeat.pdf.util.TemplateFileUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.net.URLDecoder;
import java.nio.charset.StandardCharsets;

/**
 * Created on 2021/2/3 5:03 下午.
 *
 * @author Wen Hao
 */
@Slf4j
@Service
public class PdfPrintServiceImpl implements PdfPrintService {

    public static final Integer ROWS_LIMIT = 5;

    @Resource
    PdfPrintProperties printProperties;

    @Resource
    PdfRequestService pdfRequestService;

    @Override
    public ByteArrayInputStream print(String name) {
        return print(name, null);
    }

    @Override
    public ByteArrayInputStream printPreview(String name) {
        return print(name, ROWS_LIMIT);
    }

    @Override
    public Page<PdfPrintModel> queryPdfPrintPage(Page<PdfPrintService> page) {
        return null;
    }

    //------------------------------------------------------------------------- Private method start

    /**
     * 基本打印pdf
     * @param name 名称
     * @param rowLimit 打印行数限制
     */
    private ByteArrayInputStream print(String name, Integer rowLimit) {
        // pdf打印模版存放路径
        String templateDirectory = printProperties.getTemplateDirectory();
        JSONObject request, template;
        try {
            JSONObject jsonObject = TemplateFileUtil.readTemplateByName(templateDirectory, name);
            log.info("read json :{}", jsonObject);
            PdfPrintModel pdfPrintModel = jsonObject.toJavaObject(PdfPrintModel.class);
            log.info("pdf model : {}", pdfPrintModel);
            template = JSONObject.parseObject(pdfPrintModel.getTemplateContent());
            switch (TemplateType.valueOf(pdfPrintModel.getType())) {
                case API:
                    request = getApiRequest(pdfPrintModel);
                    break;
                case STATISTICS:
                    request = getStatisticsRequest(pdfPrintModel);
                    break;
                default:
                    throw new BusinessException(BusinessCode.CodeBase, "PDF模版文件格式错误");
            }
        } catch (FileNotFoundException e) {
            throw new BusinessException(BusinessCode.CRUD_MASTER_NOT_EXISTS, "打印PDF模版不存在");
        }

        // 设置行数限制
        if (rowLimit != null) {
            request.put("${rowsLimit}", rowLimit);
        }
        // export
        ByteArrayOutputStream baos = PdfSimpleTemplatePrinter.print(template, request);
        return new ByteArrayInputStream(baos.toByteArray());
    }


    private JSONObject getApiRequest(PdfPrintModel pdfPrintModel) {
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
        log.info("search api --> {}", api);
        // process total page
        api = processTotalPage(api, authorization);
        log.info("process total api --> {}", api);
        api = urlDecodeURL(api);
        log.info("urlEncodeURL api --> {}", api);
        // api data
        JSONObject apiData = HttpUtil.getResponse(api, authorization).getJSONObject("data");
        log.info("apiData --> {}", apiData);
        // template content
        JSONObject template = JSONObject.parseObject(pdfPrintModel.getTemplateContent());

        // request
        JSONObject request = pdfRequestService.getApiRequest(apiData);
        log.info("api request --> {}", request);
        return request;
    }

    public JSONObject getStatisticsRequest(PdfPrintModel pdfPrintModel) {
        // field
        String field = pdfPrintModel.getField();

        // template content
        JSONObject template = JSONObject.parseObject(pdfPrintModel.getTemplateContent());

        // request
        JSONObject request = pdfRequestService.getStatisticsRequest(field, template);
        log.info("statistics request --> {}", request);
        return  request;
    }

    private String getApi() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder
                .getRequestAttributes()).getRequest();

        return request.getParameter("api");
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

    private  String urlDecodeURL(String url) {
        try {
            return URLDecoder.decode(url, StandardCharsets.UTF_8);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    //------------------------------------------------------------------------- Private method end
}
