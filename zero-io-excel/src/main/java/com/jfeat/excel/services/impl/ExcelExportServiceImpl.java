package com.jfeat.excel.services.impl;

import cn.afterturn.easypoi.excel.ExcelExportUtil;
import cn.afterturn.easypoi.excel.entity.TemplateExportParams;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import com.jfeat.common.HttpUtil;
import com.jfeat.common.ResourceUtil;
import com.jfeat.excel.constant.ExcelConstant;
import com.jfeat.excel.properties.ExcelProperties;
import com.jfeat.excel.services.ExcelExportService;
import com.jfeat.poi.agent.PoiAgentExporter;
import com.jfeat.poi.api.PoiAgentExporterApiUtil;
import io.jsonwebtoken.lang.Assert;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.usermodel.Workbook;
import org.mockito.asm.tree.FieldInsnNode;
import org.mockito.internal.util.io.IOUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;
import java.io.*;
import java.util.*;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */

@Service
@Slf4j
public class ExcelExportServiceImpl implements ExcelExportService {

    protected final static Logger logger = LoggerFactory.getLogger(ExcelExportServiceImpl.class);


    private static final String API_PREFIX = "/api/adm/stat/meta";

    @Autowired
    ExcelProperties excelProperties;

    @Autowired
    DataSource dataSource;

    @Override
    public ByteArrayInputStream export(String exportName) throws IOException {
        String templateDirectory = excelProperties.getExcelTemplateDir();

        // 获取 .json, 解释
        String dictName = exportName + ExcelConstant.EXPORT_DICT_SUFFIX;
        String dictPath = String.join(File.separator, templateDirectory, dictName);

        String dictJsonContent = ResourceUtil.getDefaultResourceFileContent(dictPath);
        if(StringUtils.isEmpty(dictJsonContent)){
            dictJsonContent="{}";
        }
        JSONObject sqlJson = JSONObject.parseObject(dictJsonContent);

        JSONObject search = sqlJson.getJSONObject("search");
        HashMap<String, String> searchMap = new HashMap<>();
        if (search!=null){
            for (String key : search.keySet()) {
                searchMap.put(key, search.getString(key));
            }
        }

        String url = sqlJson.getJSONObject("api")!=null?sqlJson.getJSONObject("api").getString("url") : null;
        if (!StringUtils.isEmpty(url)) {
            return exportByApi(exportName, url);
        } else {
            return exportBySql(exportName, searchMap);
        }
    }

    @Override
    @SneakyThrows
    public ByteArrayInputStream exportByApi(String exportName, String api) {
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");
        log.info("Authorization: {}", authorization);
        // API
        String apiPath = api;
        if (apiPath.startsWith("http")) {
            // ok
        } else if (apiPath.startsWith("/")) {
            StringBuffer requestURL = httpRequest.getRequestURL();
            String requestURI = httpRequest.getRequestURI();
            String host = requestURL.delete(requestURL.length() -
                    requestURI.length(), requestURL.length()).toString();
            apiPath = host + api;
            log.info("full api : {} ", apiPath);
        } else {
            log.warn("invalid api: " + api);
        }

        Map<String, String> search = api.contains("?") ? new HashMap<String, String>() : null;


        //设置最大 导出行数
        Integer excelExportMaxRows = excelProperties.getExcelExportMaxRows();
        if (excelExportMaxRows == null) {
            excelExportMaxRows = ExcelConstant.DEFAULT_EXCEL_EXPORT_MAX_ROWS;
        }
        log.info("excelExportMaxRows : {}", excelExportMaxRows);

        if (search!=null) {
            search.put("pageSize", excelExportMaxRows.toString());
        }


        apiPath = HttpUtil.setQueryParams(apiPath, search);
        log.info("api search Path: {}", apiPath);

        JSONObject response = HttpUtil.getResponse(apiPath, authorization);
        JSONObject data = response.getJSONObject("data");
        log.info("data : {}", data);

        // API数据转换成row
        JSONArray records = data.getJSONArray("records");

        String templateDirectory = excelProperties.getExcelTemplateDir();
        // 转换字典
        String dictName = exportName + ExcelConstant.EXPORT_DICT_SUFFIX;
        String dictPath = templateDirectory + File.separator + dictName;
        log.info("dictPath : {}", dictPath);

        // enhance:
        // get dict from system file or from classpath resource
        String jsonStr = ResourceUtil.getDefaultResourceFileContent(dictPath);
        System.out.println(jsonStr);
        Map<String, Map<String, String>> dict = JSON.parseObject(jsonStr, new TypeReference<HashMap<String, Map<String, String>>>() {
        });
        //Map<String, Map<String, String>> dict = FileUtil.parseJsonFile(dictPath,
        //        new TypeReference<HashMap<String, Map<String, String>>>() {});
        // end enhance

        log.info("template dict: {}", dict);
        List<Map<String, Object>> rowsMapList = getRowsMapList(records, dict);
        log.info("rowsMapList : {}", rowsMapList);

        // 模版文件
        String templateFileName = exportName + ExcelConstant.EXPORT_TEMPLATE_SUFFIX;
        String templateFilePath = templateDirectory + File.separator + templateFileName;
        System.out.println(templateFileName);
        System.out.println(templateFilePath);
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
    @Override
    public ByteArrayInputStream exportBySql(String exportName, Map<String, String> search) {
        String templateDirectory = excelProperties.getExcelTemplateDir();
        // sql 文件名称
        String sqlTemplateName = exportName + ExcelConstant.EXPORT_SQL_SUFFIX;
        String templateFilePath = String.join(File.separator,templateDirectory, sqlTemplateName);

        //first get file from file-system
        File templateFile = new File(templateFilePath);
        log.info("template path: {}", templateFile.getAbsolutePath());
        InputStream sqlStream = templateFile.exists() ? new FileInputStream(templateFile) :
                ResourceUtil.getDefaultResourceFileAsStream(templateFilePath);
        Assert.isTrue(sqlStream!=null);

        // 逐行读取 sql文件
        Collection<String> sqlLines = IOUtil.readLines(sqlStream);
        // end enhance

        // 替换注释并构建 sql
        String sql = processSqlLines(sqlLines, search);
        log.info("template sql: {}", sql);
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        new PoiAgentExporterApiUtil().export(dataSource, sql, baos);
        return new ByteArrayInputStream(baos.toByteArray());
    }

    private String processSqlLines(Collection<String> sqlLines, Map<String, String> replaceMap) {
        StringBuilder sqlBuilder = new StringBuilder();
        sqlLines.stream()
                // 消除注释并替换
                .map(line -> replaceSqlLine(line, replaceMap).concat(ExcelConstant.NEW_LINE))
                // 跳过仍为注释的行
                .filter(line -> !line.startsWith(ExcelConstant.EXPORT_SQL_REPLACE_PREFIX))
                .forEach(sqlBuilder::append);
        return sqlBuilder.toString();
    }

    private String replaceSqlLine(String sqlLine, Map<String, String> replaceMap) {
        sqlLine = StrUtil.trimStart(sqlLine);
        // 注释开头
        if (sqlLine.startsWith(ExcelConstant.EXPORT_SQL_REPLACE_PREFIX)) {
            for (Map.Entry<String, String> entry : replaceMap.entrySet()) {
                String replace = String.format(ExcelConstant.EXPORT_SQL_REPLACE_FORMAT, entry.getKey());
                if (sqlLine.contains(replace)) {
                    // 替换字段并消除注释
                    sqlLine = StrUtil.removePrefix(sqlLine, ExcelConstant.EXPORT_SQL_REPLACE_PREFIX);
                    sqlLine = StrUtil.replace(sqlLine, replace, entry.getValue());
                }
            }
        }
        return sqlLine;
    }

    /**
     * 获取 Map List, 并转换字典值
     *
     * @param jsonArray - 数据
     * @param dict      - 字典
     * @return
     */
    private List<Map<String, Object>> getRowsMapList(JSONArray jsonArray, Map<String, Map<String, String>> dict) {
        List<Map<String, Object>> list = new ArrayList<>();
        if (jsonArray != null) {
            for (int i = 0; i < jsonArray.size(); i++) {
                Map<String, Object> innerMap = jsonArray.getJSONObject(i).getInnerMap();
                // 根据字典转换
                list.add(handleExcelDictionary(innerMap, dict));
            }
        }
        return list;
    }

    /**
     * 处理字典数据转换
     *
     * @param recordMap - 行数据
     * @param dict      - 字典
     */
    private Map<String, Object> handleExcelDictionary(Map<String, Object> recordMap,
                                                      Map<String, Map<String, String>> dict) {
        recordMap.forEach((key, value) -> {
            Map<String, String> convertMap = dict.get(key);
            if (!CollectionUtil.isEmpty(convertMap)) {
                String convertValue = convertMap.getOrDefault(String.valueOf(value), String.valueOf(value));
                recordMap.put(key, convertValue);
            }
        });
        return recordMap;
    }


    //自动报表专用

    @Override
    public ByteArrayInputStream autoExport(String field) {

        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        String authorization = httpRequest.getHeader("Authorization");

        // api
        String apiPath = getApiPath(httpRequest, field);
        // process search
        apiPath = processSearch(apiPath, httpRequest);
        //访问前打印数据
        logger.info("ready to getResponse");
        logger.info("apiPath:  {}",apiPath);
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






    //自动报表

    private List<Map<String, String>> getRowsMapList(JSONArray rows) {
        List<Map<String, String>> rowsMapList = new ArrayList<>();

        for (int i = 0; i < rows.size(); i++) {
            JSONObject obj = rows.getJSONObject(i);
            Map<String, String> rowMap = new HashMap<>();
            // 循环转换
            Iterator it = obj.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, Object> entry = (Map.Entry<String, Object>) it.next();
                String value = String.valueOf(entry.getValue());
                rowMap.put(entry.getKey(), value.equals("null")?"":value);
            }
            rowsMapList.add(rowMap);
        }
        return rowsMapList;
    }

    private String getApiPath(HttpServletRequest httpRequest, String field) {
        String requestURI = httpRequest.getRequestURI();
        StringBuffer requestURL = httpRequest.getRequestURL();
        String schema = httpRequest.getScheme();
        logger.info("requestURI = {}",requestURI);
        logger.info("requestURL = {}",requestURL);
        logger.info("schema = {}",schema);

        //域名为https开头，根据配置替换
        //if(excelProperties.getHttps()){
        if("https".equals(schema)){
            logger.info("开启https");
            int httpIndex = requestURL.indexOf(":");
            logger.info("':'Index {}",httpIndex);
            requestURL.replace(0,httpIndex,"https");
            logger.info("requestURL = {}",requestURL);
        }

        // String requestURL = "http://cloud.biliya.cn/api/io/excel/xxxx";
        // String requestURI = "/api/io/excel/xxxx";
        // https fix
        //int index = requestURL.indexOf(requestURI);
        //return requestURL.substring(0, index) + API_PREFIX + "/" + field;
        return String.join("", requestURL.toString().replace(requestURI,""), API_PREFIX, "/", field);
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
