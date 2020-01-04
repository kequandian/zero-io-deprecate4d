package com.jfeat.service.impl;

import com.jfeat.poi.agent.PoiAgentExporter;
import com.jfeat.service.ExcelService;
import com.jfeat.service.StatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
    StatisticsMetaService statisticsMetaService;

    @Override
    public ByteArrayInputStream exportExcelFile(String field, Map<String, String[]> requestParameter) {

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            String sql = statisticsMetaService.getSqlByField(field, requestParameter);
            logger.info("excel sql --> {}", sql);
            new PoiAgentExporter().setDataSource(dataSource)
                    .exportWitSql(sql, baos);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return new ByteArrayInputStream(baos.toByteArray());
    }

}
