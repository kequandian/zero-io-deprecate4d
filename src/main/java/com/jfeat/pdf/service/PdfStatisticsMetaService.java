package com.jfeat.pdf.service;

import java.util.List;
import java.util.Map;

/**
 * Created on 2020/1/13.
 *
 * @author Wen Hao
 */
public interface PdfStatisticsMetaService {

    /**
     * 获取 columns, 作为 pdf table 的第一行
     * @param sql sql
     * @return columns 列表
     */
    List<String> getTableColumns(String sql);

    /**
     * 返回sql 查询结果
     * @param sql sql
     * @return 查询结果 单行列表
     */
    List<String> getTableData(String sql);
}
