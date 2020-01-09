package com.jfeat.poi.service.impl;

import com.jfeat.poi.agent.PoiAgentExporter;
import com.jfeat.poi.service.ExcelService;
import com.jfeat.poi.service.IOStatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.sql.SQLException;
import java.util.Map;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
@Service
public class ExcelServiceImpl implements ExcelService {

    protected final static Logger logger = LoggerFactory.getLogger(ExcelServiceImpl.class);

    @Resource
    DataSource dataSource;

    @Resource
    IOStatisticsMetaService statisticsMetaService;

    @Override
    public ByteArrayInputStream exportExcelFile(String field, Map<String, String[]> requestParameter) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            // 获取sql 语句
            String sql = statisticsMetaService.getSqlByField(field, requestParameter);
            logger.debug("excel sql --> {}", sql);
            // 写入字节流
            new PoiAgentExporter().setDataSource(dataSource)
                    .exportWitSql(sql, baos);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ByteArrayInputStream(baos.toByteArray());
    }

}
