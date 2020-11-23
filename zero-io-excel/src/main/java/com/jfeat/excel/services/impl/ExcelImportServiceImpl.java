package com.jfeat.excel.services.impl;

import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.common.FileUtil;
import com.jfeat.common.ResourceUtil;
import com.jfeat.excel.constant.ExcelConstant;
import com.jfeat.excel.properties.ExcelProperties;
import com.jfeat.excel.services.ExcelImportService;
import com.jfeat.poi.agent.im.PoiAgentImporterUtil;
import com.jfeat.poi.agent.im.request.PoiAgentImporterRequest;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.mockito.internal.util.io.IOUtil;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.sql.DataSource;
import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.util.Collection;

/**
 * Created on 2020/8/4.
 *
 * @author Wen Hao
 */

@Service
@Slf4j
public class ExcelImportServiceImpl implements ExcelImportService {

    @Resource
    DataSource dataSource;

    @Resource
    ExcelProperties excelProperties;

    @Override
    @SneakyThrows
    public Boolean importExcel(String importName, InputStream inputStream) {

        String templateDirectory = excelProperties.getExcelTemplateDir();
        String templateFileName = importName + ExcelConstant.IMPORT_TEMPLATE_SUFFIX;

        // template file
        String templateFilePath = templateDirectory + File.separator + templateFileName;
        log.info("import template file : {}", templateFilePath);

        // enhance: get template from local file system io resource classpath:
        InputStream templateStream = ResourceUtil.getDefaultResourceFileAsStream(templateFilePath);
        Collection<String> templateLines = IOUtil.readLines(templateStream);
        // end enhance

        // request
        //PoiAgentImporterRequest request = FileUtil.readJsonFile(templateFilePath, PoiAgentImporterRequest.class);
        PoiAgentImporterRequest request = JSONObject.parseObject(templateLines.toString(), PoiAgentImporterRequest.class);


        // import
        int success = new PoiAgentImporterUtil()
                .setDataSource(dataSource)
                .request(request)
                .performImport(inputStream);
        // success 永远是 0
        log.info("success : {}", success);

        return success > 0;
    }


    @SneakyThrows
    private PoiAgentImporterRequest readRequestFile(String fileName) {
        log.info("read file path: {}", fileName);
        String jsonStr = IoUtil.read(new FileReader(new File(fileName)));
        PoiAgentImporterRequest request = JSONObject.parseObject(jsonStr, PoiAgentImporterRequest.class);
        log.info("read request : {}", request);
        return request;
    }
}
