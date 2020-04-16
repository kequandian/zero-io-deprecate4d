package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.pdf.print.PdfSimpleTemplatePrinter;
import com.jfeat.pdf.services.domain.service.IoStatisticsService;
import com.jfeat.pdf.services.domain.service.PdfRequestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Set;

/**
 * Created on 2020/4/10.
 *
 * @author Wen Hao
 */
@Service
public class PdfRequestServiceImpl implements PdfRequestService {

    protected final static Logger logger = LoggerFactory.getLogger(PdfRequestServiceImpl.class);

    public static final String FORMAT = "${%s}";

    @Resource
    IoStatisticsService ioStatisticsService;

    @Override
    public JSONObject getApiRequest(JSONObject apiData, JSONObject template) {
        JSONObject request = PdfSimpleTemplatePrinter.getRequest();

        // set up request from all api data
        Set<String> dataKeys = apiData.keySet();
        for (String key : dataKeys) {
            Object o = apiData.get(key);
            if (o == null) {
                request.put(String.format(FORMAT, key), "");
            } else if (o instanceof JSONArray){
                request.put(String.format(FORMAT, key), o);
            } else if (o instanceof  JSONObject) {
                request.put(String.format(FORMAT, key), o.toString());
            } else {
                request.put(String.format(FORMAT, key), o);
            }
        }
        return request;
    }

    @Override
    public JSONObject getStatisticsRequest(String field, JSONObject template) {
        JSONObject request = PdfSimpleTemplatePrinter.getRequest();

        // sql
        String sql = ioStatisticsService.getSqlByField(field);
        // rows
        List<String> rowsList = ioStatisticsService.getrowsList(sql);

        // columns

        request.put("${rows}", rowsList);
        return request;
    }
}
