package com.jfeat.poi.service.impl;

import cn.hutool.core.lang.Editor;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.poi.enums.MetaColumnEnum;
import com.jfeat.poi.model.IOStatisticsMeta;
import com.jfeat.poi.service.IOStatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.lang.reflect.Array;
import java.util.*;

/**
 * Created on 2020/1/4.
 *
 * @author Wen Hao
 */
@Service
public class IOStatisticsMetaServiceImpl implements IOStatisticsMetaService {
    protected final static Logger logger = LoggerFactory.getLogger(IOStatisticsMetaServiceImpl.class);

    @Resource
    JdbcTemplate jdbcTemplate;

    private static final String STATICS_META_TABLE_NAME = "st_statistics_meta";

    @Override
    public String getSqlByField(String field, Map<String, String[]> requestParameter) {
        StringBuilder sql = new StringBuilder();

        // 获取元数据
        IOStatisticsMeta IOStatisticsMeta = getStatisticsMetaByField(field);
        String baseQuery = IOStatisticsMeta.getQuerySql();
        String type = IOStatisticsMeta.getType();
        logger.info("types: {}", type);

        // 去除所有的‘;’防止拼接出错
        String rawSql = removeSemicolon(baseQuery);
        sql.append(rawSql);

        // 获取 column 字段名
        String[] columns = getColumnNames(baseQuery);
        String[] types = type.split(",");

        // 字段名和类型 映射表
        Map<String, String> columnTypeMap = zipColumnAndType(columns, types);
        logger.info("columnNameTypeMap --> {}", columnTypeMap);

        // 处理search sql
        processSearchSql(sql, requestParameter, columnTypeMap);

        logger.info("final sql --> {}", sql.toString());
        return sql.toString();
    }

    @Override
    public IOStatisticsMeta getStatisticsMetaByField(String field) {
        String sql = String.format("select * from %s where %s = '%s'",
                STATICS_META_TABLE_NAME, IOStatisticsMeta.FIELD, field);

        logger.info("query meta sql --> {}", sql);

        List<IOStatisticsMeta> IOStatisticsMetas = jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<IOStatisticsMeta>(IOStatisticsMeta.class));
        logger.debug("get Metas --> {}", IOStatisticsMetas);

        if (isEmpty(IOStatisticsMetas)) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE,"查找不到field对应的Meta");
        }
        return IOStatisticsMetas.get(0);
    }

    /**
     *  处理搜索部分的sql
     * @param sql sql
     * @param requestParameter 搜索参数
     * @param columnTypeMap column type 表
     */
    private void processSearchSql(StringBuilder sql, Map<String, String[]> requestParameter, Map<String, String> columnTypeMap) {
        if (isEmpty(columnTypeMap)) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "名字类型映射为空");
        }
        // 无误处理sql
        sql.insert(0,"select t.* from(");
        sql.append(")t where 1=1 ");

        for (String column : requestParameter.keySet()) {
            logger.info("for each param --> {}", column);
            if (columnTypeMap.containsKey(column)) {
                String type = columnTypeMap.get(column);
                String searchSql = sqlSearchByTypeAndColumn(type, column, requestParameter.get(column));
                logger.info("search sql --> {}", searchSql);
                sql.append(searchSql);
            }
        }
        logger.info("end search sql --> {}", sql.toString());
    }

    /**
     * 处理排序部分的 sql
     * @param sql sql
     * @param columnTypeMap column type 表
     */
    private void processOrderSql(StringBuilder sql, Map<String, String> columnTypeMap) {
        StringBuilder orderSql = new StringBuilder();

        for (String column : columnTypeMap.keySet()) {
            String type = columnTypeMap.get(column);
            if(type.equals(MetaColumnEnum.DECIMAL.getValue())){
                String format = isEmpty(orderSql.toString()) ? " order by %s desc " : ",%s desc ";
                orderSql.append(String.format(format, column));
            }
        }
        logger.info("order sql --> {}", orderSql.toString());
        sql.append(orderSql);
    }

    private String sqlSearchByTypeAndColumn(String type, String column, String[] requestValue) {

        logger.info("requestValue -> {}", Arrays.toString(requestValue));
        if (type.equals(MetaColumnEnum.STRING.getValue()) && requestValue.length == 1) {
            return String.format(" AND %s LIKE '%%%s%%'", column, requestValue[0]);
        }
        StringBuilder searchSql = new StringBuilder();
        boolean isTimeType = type.equals(MetaColumnEnum.TIME.getValue());
        String regex = isTimeType ? " AND TO_DAYS(%s) %s TO_DAYS('%s') " : " AND %s %s '%s'";

        if (requestValue.length > 1) {
            if (!isEmpty(requestValue[0])) {
                // and TO_DAYS(field) >= TO_DAYS('xx')
                searchSql.append(String.format(regex, column, ">=", requestValue[0]));
            }
            if (!isEmpty(requestValue[1])) {
                // and TO_DAYS(field) <= TO_DAYS('xx')
                searchSql.append(String.format(regex, column, "<=", requestValue[1]));
            }
        }
        return searchSql.toString();
    }

    /**
     *  获取 column 数组
     * @param sql sql
     * @return column 数组
     */
    private String[] getColumnNames(String sql) {
        // 替换Sql 中 select  --> select count(*) as total
        String countSql = replaceToCount(sql);
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(countSql);

        List<String> columnLabels = new ArrayList<>();
        // String[] columnNames = rowSet.getMetaData().getColumnNames();
        int columnCount = rowSet.getMetaData().getColumnCount();
        for (int i = 1; i <= columnCount; i++) {
            columnLabels.add(rowSet.getMetaData().getColumnLabel(i));
        }
        logger.info("columnNames --> {}", Arrays.toString(rowSet.getMetaData().getColumnNames()));
        logger.info("columnLabels --> {}", columnLabels);
        return removeTotalColumn(columnLabels.toArray(String[]::new));
    }

    /**
     * 删除 columnNames 数组中的 total 项
     * @param columnNames 字段名
     * @return 更新后字段名数组
     */
    private String[] removeTotalColumn(String[] columnNames) {
        return ArrayUtil.filter(columnNames, (Editor<String>) s -> "total".equals(s) ? null : s);
    }

    /**
     * 将字段名和类型做一个映射
     * @param columnNames 字段名数组
     * @param types 类型数组
     * @return 映射表
     */
    private Map<String, String> zipColumnAndType(String[] columnNames, String[] types) {
        if (types.length != columnNames.length) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "得到的字段数量和类型数量不匹配 请检查sql和type");
        }
        return ArrayUtil.zip(columnNames, types);
    }

    /**
     *  替换sql 为 select count(*),
     *  快速获取一条数据，用于获取 columns 信息
     * @param sql sql
     * @return count(*) sql
     */
    private String replaceToCount(String sql) {
        return sql.replaceFirst("(select|SELECT)", "SELECT COUNT(*) AS total,");
    }

    private String removeSemicolon(String string) {
        return StrUtil.removeAll(string, ";");
    }

    private Boolean isEmpty(List<IOStatisticsMeta> list) {
        return list == null || list.isEmpty();
    }

    private Boolean isEmpty(Map<String, String> map) {
        return map == null || map.isEmpty();
    }

    private Boolean isEmpty(String string) {
        return StrUtil.isEmpty(string);
    }
}
