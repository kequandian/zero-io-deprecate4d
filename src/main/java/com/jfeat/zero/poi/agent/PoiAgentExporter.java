package com.jfeat.zero.poi.agent;

import com.alibaba.fastjson.JSON;
import com.jfeat.zero.poi.agent.util.DatabaseReadWrite;
import com.jfeat.zero.poi.agent.util.ExcelWriter;
import com.jfeat.zero.poi.agent.util.lang.ExcelException;
import org.apache.poi.ss.usermodel.Workbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.OutputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * Created by vincenthuang on 19/04/2018.
 */
public class PoiAgentExporter implements POIAgent {

    private static final Logger logger = LoggerFactory.getLogger(PoiAgentExporter.class);

    /**
     * export rows to excel workbook
     * @param rows
     * @param headers
     * @param columns
     * @param os
     * @return
     */
    public static int exportExcel(List<Map<String, String>> rows, List<String> headers, List<String> columns, OutputStream os) {
        if (headers == null) {
            headers = new ArrayList<>();
        }
        if (columns == null) {
            columns = new ArrayList<>();
        }
        if(rows==null){
            rows = new ArrayList<>();
        }

        /// check columns
        if (rows.size() > 0 && columns.size() == 0) {
            columns.addAll(rows.get(0).keySet());
        }


        /// start to write
        Workbook workbook = new ExcelWriter()
                .column(columns.toArray(new String[0]))
                .header(headers.toArray(new String[0]))
                .writeBook(rows);
        try {
            workbook.write(os);

        } catch (IOException e) {
            e.printStackTrace();
            throw new ExcelException(e);
        }
        return rows.size();

    }


    /**
     * class PoiAgentExporter
     */
    private DataSource dataSource;

    public PoiAgentExporter setDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
        return this;
    }

    private List<String> headers;
    private List<String> columns;

    public PoiAgentExporter headers(List<String> headers){
        this.headers = headers;
        return this;
    }

    public PoiAgentExporter columns(List<String> columns){
        this.columns = columns;
        return this;
    }


    protected List<Map<String, String>> queryTable(String tableName) throws SQLException{

        Connection connection = dataSource.getConnection();

        if(headers==null && columns!=null){
            headers = columns;
        }
        if(headers!=null && columns!=null){
            /// must equals
            if(headers.size() != columns.size()){
                throw new RuntimeException("headers and columns must be the same quantity");
            }
        }
        if(headers!=null && columns==null){
            throw new RuntimeException("must specify the columns and headers.");
        }

        /// read from database
        DatabaseReadWrite databaseReadWrite = new DatabaseReadWrite();

        if(headers==null) {
            headers = new ArrayList<>();
            List<DatabaseReadWrite.ColumnInfo> infos = databaseReadWrite.getColumnInfo(connection, tableName);

            for (DatabaseReadWrite.ColumnInfo info : infos) {
                headers.add(info.getName());
            }
        }

        /// save data
        List<Map<String, String>> rows = databaseReadWrite.readTable(connection, tableName);
        logger.debug("export rows = {}", JSON.toJSONString(rows));

        return rows;
    }

    public int exportTable(String tableName, OutputStream os) throws SQLException{
        List<Map<String, String>> rows = queryTable(tableName);
        return exportExcel(rows, headers, columns, os);
    }

    public int exportWitSql(String sql, OutputStream os) throws SQLException{
        List<Map<String, String>> rows = querySQL(sql);
        return exportExcel(rows, headers, columns, os);
    }

    protected List<Map<String, String>> querySQL(String sql) throws SQLException{

        Connection connection = dataSource.getConnection();


        if(headers==null && columns!=null){
            headers = columns;
        }
        if(headers!=null && columns!=null){
            /// must equals
            if(headers.size() != columns.size()){
                throw new RuntimeException("headers and columns must be the same quantity");
            }
        }
        if(headers!=null && columns==null){
            throw new RuntimeException("must specify the columns and headers.");
        }

        /// read from database
        DatabaseReadWrite databaseReadWrite = new DatabaseReadWrite();

        /// save data
        List<Map<String, String>> rows = databaseReadWrite.querySQL(connection, sql);
        logger.debug("export rows = {}", JSON.toJSONString(rows));

        if(headers==null) {
            headers = new ArrayList<>();
            if(rows.size()>0){
                headers.addAll(rows.get(0).keySet());
            }
        }

        return rows;
    }
}
