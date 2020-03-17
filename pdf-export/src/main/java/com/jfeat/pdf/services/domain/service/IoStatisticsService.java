package com.jfeat.pdf.services.domain.service;

import com.jfeat.pdf.services.domain.model.IoStatisticsMeta;

import java.util.List;

/**
 * Created on 2020/3/13.
 *
 * @author Wen Hao
 */
public interface IoStatisticsService {

    /**
     * 通过 field 获取 sql
     * @param field field
     * @return sql
     */
    String getSqlByField(String field);

    /**
     *  获取 column 数组
     * @param sql sql
     * @return column 数组
     */
    String[] getColumnNames(String sql);

    /**
     * 通过 field 获取 meta数据
     * @param field field
     * @return meta数据
     */
    IoStatisticsMeta getStatisticsMetaByField(String field);

    List<String> getrowsList(String sql);
}
