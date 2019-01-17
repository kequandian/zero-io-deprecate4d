package com.jfeat.poi.api;

import com.jfeat.poi.agent.POIAgent;
import com.jfeat.poi.agent.PoiAgentExporter;
import com.jfeat.poi.agent.im.PoiAgentImporterUtil;
import com.jfeat.poi.agent.im.request.PoiAgentImporterRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by vincenthuang on 19/04/2018.
 */
public class PoiAgentExporterApiUtil implements POIAgent {

    private static final Logger logger = LoggerFactory.getLogger(PoiAgentExporterApiUtil.class);

    public static void main(String[] args) throws IOException, SQLException {

        List<String> headers = Arrays.asList(new String[] {"id", "name"});
        List<String> columns = Arrays.asList(new String[] {"id", "name"});
        FileOutputStream os = new FileOutputStream(new File("excel-test.xlsx"));
        List<Map<String, String>> rows = new ArrayList<>();
        Map row1 = new HashMap();
        row1.put("id", 1);
        row1.put("name", "row1");

        Map row2 = new HashMap();
        row2.put("id", 2);
        row2.put("name", "row2");

        rows.add(row1);
        rows.add(row2);
        PoiAgentExporter.exportExcel(rows,  headers, columns, os);


        /**
         * Demo
         **/
        DataSource dataSource = null;
        HttpServletRequest request = null;
        HttpServletResponse response = null;

        /**
         * excel导出  query可以为单个表， 或查询sql
         * Example:
         * GET endpoint?query=vip_account&columns=account&headers=账号&headers=姓名&columns=vip_name
         *
         **/
        new PoiAgentExporterApiUtil().export(dataSource, request, response);

        /**
         * 多表导入
         * Example:
         *
         *    {
         *    "level": 1,     // 1 为单表导入， 2 为多表导入
         *    "duplicate": 1,     //是否允许添加与数据库中完全相同的数据，1允许存在完全相同数据，0为不允许
         *    "unique":[
         *      {
         *        "table": "" //添加唯一索引的表
         *        "fields":[], //添加唯一索引的字段
         *       }
         *    ],
         *    "source": "C:/Users/zy/Desktop/vip_account.xlsx",
         *    "target": {
         *    "table": "vip_account",
         *    "fields": ["vip_name", "account"]
         *    }
         **/
        PoiAgentImporterRequest poiAgentImporterRequest = null;
        new PoiAgentImporterUtil()
                .setDataSource(dataSource)
                .data(poiAgentImporterRequest)
                .performImport();


        /**
         * 导出模板
         * GET endpoint?table=table1&field1=字段1&field2=字段2
         **/
        new PoiAgentExporterApiUtil().template(dataSource, request, response);

    }

    public int template(DataSource dataSource, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();

        Map<String, String> parameters = new LinkedHashMap<>();
        if (parameterMap != null) {
            for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                if (entry.getValue() != null && entry.getValue().length > 0) {
                    parameters.put(entry.getKey(), entry.getValue()[0]);
                }
            }
        }

        // get rows
        List<Map<String, String>> rows = new ArrayList<>();
        rows.add(parameters);


        //输出文件
        int success = 0;
        OutputStream os = null;
        try {
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment; fileName=export.xlsx");
            os = response.getOutputStream();

            success = PoiAgentExporter
                    .exportExcel(rows, null, null, os);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (os != null) {
                os.close();
            }
        }
        return success;
    }


    public int export(DataSource dataSource, HttpServletRequest request, HttpServletResponse response) throws IOException {

        final String QUERY_PARAM = "query";
        final String HEADERS_PARAM = "headers";
        final String COLUMNS_PARAM = "columns";

        Map<String, String[]> parameterMap = request.getParameterMap();
        String[] query_param = parameterMap.get(QUERY_PARAM);
        String[] headers_param = parameterMap.get(HEADERS_PARAM);
        String[] columns_param = parameterMap.get(COLUMNS_PARAM);

        if (query_param != null && query_param.length == 1) {
            String[] queries = query_param;
            String query = queries[0];

            String tableName = null;
            if (query.matches("\\w+")) {
                tableName = query;
            }


            /// check table permission
            if (tableName != null) {
                if (!ExporterParameters.me().canTableExported(tableName)) {
                    /// table not permitted to be exported, just return
                    return 0;
                }
            } else {
                String[] tables = ExporterParameters.findTablesFromSql(query);

                for (String table : tables) {

                    if (!ExporterParameters.me().canTableExported(table)) {
                        /// table not permitted to be exported, just return
                        return 0;
                    }
                }
            }


            // headers
            List<String> headers = new ArrayList<>();
            if(headers_param != null) {
                for (String header : headers_param) {
                    headers.add(header);
                }
            }

            // columns
            List<String> columns = new ArrayList<>();
            for (String column : columns_param) {
                columns.add(column);
            }


            ///
            int success = 0;

            //输出文件
            OutputStream os = null;
            try {
                String fileName = tableName;
                if (fileName == null || fileName.length() == 0) {
                    fileName = ExporterParameters.findTablesFromSql(query)[0];
                }
                response.setContentType("application/octet-stream");
                response.addHeader("Content-Disposition", "attachment; fileName=" + fileName + ".xlsx");
                os = response.getOutputStream();

                if (tableName != null) {
                    // export table

                    success = new PoiAgentExporter()
                            .setDataSource(dataSource)
                            .headers(headers)
                            .columns(columns)
                            .exportTable(tableName, os);
                } else {
                    /// export query

                    success = new PoiAgentExporter()
                            .setDataSource(dataSource)
                            .headers(headers)
                            .columns(columns)
                            .exportWitSql(query, os);
                }

            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                if (os != null) {
                    os.close();
                }
            }

            success = Math.max(1, success);
            return success;
        }

        return 0;
    }


    public int export(DataSource dataSource, String querySql, HttpServletResponse response) throws IOException {

        /// check table permission
        {
            String[] tables = ExporterParameters.findTablesFromSql(querySql);
            for (String table : tables) {

                if (!ExporterParameters.me().canTableExported(table)) {
                    /// table not permitted to be exported, just return
                    return 0;
                }
            }
        }

        ///
        int success = 0;

        //输出文件
        OutputStream os = null;
        try {
            String fileName = ExporterParameters.findTablesFromSql(querySql)[0];
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment; fileName=" + fileName + ".xlsx");
            os = response.getOutputStream();

            /// export query

            success = new PoiAgentExporter()
                    .setDataSource(dataSource)
                    .exportWitSql(querySql, os);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (os != null) {
                os.close();
            }
        }

        success = Math.max(1, success);
        return success;
    }

}
