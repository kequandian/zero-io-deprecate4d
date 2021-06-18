package com.jfeat.zero.poi.api;

import com.jfeat.zero.poi.agent.POIAgent;
import com.jfeat.zero.poi.agent.PoiAgentExporter;
import com.jfeat.zero.poi.agent.im.PoiAgentImporterUtil;
import com.jfeat.zero.poi.agent.im.request.PoiAgentImporterRequest;
import com.jfeat.zero.poi.agent.util.ExcelWriter;
import org.apache.poi.ss.usermodel.Workbook;

import javax.sql.DataSource;
import java.io.*;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by vincenthuang on 19/04/2018.
 */
public class PoiAgentExporterApiUtil implements POIAgent {

    public static void main(String[] args) throws IOException, SQLException {
        /**
         * 或者 (HttpServletResponse)
         *  response.setContentType("application/octet-stream");
         *  response.addHeader("Content-Disposition", "attachment; fileName=export.xlsx");
         *  OutputStream output = response.getOutputStream();
         **/
        FileOutputStream output = new FileOutputStream(new File("excel-test.xlsx"));

        /**
         * set DateSource
         **/
        DataSource dataSource = null;

        /**
         * excel 矩阵导出
         *
         * A    |   B   |   C
         * name |       |   sex
         * zy   |       |   man
         **/
        List<List<String>> data = new ArrayList<>();
        data.add(Arrays.asList(new String[] {"name", "", "sex"}));
        data.add(Arrays.asList(new String[] {"zy", "", "man"}));
        new PoiAgentExporterApiUtil().export(data, output);


        /**
         * excel 列表导出
         * A    |   B
         * id   |   name
         * 1    |   row1
         * 2    |   row2
         **/
        List<String> headers = Arrays.asList(new String[] {"id", "name"});
        List<String> columns = Arrays.asList(new String[] {"id", "name"});

        List<Map<String, String>> rows = new ArrayList<>();
        Map row1 = new HashMap();
        row1.put("id", 1);
        row1.put("name", "row1");

        Map row2 = new HashMap();
        row2.put("id", 2);
        row2.put("name", "row2");

        rows.add(row1);
        rows.add(row2);
        PoiAgentExporter.exportExcel(rows,  headers, columns, output);


        /**
         * excel导出  query可以为单个表， 或查询sql
         *
         **/
        new PoiAgentExporterApiUtil().export(dataSource, "your_table_name", output);

        new PoiAgentExporterApiUtil().export(dataSource, "your_query_sql", output);

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
         *
         *     A    |   B
         * row1_1   | row1_2
         **/
        Map<String, String[]> parameterMap = new HashMap<>();
        parameterMap.put("column1", new String[]{"row1_1"});
        parameterMap.put("column2", new String[]{"row1_2"});
        new PoiAgentExporterApiUtil().template(parameterMap, output);
    }

    public int template(Map<String, String[]> parameterMap, OutputStream os) throws IOException {
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
        try {
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

    public int export(List<List<String>> matrix, OutputStream response) throws IOException {
        ExcelWriter excelWriter = new ExcelWriter();
        Workbook book = excelWriter.writeMatrix(matrix);
        book.write(response);
        return 1;
    }


    public int export(DataSource dataSource, String query, String[] headersParam, String[] columnsParam, OutputStream os) throws IOException {

        if (query != null && !"".equals(query)) {

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
            if(headersParam != null) {
                for (String header : headersParam) {
                    headers.add(header);
                }
            }

            // columns
            List<String> columns = new ArrayList<>();
            for (String column : columnsParam) {
                columns.add(column);
            }


            ///
            int success = 0;

            try {
                String fileName = tableName;
                if (fileName == null || fileName.length() == 0) {
                    fileName = ExporterParameters.findTablesFromSql(query)[0];
                }

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

    public int export(DataSource dataSource, String querySql, OutputStream os) throws IOException {

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

        try {
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
