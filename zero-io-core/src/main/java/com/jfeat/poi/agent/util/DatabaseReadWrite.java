package com.jfeat.poi.agent.util;

import com.alibaba.fastjson.JSON;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.poi.agent.im.request.Option;
import com.jfeat.poi.agent.im.request.TableTarget;
import com.jfeat.poi.agent.util.converter.ValueConverter;
import com.jfeat.poi.agent.util.lang.ExcelException;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.math.BigDecimal;
import java.sql.*;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import static com.jfeat.poi.agent.util.ExcelContentRowsUtil.*;
import static com.jfeat.poi.agent.util.PostfixUtil.postfixDuplicateContentRows;

/**
 * Created by Silent-Y on 2017/9/28.
 * <p>
 * List<List>是Excel表中读取的数据，header是指excel表格中是否存在表头
 * true为有表头，则过滤第一行数据，由第二行数据开始生成sql语句；false则相反
 */
public class DatabaseReadWrite {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseReadWrite.class);

    private String[] primaryKeySet;

    private IdWorker idWorker = new IdWorker();


    /**
     * 从数据库中读取整张表的数据行
     * @param connection
     * @param tableName
     * @return
     */
    public List<Map<String, String>> readTable(Connection connection, String tableName) {
        List<Map<String, String>> result = new ArrayList<>();

        /// options can be remove here
        Map<String, String> options = new HashMap<>();

        PreparedStatement preparedStatement = null;
        ResultSet rs = null;
        try {
            StringBuilder sql = new StringBuilder("SELECT * FROM " + tableName);
            List<String> values = new ArrayList<>();
            if (options != null && options.size() > 0) {
                sql.append(" WHERE ");
                int index = 0;
                for (Map.Entry<String, String> entry : options.entrySet()) {
                    sql.append(entry.getKey());
                    sql.append(" = ? ");
                    index += 1;
                    if (index < options.size()) {
                        sql.append(" AND ");
                    }
                    values.add(entry.getValue());
                }
            }
            preparedStatement = connection.prepareStatement(sql.toString());
            for (int i = 0; i < values.size(); i++) {
                preparedStatement.setObject(i + 1, values.get(i));
            }
            rs = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            int columnCount = resultSetMetaData.getColumnCount();
            while (rs.next()) {
                Map<String, String> map = new LinkedHashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    map.put(resultSetMetaData.getColumnName(i), rs.getObject(i) == null ? "" : rs.getObject(i).toString());
                }
                result.add(map);
            }

            return result;


        } catch (SQLException e) {
            logger.error(e.getMessage());
            throw new ExcelException(e);
        }
    }


    /**
     * 从数据库中读取查询语句返回的数据行
     * @param connection
     * @param sql
     * @return
     * @throws SQLException
     */
    public List<Map<String, String>> querySQL(Connection connection, String sql) throws SQLException {
        List<Map<String, String>> result = new ArrayList<>();

        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = null;
        try {
            rs = preparedStatement.executeQuery();
            ResultSetMetaData resultSetMetaData = rs.getMetaData();
            int columnCount = resultSetMetaData.getColumnCount();
            while (rs.next()) {
                Map<String, String> map = new LinkedHashMap<>();
                for (int i = 1; i <= columnCount; i++) {
                    map.put(resultSetMetaData.getColumnLabel(i), rs.getObject(i) == null ? "" : rs.getObject(i).toString());
                }
                result.add(map);
            }

            return result;

        } catch (SQLException e) {
            logger.error(e.getMessage());
            throw new ExcelException(e);
        }
    }

    /**
     * 从数据库中查找 与所有导入 contents 行 重复的行
     * @param connection
     * @param tableName
     * @param fields   指它相对应的数据库域
     * @param unique  唯一项组合列表
     * @param contents  从excel读取的内容行
     * @return
     * @throws SQLException
     */
    protected List<List<String>> queryDuplicateContents(Connection connection, String tableName, List<String> fields, List<String> unique,
                                                        List<List<String>> contents) throws SQLException {

        List<List<String>> duplicateOnes = new ArrayList<>();

        /// 如果duplication为空，则需要对所有项进行查询，判读是否所有项完全一致, 查询逻辑为  AND
        /// 如果duplication不为空，则仅需判断指定的唯一属性项是否已存在, 查询逻辑为  OR

        //List<String> checkFields = unique == null ? fields : unique;
        final String OP = unique == null ? " AND " : " AND ";  ///都用 AND 逻辑
        Set<String> selectSet = new HashSet<>();
        if(unique!=null && unique.size()>0){
            for (String filed:unique){
                selectSet.addAll(Arrays.asList(filed.split(TableTarget.UNIQUE_SEPARATE)));
            }
        }else{
            selectSet.addAll(fields);
        }


        StringBuilder sqlStr = new StringBuilder("SELECT ");
        for (String field : selectSet) {
            if (field != null && field.length() > 0) {
                sqlStr.append("`");
                sqlStr.append(field);
                sqlStr.append("`");
                sqlStr.append(",");
            }
        }
        sqlStr.deleteCharAt(sqlStr.length() - 1);  // remove ","

        sqlStr.append(" FROM ");
        sqlStr.append(tableName);
        sqlStr.append(" WHERE ");

        if(unique!=null && unique.size()>0){
        for (String filed:unique){
            sqlStr.append("(");
            for(String fieldChi:filed.split(TableTarget.UNIQUE_SEPARATE)){

                if (fieldChi != null && fieldChi.length() > 0) {
                    sqlStr.append("`");
                    sqlStr.append(fieldChi);
                    sqlStr.append("` = ?");
                    sqlStr.append(OP);
                }
                sqlStr.delete(sqlStr.length() - OP.length(), sqlStr.length() - 1);

            }
            sqlStr.append(")");
            sqlStr.append(" or ");
        }
        }
        sqlStr.delete(sqlStr.length() - " or ".length(), sqlStr.length() - 1);
        sqlStr.append(" LIMIT 1");
        logger.debug("SQL: {}", sqlStr.toString());

        PreparedStatement preparedStatement = connection.prepareStatement(sqlStr.toString());

        int dataSize = contents.size();
        for (int i = 0; i < dataSize; i++) {

            List<String> currentRow = contents.get(i);

            /// set values
            int n = 0;
            if(unique!=null && unique.size()>0) {
                for (String field : unique) {
                    for (String checkField : field.split(TableTarget.UNIQUE_SEPARATE)) {
                        String value = null;
                        {
                            if (checkField != null && checkField.length() > 0) {

                                int index = fields.indexOf(checkField);
                                if (index >= 0) {
                                    value = currentRow.get(index);
                                }
                                preparedStatement.setObject(n + 1, value);
                                n++;
                            }
                        }
                    }

                }
            }

            List<String> row = new ArrayList<>();

            ResultSet rs = preparedStatement.executeQuery();
            int columnCount = rs.getMetaData().getColumnCount();
            while (rs.next()) {

                for (int c = 0; c < columnCount; c++) {
                    Object value = rs.getObject(c + 1);
                    if (value == null) {
                        value = "";
                    }
                    row.add(String.valueOf(value));
                }
            }

            if (row.size() > 0) {
                duplicateOnes.add(row);
            }
        }

        return duplicateOnes;
    }




    /**
     * @param connection      database connection
     * @param tableName       database table
     * @param fields          database table fields
     * @param overwrite       overwrite the row if the unique field exists
     * @param contents        the excel content ti write into database
     * @param duplicate       duplicate row (all fields value equals) is allowed or not
     * @param valueConverters value converter for each field  [not used]
     * @return
     */
    public int writeTable(Connection connection, String tableName, List<String> fields, List<String> uniqueList, boolean overwrite,
                          boolean duplicate,
                          List<List<String>> contents, Map<String, ValueConverter> valueConverters
                          , Option option) {

        try {
                if(uniqueList!=null && uniqueList.size()>0){
                    for (String uniques:uniqueList){
                    //获取唯一键列表
                    List<String> unique = Arrays.asList(uniques.split(":"));
                    String type = null;
                    if(option!=null){type=option.getType();}else{type=TableTarget.UPDATE;}
                    if(!StringUtils.isEmpty(type)&& type.equals(TableTarget.POSTFIX)){

                        List<List<String>> temp = postfixDuplicateContentRows(contents, fields, unique,option);
                        contents = temp;
                    }
                    //重复则去掉
                    //循环唯一键
                    else{

                         /// below merge duplicate rows
                         {
                             //merge duplicate rows with unique within contents
                             contents = mergeDuplicateContentRows(contents, fields, unique);
                             /// merge entirely rows within contents
                             if (!duplicate) {
                                 contents = mergeDuplicateContentRows(contents);
                             }
                         }
                    }


                }
                }


            primaryKeySet = getPrimaryKey(connection, tableName);

            ///如果包含主键
            if (primaryKeySet != null && fields.contains(primaryKeySet[0])) {
                if (uniqueList == null) {
                    uniqueList = new ArrayList<>();
                    uniqueList.add(primaryKeySet[0]);
                }
                return update(connection, tableName, fields, uniqueList, contents, valueConverters);

            } else if (uniqueList != null && uniqueList.size() > 0) {
                /// no primary key

                /// 仅包含重复字段
                List<List<String>> duplicateFieldsData = queryDuplicateContents(connection, tableName, fields, uniqueList, contents);

                // 通过重复字找到相同的项
                List<List<String>> duplicateRows = findDuplicateRows(contents, fields, duplicateFieldsData, uniqueList);

                // 移走在数据库里已存在的项，无需加入
                List<List<String>> insertedRows = subContentRows(contents, duplicateRows);

                /// insert new
                if (insertedRows != null && insertedRows.size() > 0) {
                    return insert(connection, tableName, fields, insertedRows, valueConverters);
                }

                /// update duplicate ones
                if (overwrite) {
                    if (duplicateRows != null && duplicateRows.size() > 0) {
                        return update(connection, tableName, fields, uniqueList, duplicateRows, valueConverters);
                    }
                }

            } else if (uniqueList == null) {
                /// check whether allow duplicate row
                if (duplicate) {
                    if (contents != null && contents.size() > 0) {
                        return insert(connection, tableName, fields, contents, valueConverters);
                    }

                } else {
                    /// not allow duplicate, skip the duplicate

                    List<List<String>> duplicateData = queryDuplicateContents(connection, tableName, fields, null, contents);

                    /// insert new
                    List<List<String>> duplicateRows = findDuplicateRows(contents, fields, duplicateData, null);
                    List<List<String>> insertedRows = subContentRows(contents, duplicateRows);

                    if (insertedRows != null && insertedRows.size() > 0) {
                        return insert(connection, tableName, fields, insertedRows, valueConverters);
                    }
                }
            }

        } catch (SQLException ex) {
            logger.error(ex.getMessage());
            ex.printStackTrace();
            try {
                connection.rollback();
            } catch (SQLException e) {
                logger.error(ex.getMessage());
                e.printStackTrace();
            }
        }

        return 0;
    }


    private int insert(Connection connection, String tableName, List<String> fields,
                       List<List<String>> contents, Map<String, ValueConverter> valueConverterMap) throws SQLException {
        List<ColumnInfo> columnInfos = getColumnInfo(connection, tableName);
        int fieldSize = fields.size();
        int dataSize = contents.size();
        Object[][] preparedStatementValues = getPreparedStatementValues(columnInfos, fields, contents);

        /// append primary key
        boolean requireInsertPrimaryKey = checkRequireInsertPrimaryKey(fields);

        StringBuilder sqlStr = new StringBuilder("INSERT INTO `");
        sqlStr.append(tableName);
        sqlStr.append("` (");

        if (requireInsertPrimaryKey) {
            sqlStr.append("`");
            sqlStr.append(primaryKeySet[0]);
            sqlStr.append("`");
            sqlStr.append(", ");
        }

        int fieldCount = 0;
        for (int i = 0; i < fieldSize; i++) {
            String field = fields.get(i);
            if (field != null && field.length() > 0) {
                sqlStr.append("`");
                sqlStr.append(fields.get(i));
                sqlStr.append("`");
                sqlStr.append(",");
                fieldCount++;
            }
        }
        sqlStr.deleteCharAt(sqlStr.length() - 1);

        sqlStr.append(") VALUES (");
        if (requireInsertPrimaryKey) {
            sqlStr.append("?,");
        }
        for (int i = 0; i < fieldCount; i++) {
            sqlStr.append("?");
            sqlStr.append(",");
        }
        sqlStr.deleteCharAt(sqlStr.length() - 1);
        sqlStr.append(")");
        logger.debug("SQL: {}", sqlStr.toString());

        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStr.toString());


        for (int row = 0; row < dataSize; row++) {
            int e = 0;

            /// set primary id
            if (requireInsertPrimaryKey) {
                preparedStatement.setObject(1, idWorker.nextId());
                e++;
            }

            /// check if all values are empty, then ignore the empty rows
            StringBuilder checkEmptyValues = new StringBuilder();

            for (int k = 0, n = 0; k < fieldSize; k++) {
                String field = fields.get(k);
                if (field != null && field.length() > 0) {
                    ValueConverter converter = valueConverterMap == null ? null : valueConverterMap.get(field);
                    Object value = converter == null ? preparedStatementValues[row][n] : converter.convert(preparedStatementValues[row][n]);
                    //parameters.add(String.valueOf(value));
                    n++;

                    preparedStatement.setObject(e + 1, value);
                    e++;

                    /// check if all values are empty, then ignore the empty rows
                    if(!field.equals(primaryKeySet[0])) {
                        checkEmptyValues.append( value==null?"":value);
                    }
                }
            }
            //logger.debug("Parameters: {}", StringUtils.join(parameters, ","));

            /// check if all values are empty, then ignore the empty rows
            if(checkEmptyValues.length()>0) {
                preparedStatement.addBatch();
            }
            //if (row % 1000 == 0) {
            //    preparedStatement.executeBatch();
            //}
        }

        int[] result = preparedStatement.executeBatch();
        connection.commit();

        if (result == null) {
            return 0;
        }

        return result.length;
    }

    private int update(Connection connection, String tableName, List<String> fields, List<String> unique,
                       List<List<String>> contents, Map<String, ValueConverter> valueConverterMap) throws SQLException {
        List<ColumnInfo> columnInfos = getColumnInfo(connection, tableName);
        int fieldSize = fields.size();
        int dataSize = contents.size();
        Object[][] preparedStatementValues = getPreparedStatementValues(columnInfos, fields, contents);

        StringBuilder baseSqlStr = new StringBuilder("UPDATE `");
        baseSqlStr.append(tableName);
        baseSqlStr.append("` SET ");
        for (int i = 0; i < fieldSize; i++) {
            String field = fields.get(i);
            if(field!=null && field.length()>0) {
                baseSqlStr.append("`");
                baseSqlStr.append(field);
                baseSqlStr.append("` = ?");
                if (i != (fieldSize - 1)) {
                    baseSqlStr.append(", ");
                }
            }
        }
        StringBuilder sqlStr = new StringBuilder(baseSqlStr);
        sqlStr.append(" WHERE ");
        if(unique!=null) {
            for (String uniques : unique){
            sqlStr.append("(");
                for (String field : uniques.split(TableTarget.UNIQUE_SEPARATE)) {
                    sqlStr.append("`");
                    sqlStr.append(field);
                    sqlStr.append("` = ?");
                    sqlStr.append(" AND ");
                }
            sqlStr.delete(sqlStr.length() - " AND ".length(), sqlStr.length() - 1);
            sqlStr.append(")");
            sqlStr.append(" or ");
            }
            sqlStr.delete(sqlStr.length() - " or ".length(), sqlStr.length() - 1);
        }else{
            /*for (String field : unique) {
                sqlStr.append(field);
                sqlStr.append("` = ?");
                sqlStr.append(" AND ");
            }
            sqlStr.delete(sqlStr.length() - " AND ".length(), sqlStr.length() - 1);*/
            throw new RuntimeException("NotImplemented: unique fields must be set set.");
        }

        logger.debug("SQL: {}", sqlStr.toString());


        connection.setAutoCommit(false);
        PreparedStatement preparedStatement = connection.prepareStatement(sqlStr.toString());

        for (int j = 0; j < dataSize; j++) {
            int e = 0;
            //List<String> parameters = new ArrayList<>();
            for (int k = 0, n = 0; k < fieldSize; k++) {
                String field = fields.get(k);
                if(field!=null && field.length()>0) {
                    ValueConverter converter = valueConverterMap != null ? valueConverterMap.get(field) : null;
                    Object value = converter == null ? preparedStatementValues[j][n] : converter.convert(preparedStatementValues[j][n]);
                    n++;

                    //parameters.add(String.valueOf(value));
                    preparedStatement.setObject(e + 1, value);
                    e++;
                }
            }
            //int primaryKeyIndex = fields.indexOf(primaryKeySet[0]);
            //Object value = primaryKeyIndex>=0 ? content.get(primaryKeyIndex) : null;
            //parameters.add(String.valueOf(value));
            //preparedStatement.setObject(e + 1, value);

            // 设置 WHERE 字段
            List<String> row = contents.get(j);
            for(String uni : unique){
                for (String field:uni.split(TableTarget.UNIQUE_SEPARATE)) {
                    String value = getFieldValue(row, fields, field);
                    if (value != null && value.length()>0) {
                        preparedStatement.setObject(e + 1, value);
                    }else{
                        preparedStatement.setObject(e + 1, "",  JDBCType.VARCHAR);
                        //throw new RuntimeException("fatal: unique field value must not be empty");
                    }
                    e++;
                }
            }


            //logger.debug("Parameters: {}", StringUtils.join(parameters, ","));

            preparedStatement.addBatch();
            //if (j % 1000 == 0) {
            //    preparedStatement.executeBatch();
            //}
        }

        preparedStatement.executeBatch();
        connection.commit();

        return 0;
    }

    private String getFieldValue(List<String> row, List<String> fields, String field) {
        int fieldIndex = fields.indexOf(field);
        if (fieldIndex >= 0) {
            return row.get(fieldIndex);
        }
        return null;
    }


    private boolean checkRequireInsertPrimaryKey(List<String> fields) {
        boolean requireInsertPrimaryKey = false;
        if (primaryKeySet != null && !fields.contains(primaryKeySet[0]) && (primaryKeySet[1] == null || primaryKeySet[1].length() == 0)) {
            requireInsertPrimaryKey = true;
        }
        return requireInsertPrimaryKey;
    }

    private static DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public static List<List<String>> queryContentsFromTable(Connection connection, String tableName, Map<String, String> options, List<String> fieldNames) throws SQLException {
        StringBuilder sql = null;
        if (fieldNames != null && fieldNames.size() > 0) {
            String sqlTemp = "";
            for (String field : fieldNames) {
                if(field!=null && field.length()>0) {
                    sqlTemp += "," + field;
                }
            }
            sql = new StringBuilder("SELECT " + sqlTemp.substring(1) + " FROM " + tableName);
        } else {
            sql = new StringBuilder("SELECT * FROM " + tableName);
        }

        List<String> values = new ArrayList<>();
        if (options != null && options.size() > 0) {
            sql.append(" WHERE ");
            int index = 0;
            for (Map.Entry<String, String> entry : options.entrySet()) {
                sql.append(entry.getKey());
                sql.append(" = ? ");
                index += 1;
                if (index < options.size()) {
                    sql.append(" AND ");
                }
                values.add(entry.getValue());
            }
        }
        logger.debug("sql{}", sql.toString());
        PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());

        /// set values
        for (int i = 0; i < values.size(); i++) {
            preparedStatement.setObject(i + 1, values.get(i));
        }

        ResultSet resultSet = preparedStatement.executeQuery();
        List<List<String>> list = new ArrayList<>();
        while (resultSet.next()) {
            List<String> tempList = new ArrayList<>();
            int columnCount = resultSet.getMetaData().getColumnCount();
            for (int i = 1; i <= columnCount; i++) {
                Object object = resultSet.getObject(i);
                if(object==null){
                    tempList.add("");
                }else{
                    /// format datetime
                    if(object instanceof Timestamp || object instanceof Date){
                        String val = dateFormat.format(object);
                        tempList.add(val);
                    }else {
                        tempList.add(object.toString());
                    }
                }
            }
            list.add(tempList);
        }
        return list;
    }

    public static int updateTable(Connection connection, String tableName, Map<String, Object> updates, Map<String, Object> wheres) throws SQLException {
        StringBuilder stringBuilder = new StringBuilder("UPDATE " + tableName + " set ");
        int index = 0;
        List<String> values = new ArrayList<>();
        for (Map.Entry<String, Object> entry : updates.entrySet()) {
            stringBuilder.append(entry.getKey());
            stringBuilder.append(" = ? ");
            index += 1;
            if (index < updates.size()) {
                stringBuilder.append(",");
            }
            values.add(entry.getValue()==null?"":entry.getValue().toString());
        }

        if(wheres!=null) {
            stringBuilder.append(" WHERE ");

            for (Map.Entry<String, Object> entry : wheres.entrySet()) {
                stringBuilder.append(entry.getKey());
                stringBuilder.append(" = ? ");
                index += 1;
                if (index < updates.size()) {
                    stringBuilder.append(",");
                }
                values.add(entry.getValue()==null?"":entry.getValue().toString());
            }
        }

        logger.debug("sql {}", stringBuilder.toString());

        PreparedStatement preparedStatement = connection.prepareStatement(stringBuilder.toString());

        for (int i = 0; i < values.size(); i++) {
            preparedStatement.setObject(i + 1, values.get(i));
        }

        int success = preparedStatement.executeUpdate();
        if (!connection.getAutoCommit())
            connection.commit();
        return success;

    }

    @Deprecated
    private String buildQuerySql(Connection connection, String tableName, Map<String, String> options) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT * FROM " + tableName);
        List<String> values = new ArrayList<>();
        if (options != null && options.size() > 0) {
            sql.append(" WHERE ");
            int index = 0;
            for (Map.Entry<String, String> entry : options.entrySet()) {
                sql.append(entry.getKey());
                sql.append(" = ? ");
                index += 1;
                if (index < options.size()) {
                    sql.append(" and ");
                }
                values.add(entry.getValue());
            }
        }

        PreparedStatement preparedStatement = connection.prepareStatement(sql.toString());

        /// set values
        for (int i = 0; i < values.size(); i++) {
            preparedStatement.setObject(i + 1, values.get(i));
        }

        return sql.toString();
    }


    /**
     * 返回数据库里该表的字段类型和字段名称
     *
     * @param connection
     * @param tableName
     * @return
     * @throws SQLException
     */
    public List<ColumnInfo> getColumnInfo(Connection connection, String tableName) throws SQLException {
        String sql = "SELECT * FROM `" + tableName + "` LIMIT 1";
        PreparedStatement preparedStatement = connection.prepareStatement(sql);
        ResultSet rs = preparedStatement.executeQuery();
        ResultSetMetaData resultSetMetaData = rs.getMetaData();
        int colunmCount = resultSetMetaData.getColumnCount();
        List<ColumnInfo> columnInfos = new ArrayList<>();
        for (int i = 0; i < colunmCount; i++) {
            ColumnInfo columnInfo = new ColumnInfo(resultSetMetaData.getColumnTypeName(i + 1), resultSetMetaData.getColumnName(i + 1));
            columnInfos.add(columnInfo);
        }
        return columnInfos;
    }


    /**
     * get primary key
     *
     * @param connection
     * @param table
     * @return
     * @throws SQLException
     */
    private String[] getPrimaryKey(Connection connection, String table) throws SQLException {
        ResultSet pkRSet = connection.getMetaData().getPrimaryKeys(null, null, table);
        if (pkRSet.next()) {
            String pk = pkRSet.getString("COLUMN_NAME");
            String auto = "";
            try {
                auto = pkRSet.getString("IS_AUTOINCREMENT");
            } catch (SQLException e) {
            }
            return new String[]{pk, auto};
        }
        return null;
    }

    private String getColumnType(List<ColumnInfo> columnInfos, String columnName) {
        for (int i = 0; i < columnInfos.size(); i++) {
            if (columnInfos.get(i).getName().equals(columnName)) {
                return columnInfos.get(i).getType();
            }
        }
        return null;
    }

    private Object[][] getPreparedStatementValues(List<ColumnInfo> columnInfos, List<String> fields, List<List<String>> contents) {
        int fieldSize = fields.size();
        int dataSize = contents.size();
        Object[][] preparedStatementValues = new Object[dataSize][fieldSize];
        for (int j = 0; j < dataSize; j++) {
            List<String> content = contents.get(j);
            logger.debug("content[{}] = {}", j, JSON.toJSONString(content));
            for (int k = 0, n = 0; k < fieldSize; k++) {
                String value = k < content.size() ? content.get(k) : null;
                String columnName = fields.get(k);
                if (columnName != null && columnName.length() > 0) {
                    String columnType = getColumnType(columnInfos, columnName);
                    logger.debug("columnName = {},columnType= {}, value = {}", columnName,columnType, value);
                    try {
                        if ("INT".equals(columnType)) {
                            Integer res = value != null && !"".equals(value) ? Integer.parseInt(value) : null;
                            preparedStatementValues[j][n] = res;
                        } else if ("BIGINT".equals(columnType)) {
                            Long res = value != null && !"".equals(value) ? Long.parseLong(value) : null;
                            preparedStatementValues[j][n] = res;
                        } else if ("DECIMAL".equals(columnType)) {
                            BigDecimal res = value != null && !"".equals(value) ? BigDecimal.valueOf(Double.parseDouble(value)) : null;
                            preparedStatementValues[j][n] = res;
                        } else if ("DATE".equals(columnType) || "DATETIME".equals(columnType)) {
                            //时间类型 为空的时候进行转换为NULL
                            String res = value != null && !"".equals(value) ? value : null;
                            logger.info("==== Data res: {}",res);

                            if(!StringUtils.isEmpty(res)){

                                //为日期格式 yyyy-mm-dd
                                if(isDate(res)){
                                    preparedStatementValues[j][n] = res;
                                    }
                                else {

                                        //为数字格式 时间戳
                                        if(isInteger(res)){
                                            Date date = HSSFDateUtil.getJavaDate(Double.parseDouble(res));
                                            res = getTime(date);
                                            preparedStatementValues[j][n] = res;
                                        }else{
                                            res = null;
                                            preparedStatementValues[j][n] = res;
                                        }
                                     }
                              } else {
                                preparedStatementValues[j][n] = res;
                              }
                        }else{
                            String res = value != null && !"".equals(value) ? value : null;
                            preparedStatementValues[j][n] = res;
                        }

                        n++;
                    }catch (Exception e){
                        StringBuilder message = new StringBuilder();
                        message.append(e.getMessage()).append("column={%s},row={%s},content={%s}");
                        throw new BusinessException(BusinessCode.BadRequest.getCode(), String.format(message.toString(), j+1,n+1,value));
                    }

                }
            }
        }
        return preparedStatementValues;
    }

    //判断是否为时间 yyyy-mm-dd
    public boolean isDate(String date) {
        //定义匹配规则
        String path="\\d{4}-\\d{1,2}-\\d{1,2}";
        //实例化Pattern
        Pattern p= Pattern.compile(path);
        //验证字符串
        Matcher m=p.matcher(date);
        if(m.matches()){
            return true;
        }
        return false;
    }

    //判断是否为纯数字
    public boolean isInteger(String num) {
        //定义匹配规则
        String path="\\d*";
        //实例化Pattern
        Pattern p= Pattern.compile(path);
        //验证字符串
        Matcher m=p.matcher(num);
        if(m.matches()){
            return true;
        }
        return false;
    }

    /**
     * 获取时间
     */
    public static String getTime(Date date) {
        String format = "yyyy-MM-dd";
        SimpleDateFormat sdf = new SimpleDateFormat(format);
        return sdf.format(date);
    }

    /**
     * class ColumnInfo
     */
    public static class ColumnInfo {
        private String type;
        private String name;

        public ColumnInfo() {
        }

        public ColumnInfo(String type, String name) {
            this.type = type;
            this.name = name;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }
    }
}
