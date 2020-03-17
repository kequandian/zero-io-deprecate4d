package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.pdf.print.PdfTemplatePrinter;
import com.jfeat.pdf.services.domain.service.IoStatisticsService;
import com.jfeat.pdf.services.domain.service.PdfExportService;
import com.jfeat.pdf.services.domain.service.PdfTableService;
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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created on 2020/3/16.
 *
 * @author Wen Hao
 */

@Service
public class PdfExportServiceImpl implements PdfExportService {

    protected final static Logger logger = LoggerFactory.getLogger(PdfExportServiceImpl.class);

    @Resource
    PdfTableService pdfTableService;

    @Resource
    IoStatisticsService ioStatisticsService;

    public static final String STATISTICS_TABLE = "statistics";

    public static final String API_TABLE = "api";

    @Override
    public ByteArrayInputStream export(String tableName) {

        PdfTable pdfTable = pdfTableService.findByName(tableName);
        if (pdfTable == null) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "列表名不存在");
        }
        // type
        String type = pdfTable.getType();
        // rows
        List<String> rowsList = null;
        if (STATISTICS_TABLE.equals(type)) {
            rowsList = getRowsFromStatistics(pdfTable);
        } else if (API_TABLE.equals(type)) {
            rowsList = getRowsFromApi(pdfTable);
        } else {
            throw new BusinessException(BusinessCode.InvalidKey, "非法列表类别");
        }

        // template
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());
        // export
        ByteArrayOutputStream baos = exportTablePdf(template, rowsList);

        return new ByteArrayInputStream(baos.toByteArray());
    }

    private ByteArrayOutputStream exportTablePdf(JSONObject template, List<String> rowsList) {
        // pdf request
        JSONObject request = new JSONObject();
        request.put("${rows}", rowsList);
        // export
        return PdfTemplatePrinter.print(template, request);
    }

    private List<String> getRowsFromApi(PdfTable pdfTable) {
        // API
        String api = pdfTable.getApi();
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        // rows data
        JSONArray rowsData = HttpUtil.getResponse(api, authorization)
                .getJSONObject("data")
                .getJSONArray("records");

        logger.info("rowsData --> {}", rowsData);


        // header fields
        String headerField = pdfTable.getHeaderField();
        String[] headerFieldArray = headerField.split(",");
        logger.info("headerFieldArray --> {}", Arrays.toString(headerFieldArray));

        List<String> rowsList = new ArrayList<>();
        if (rowsData != null) {
            for (int i = 0; i < rowsData.size(); i++) {
                JSONObject row = rowsData.getJSONObject(i);
                for (String s : headerFieldArray) {
                    String value = row.getString(s);
                    rowsList.add(value);
                }
            }
        }
        return rowsList;
    }

    private List<String> getRowsFromStatistics(PdfTable pdfTable) {
        // field
        String field = pdfTable.getField();
        // sql
        String sql = ioStatisticsService.getSqlByField(field);

        List<String> rowsList = ioStatisticsService.getrowsList(sql);
        return rowsList;
    }


}
