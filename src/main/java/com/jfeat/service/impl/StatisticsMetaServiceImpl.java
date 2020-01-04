package com.jfeat.service.impl;

import cn.hutool.core.lang.Editor;
import cn.hutool.core.util.ArrayUtil;
import cn.hutool.core.util.StrUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.enums.MetaColumnEnum;
import com.jfeat.model.StatisticsMeta;
import com.jfeat.service.StatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;

/**
 * Created on 2020/1/4.
 *
 * @author Wen Hao
 */
@Service
public class StatisticsMetaServiceImpl implements StatisticsMetaService {
    protected final static Logger logger = LoggerFactory.getLogger(StatisticsMetaServiceImpl.class);

    @Resource
    JdbcTemplate jdbcTemplate;

    private static final String STATICS_META_TABLE_NAME = "st_statistics_meta";

    @Override
    public String getSqlByField(String field, Map<String, String[]> requestParameter) {
        StringBuilder sql = new StringBuilder();

        StatisticsMeta statisticsMeta = getStatisticsMetaByField(field);
        String baseQuery = statisticsMeta.getQuerySql();
        String type = statisticsMeta.getType();
        logger.info("types: {}", type);

        // 替换Sql 中 select  --> select count(*) as total
        String countSql = replaceToCount(baseQuery);
        // 去除所有的‘;’防止拼接出错
        String rawSql = removeSemicolon(baseQuery);
        sql.append(rawSql);

        // 获取执行 count 之后的字段, 并去除 total 字段
        String[] columns = getColumnNames(countSql);
        String[] types = type.split(",");

        if (types.length != columns.length) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "得到的字段数量和类型数量不匹配 请检查sql和type");
        }

        // 字段名和类型 映射
        Map<String, String> columnTypeMap = mapColumnAndType(columns, types);
        logger.info("columnNameTypeMap --> {}", columnTypeMap);

        // 处理search Sql
        processSearchSql(sql, requestParameter, columnTypeMap);

        // 处理order sql
        processOrderSql(sql, columnTypeMap);

        logger.debug("final sql --> {}", sql.toString());
        return sql.toString();
    }

    @Override
    public StatisticsMeta getStatisticsMetaByField(String field) {
        String sql = String.format("select * from %s where %s = '%s'",
                STATICS_META_TABLE_NAME, StatisticsMeta.FIELD, field);

        logger.info("query sql --> {}", sql);

        List<StatisticsMeta> statisticsMetas = jdbcTemplate.query(sql,
                new BeanPropertyRowMapper<StatisticsMeta>(StatisticsMeta.class));
        logger.debug("get Metas --> {}", statisticsMetas);

        if (isEmpty(statisticsMetas)) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE,"查找不到field对应的Meta");
        }
        return statisticsMetas.get(0);
    }

    private void processSearchSql(StringBuilder sql, Map<String, String[]> requestParameter, Map<String, String> columnTypeMap) {
        if (isEmpty(columnTypeMap)) {
            throw new BusinessException(BusinessCode.CRUD_QUERY_FAILURE, "名字类型映射为空");
        }
        // 无误处理sql
        sql.insert(0,"select t.* from(");
        sql.append(")t where 1=1 ");

        for (String column : requestParameter.keySet()) {
            if (columnTypeMap.containsKey(column)) {
                String type = columnTypeMap.get(column);
                String searchSql = sqlSearchByTypeAndColumn(type, column, requestParameter.get(column));
                sql.append(searchSql);
            }
        }
    }

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
        if (type.equals(MetaColumnEnum.STRING.getValue()) && requestValue.length == 1) {
            return String.format(" AND %s LIKE '%%%s%%'", column, requestValue[0]);
        }
        StringBuilder searchSql = new StringBuilder();
        boolean isTimeType = type.equals(MetaColumnEnum.TIME.getValue());
        String regex = isTimeType ? " AND TO_DAYS(%s) >= TO_DAYS('%s')" : " AND %s >= '%s'";

        if (!isEmpty(requestValue[0])) {
            searchSql.append(String.format(regex, column, requestValue[0]));
        }
        if (!isEmpty(requestValue[1])) {
            searchSql.append(String.format(regex, column, requestValue[1]));
        }
        return searchSql.toString();
    }


    private String replaceToCount(String sql) {
        return sql.replaceFirst("(select|SELECT)", "SELECT COUNT(*) AS total,");
    }

    private Boolean isEmpty(List<StatisticsMeta> list) {
        return list == null || list.isEmpty();
    }

    private Boolean isEmpty(Map<String, String> map) {
        return map == null || map.isEmpty();
    }

    private Boolean isEmpty(String string) {
        return StrUtil.isEmpty(string);
    }

    private String removeSemicolon(String string) {
        return StrUtil.removeAll(string, ";");
    }

    private String[] getColumnNames(String sql) {
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(sql);
        String[] columnNames = rowSet.getMetaData().getColumnNames();
        logger.info("columnNames --> {}", Arrays.toString(columnNames));
        return removeTotalColumn(columnNames);
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
     * @param columnNames 字段名
     * @param types 类型
     * @return 映射Map
     */
    private Map<String, String> mapColumnAndType(String[] columnNames, String[] types) {
        return ArrayUtil.zip(columnNames, types);
    }
}
