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

    public static final String DOT = ".";

    public static final String INIT_PREFIX = "";

    @Resource
    IoStatisticsService ioStatisticsService;

    @Override
    public JSONObject getApiRequest(JSONObject apiData) {
        JSONObject request = PdfSimpleTemplatePrinter.getRequest();
        if (apiData == null) { return request; }
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
        JSONArray rowsJSONArray = ioStatisticsService.getrowsJSONArray(sql);

        // columns

        request.put("${rows}", rowsJSONArray);
        return request;
    }

    private void processJsonObject(String prefix, JSONObject request, JSONObject obj) {
        Set<String> dataKeys = obj.keySet();
        for (String key : dataKeys) {
            Object o = obj.get(key);
            String requestKeyName = getRequestKeyName(prefix, key);
            if (o == null) {
                request.put(requestKeyName, "");
            } else if (o instanceof JSONArray){
                request.put(requestKeyName, o);
                // 递归调用
            } else if (o instanceof  JSONObject) {
                request.put(requestKeyName, o.toString());
                // 递归调用
                processJsonObject(requestKeyName, request, (JSONObject) o);
            } else {
                request.put(requestKeyName, o);
            }
        }
    }

    private String getRequestKeyName(String prefix, String key) {
        String keyName = prefix == null ? key : prefix + DOT + key;
        return String.format(FORMAT, keyName);
    }
}
