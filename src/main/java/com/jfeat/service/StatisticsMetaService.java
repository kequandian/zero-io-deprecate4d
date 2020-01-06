package com.jfeat.service;

import com.jfeat.model.StatisticsMeta;

import java.util.Map;

/**
 * Created on 2020/1/4.
 *
 * @author Wen Hao
 */
public interface StatisticsMetaService {

    /**
     * 通过 field 获取 sql
     * @param field field
     * @param requestParameter 查询参数
     * @return sql
     */
    String getSqlByField(String field, Map<String, String[]> requestParameter);

    /**
     * 通过 field 获取 meta数据
     * @param field field
     * @return meta数据
     */
    StatisticsMeta getStatisticsMetaByField(String field);
}
