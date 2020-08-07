package com.jfeat.excel.services.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.common.HttpUtil;
import com.jfeat.excel.constant.ExcelConstant;
import com.jfeat.excel.model.ExportParam;
import com.jfeat.excel.properties.ExcelProperties;
import com.jfeat.excel.services.ExcelExportService;
import com.jfeat.poi.agent.PoiAgentExporter;
import com.jfeat.poi.api.PoiAgentExporterApiUtil;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileReader;
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

    @Autowired
    DataSource dataSource;

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
        String type = exportParam.getType();

        if (ExcelConstant.API_EXPORT.equals(type)) {
            // api
            return exportByApi(exportName, exportParam.getApi(),
                    exportParam.getSearch(), exportParam.getDict());
        } else if (ExcelConstant.SQL_EXPORT.equals(type)) {
            // sql
            return exportBySql(exportName);
        }
        throw new RuntimeException("错误的导出模式!");
    }

    @Override
    @SneakyThrows
    public ByteArrayInputStream exportByApi(String exportName, String api, Map<String, String> search,
                                            Map<String, Map<String, String>> dict) {
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        log.info("Authorization: {}", authorization);
        // API
        String apiPath = api;
        // 处理API的分页和搜索
        log.info("search parameter : {}", search);
        apiPath = HttpUtil.setQueryParams(apiPath, search);
        log.info("api search Path: {}", apiPath);
        JSONObject response = HttpUtil.getResponse(apiPath, authorization);
        JSONObject data = response.getJSONObject("data");
        log.info("data : {}", data);

        // API数据转换成row
        JSONArray records = data.getJSONArray("records");
        log.info("template dict: {}", dict);
        List<Map<String, Object>> rowsMapList = getRowsMapList(records, dict);

        // 模版文件
        String templateDirectory = excelProperties.getTemplateDir();
        String templateFileName = exportName + ExcelConstant.EXPORT_TEMPLATE_SUFFIX;
        String templateFilePath = templateDirectory + File.separator + templateFileName;
        log.info("templateFilePath : {}", templateFilePath);

        // 使用 easy poi 方法导出
        TemplateExportParams params = new TemplateExportParams(templateFilePath);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        Map<String, Object> map = new HashMap<>();
        map.put("list", rowsMapList);
        Workbook workbook = ExcelExportUtil.exportExcel(params, map);
        workbook.write(baos);

        return new ByteArrayInputStream(baos.toByteArray());
    }

    @SneakyThrows
    public ByteArrayInputStream exportBySql(String exportName) {
        String templateDirectory = excelProperties.getTemplateDir();
        // sql 文件名称
        String sqlTemplateName = exportName + ExcelConstant.EXPORT_SQL_SUFFIX;
        String templateFilePath = templateDirectory + File.separator + sqlTemplateName;
        // 读取 sql
        String sql = IoUtil.read(new FileReader(new File(templateFilePath)));
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        new PoiAgentExporterApiUtil().export(dataSource, sql, baos);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    /**
     * 获取 Map List, 并转换字典值
     * @param jsonArray  - 数据
     * @param dict       - 字典
     * @return
     */
    private List<Map<String, Object>> getRowsMapList(JSONArray jsonArray, Map<String, Map<String, String>> dict) {
        List<Map<String, Object>> list = new ArrayList<>();
        for (int i = 0; i < jsonArray.size(); i++) {
            Map<String, Object> innerMap = jsonArray.getJSONObject(i).getInnerMap();
            // 根据字典转换
            list.add(handleExcelDictionary(innerMap, dict));
        }
        return list;
    }

    /**
     * 处理字典数据转换
     * @param recordMap - 行数据
     * @param dict      - 字典
     */
    private Map<String, Object> handleExcelDictionary(Map<String, Object> recordMap,
                                       Map<String, Map<String, String>> dict) {
        recordMap.forEach((key, value) -> {
            Map<String, String> convertMap = dict.get(key);
            if (convertMap != null && !convertMap.isEmpty()) {
                String convertValue = convertMap.getOrDefault(value, (String)value);
                recordMap.put(key, convertValue);
            }
        });
        return recordMap;
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
