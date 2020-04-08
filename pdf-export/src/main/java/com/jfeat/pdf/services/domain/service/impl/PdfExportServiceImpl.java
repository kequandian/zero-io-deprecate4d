package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.pdf.print.PdfSimpleTemplatePrinter;
import com.jfeat.pdf.services.domain.service.IoStatisticsService;
import com.jfeat.pdf.services.domain.service.PdfExportService;
import com.jfeat.pdf.services.domain.service.PdfTableRowsService;
import com.jfeat.pdf.services.domain.service.PdfTableService;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
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
    PdfTableRowsService pdfTableRowsService;

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
            rowsList = pdfTableRowsService.getRowsFromStatistics(pdfTable);
        } else if (API_TABLE.equals(type)) {
            rowsList = pdfTableRowsService.getRowsFromApi(pdfTable);
        } else {
            throw new BusinessException(BusinessCode.InvalidKey, "非法列表类别");
        }

        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());
        logger.info("template content --> {}", template);

        ByteArrayOutputStream baos = exportTablePdf(template, rowsList);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    private ByteArrayOutputStream exportTablePdf(JSONObject template, List<String> rowsList) {
        // pdf request
        JSONObject request = new JSONObject();
        request.put("${rows}", rowsList);
        // export
        return PdfSimpleTemplatePrinter.print(template, request);
    }

}
