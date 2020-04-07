package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.pdf.services.domain.service.IoStatisticsService;
import com.jfeat.pdf.services.domain.service.PdfTableRowsService;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import com.jfeat.pdf.util.HttpUtil;
import com.jfeat.pdf.util.TemplateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;


/**
 * Created on 2020/3/30.
 *
 * @author Wen Hao
 */
@Service
public class PdfTableRowsServiceImpl implements PdfTableRowsService {

    protected final static Logger logger = LoggerFactory.getLogger(PdfTableRowsServiceImpl.class);

    @Resource
    IoStatisticsService ioStatisticsService;

    @Override
    public List<String> getRowsFromApi(PdfTable pdfTable) {
        // api
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

        // template
        JSONObject template = JSONObject.parseObject(pdfTable.getTemplateContent());

        // get all keys
        JSONObject tableFlow = TemplateUtil.getTableFlow(template);
        List<String> tableKeys = TemplateUtil.getTableKeys(tableFlow);
        logger.info("tableKeys --> {}", tableKeys);

        // collect
        List<String> rowsList = new ArrayList<>();
        if (rowsData != null) {
            for (int i = 0; i < rowsData.size(); i++) {
                JSONObject row = rowsData.getJSONObject(i);
                for (String s : tableKeys) {
                    String value = row.getString(s);
                    rowsList.add(value);
                }
            }
        }
        //
        return rowsList;
    }

    @Override
    public List<String> getRowsFromStatistics(PdfTable pdfTable) {
        // field
        String field = pdfTable.getField();
        // sql
        String sql = ioStatisticsService.getSqlByField(field);

        List<String> rowsList = ioStatisticsService.getrowsList(sql);
        return rowsList;
    }


}
