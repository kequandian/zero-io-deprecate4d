package com.jfeat.pdf.service.impl;

import com.jfeat.pdf.service.PdfStatisticsMetaService;
import com.jfeat.poi.service.IOStatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created on 2020/1/13.
 *
 * @author Wen Hao
 */
@Service
public class PdfStatisticsMetaServiceImpl implements PdfStatisticsMetaService {

    private final static Logger logger = LoggerFactory.getLogger(PdfStatisticsMetaServiceImpl.class);

    @Resource
    JdbcTemplate jdbcTemplate;

    @Resource
    IOStatisticsMetaService ioStatisticsMetaService;

    @Override
    public List<String> getTableColumns(String sql) {
        return getColumnNames(sql);
    }

    @Override
    public List<String> getTableData(String sql) {
        List<String> data = new ArrayList<>();
        jdbcTemplate.query(sql, (rs, rowNum) -> {
            for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++){
                data.add(rs.getString(i));
            }
            return null;
        });
        logger.info("data list --> {}", data);

        return data;
    }

    /**
     *  获取 column 数组
     * @param sql sql
     * @return column 数组
     */
    private List<String> getColumnNames(String sql) {
        // 替换Sql 中 select  --> select count(*) as total
        String countSql = replaceToCount(sql);
        SqlRowSet rowSet = jdbcTemplate.queryForRowSet(countSql);

        List<String> columnLabels = new ArrayList<>();
        int columnCount = rowSet.getMetaData().getColumnCount();
        for (int i = 1; i <= columnCount; i++) {
            columnLabels.add(rowSet.getMetaData().getColumnLabel(i));
        }
        logger.info("columnLabels --> {}", columnLabels);
        return removeTotalColumn(columnLabels);
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

    /**
     * 删除 columnNames 数组中的 total 项
     * @param columnNames 字段名
     * @return 更新后字段名数组
     */
    private List<String> removeTotalColumn(List<String> columnNames) {
        return columnNames.stream()
                .filter(column -> !"total".equals(column))
                .collect(Collectors.toList());
    }
}
