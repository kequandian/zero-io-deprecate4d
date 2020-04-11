package com.jfeat.pdf.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.pdf.services.domain.service.IoStatisticsService;
import com.jfeat.pdf.services.domain.service.PdfRequestService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
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
        JSONObject request = new JSONObject();

        // rows data
        JSONArray rowsData = apiData.getJSONArray("records");
        logger.info("rowsData --> {}", rowsData);

        // rows keys
        List<String> rowsKeys = getRowsKeys(template);

        // rows request
        List<String> rowsList = getRowsList(rowsData, rowsKeys);

        request.put("${rows}", rowsList);

        // set up request from other api data
        Set<String> dataKeys = apiData.keySet();
        for (String key : dataKeys) {
            Object o = apiData.get(key);
            if (o == null) {
                request.put(String.format(FORMAT, key), "");
            } else if (o instanceof JSONObject) {
                request.put(String.format(FORMAT, key), ((JSONObject)o).toString());
            } else {
                request.put(String.format(FORMAT, key), o);
            }
        }
        return request;
    }

    @Override
    public JSONObject getStatisticsRequest(String field, JSONObject template) {
        JSONObject request = new JSONObject();

        // sql
        String sql = ioStatisticsService.getSqlByField(field);
        // rows
        List<String> rowsList = ioStatisticsService.getrowsList(sql);

        // columns

        request.put("${rows}", rowsList);
        return request;
    }

    private List<String> getRowsKeys(JSONObject template) {
        List<String> rowsKeys = new ArrayList<>();

        JSONArray flows = template.getJSONArray("flows");
        for (int i = 0; i < flows.size(); i++) {
            JSONObject flow = flows.getJSONObject(i);
            if ("table".equals(flow.getString("name"))) {
                JSONArray columnKeyBindings = flow.getJSONArray("columnKeyBindings");
                for (int k = 0; k < columnKeyBindings.size(); k++) {
                    JSONObject columnKeyBinding = columnKeyBindings.getJSONObject(k);
                    rowsKeys.add(columnKeyBinding.getString("key"));
                }
            }
        }
        return rowsKeys;
    }

    private List<String> getRowsList(JSONArray rowsData, List<String> rowsKeys) {
        List<String> rowsList = new ArrayList<>();
        if (rowsData != null) {
            for (int i = 0; i < rowsData.size(); i++) {
                JSONObject row = rowsData.getJSONObject(i);
                for (String s : rowsKeys) {
                    String value = row.getString(s);
                    rowsList.add(value);
                }
            }
        }
        return rowsList;
    }
}
