package com.jfeat.excel.services.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.common.HttpUtil;
import com.jfeat.excel.model.ExportParam;
import com.jfeat.excel.properties.ExcelProperties;
import com.jfeat.excel.services.ExcelExportService;
import com.jfeat.poi.agent.PoiAgentExporter;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.*;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */

@Service
@Slf4j
public class ExcelExportServiceImpl implements ExcelExportService {

    private static final String API_PREFIX = "/api/adm/stat/meta";
    @Autowired
    ExcelProperties excelProperties;

    @Override
    public ByteArrayInputStream export(String field) {

        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        // api
        String apiPath = getApiPath(httpRequest, field);
        // process search
        apiPath = processSearch(apiPath, httpRequest);
        // process page size
        apiPath = processPageSize(apiPath, authorization);

        // 访问api 获取数据
        JSONObject data = HttpUtil.getResponse(apiPath, authorization).getJSONObject("data");
        // header
        List<String> header = data.getJSONArray("header").toJavaList(String.class);
        // rows jsonArray
        JSONArray rows = data.getJSONArray("rows");
        // rows map
        List<Map<String, String>> rowsMapList = getRowsMapList(rows);

        // export
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PoiAgentExporter.exportExcel(rowsMapList, header, header, baos);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    @Override
    public ByteArrayInputStream export(ExportParam exportParam) {

        String exportName = exportParam.getExportName();
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        log.info("Authorization: {}", authorization);
        // api
        Map<String, ExcelProperties.ExcelPojo> exportMap = excelProperties.getExportMap();
        ExcelProperties.ExcelPojo excelPojo = exportMap.get(exportName);
        String apiPath = excelPojo.getApi();

        // handle page and search
        Map<String, String> search = exportParam.getSearch();
        log.info("search parameter : {}", search);
        apiPath = HttpUtil.setQueryParams(apiPath, search);
        log.info("apiPath: {}", apiPath);
        JSONObject response = HttpUtil.getResponse(apiPath, authorization);
        JSONObject data = response.getJSONObject("data");
        log.info("data : {}", data);

        // template file
        String templateDirectory = excelProperties.getTemplateDirectory();
        String templateName = excelPojo.getTemplateName();
        String templateFilePath = templateDirectory + "/" + templateName;
        log.info("templateFilePath : {}", templateFilePath);

        // handle easy poi
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        try {
            TemplateExportParams params = new TemplateExportParams(templateFilePath);
            JSONArray records = data.getJSONArray("records");
            Map<String, Map<String, String>> dict = exportParam.getDict();
            log.info("template dict: {}", dict);
            Map<String, Object> map = new HashMap<>();
            List<Map<String, Object>> list = new ArrayList<>();
            for (int i = 0; i < records.size(); i++) {
                Map<String, Object> innerMap = records.getJSONObject(i).getInnerMap();
                handleExcelDictionary(innerMap, dict);
                list.add(records.getJSONObject(i).getInnerMap());
            }
            map.put("list", list);
            Workbook workbook = ExcelExportUtil.exportExcel(params, map);
            workbook.write(baos);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return new ByteArrayInputStream(baos.toByteArray());
    }

    /**
     * 处理字典数据转换
     * @param recordMap - 行数据
     * @param dict      - 字典
     */
    private void handleExcelDictionary(Map<String, Object> recordMap,
                                       Map<String, Map<String, String>> dict) {
        recordMap.forEach((key, value) -> {
            Map<String, String> convertMap = dict.get(key);
            if (convertMap != null && !convertMap.isEmpty()) {
                String convertValue = convertMap.getOrDefault(value, (String)value);
                recordMap.put(key, convertValue);
            }
        });
    }

    private List<Map<String, String>> getRowsMapList(JSONArray rows) {
        List<Map<String, String>> rowsMapList = new ArrayList<>();

        for (int i = 0; i < rows.size(); i++) {
            JSONObject obj = rows.getJSONObject(i);
            Map<String, String> rowMap = new HashMap<>();
            // 循环转换
            Iterator it = obj.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
                rowMap.put(entry.getKey(), entry.getValue());
            }
            rowsMapList.add(rowMap);
        }
        return rowsMapList;
    }

    private String getApiPath(HttpServletRequest httpRequest, String field) {
        String requestURI = httpRequest.getRequestURI();
        StringBuffer requestURL = httpRequest.getRequestURL();
        // String requestURL = "http://cloud.biliya.cn/api/io/excel/xxxx";
        // String requestURI = "/api/io/excel/xxxx";
        int index = requestURL.indexOf(requestURI);
        return requestURL.substring(0, index) + API_PREFIX + "/" + field;
    }

    private String processSearch(String apiPath, HttpServletRequest request) {
        String queryString = request.getQueryString();
        return HttpUtil.setQueryParams(apiPath, queryString);
    }

    private String processPageSize(String apiPath, String authorization) {
        JSONObject data = HttpUtil.getResponse(apiPath, authorization).getJSONObject("data");
        String total = data.getString("total");
        // apiPath = HttpUtil.setQueryParam(apiPath,"pageNum", "1");
        return HttpUtil.setQueryParam(apiPath, "pageSize", total);
    }
}
