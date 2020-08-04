package com.jfeat.excel.util;

import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.poi.agent.im.PoiAgentImporterUtil;
import com.jfeat.poi.agent.im.request.PoiAgentImporterRequest;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.sql.SQLException;

/**
 * Created on 2020/7/17.
 *
 * @author Wen Hao
 */

@Slf4j
public class ExcelUtil {

    public static void main(String[] args) throws SQLException, FileNotFoundException {
        /*ImportParams params = new ImportParams();

        List<Map<String, Object>> list = ExcelImportUtil.importExcel(
                new File("excel-templates/equipment.xlsx"), Map.class, params);

        System.out.println(list);*/

        /*
                .setDataSource(dataSource)
                .data(poiAgentImporterRequest)
                .performImport();*/

        /*String uri = "http://39.108.14.206:8070/api/adm/equipment/equipments";
        Map<String, String> map = new HashMap<>();
        map.put("test", "test");
        map.put("xx", "xx");

        String s = HttpUtil.setQueryParams(uri, map);
        System.out.println(s);*/


        // data source
        DriverManagerDataSource dataSource = new DriverManagerDataSource();
        dataSource.setDriverClassName("com.mysql.jdbc.Driver");
        dataSource.setUrl("jdbc:mysql://127.0.0.1:3306/test?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true&useSSL=false");
        dataSource.setUsername("root");
        dataSource.setPassword("root");

        // request
        PoiAgentImporterRequest request = readRequestFile("excel-templates/equipment.json");

        // import
        String fileName = "excel-templates/equipment-data-3.xlsx";
        new PoiAgentImporterUtil()
                .setDataSource(dataSource)
                .request(request)
                .performImport(new FileInputStream(fileName));

    }

    @SneakyThrows
    public static PoiAgentImporterRequest readRequestFile(String fileName) {
        log.info("read file path: {}", fileName);
        String jsonStr = IoUtil.read(new FileReader(new File(fileName)));
        PoiAgentImporterRequest request = JSONObject.parseObject(jsonStr, PoiAgentImporterRequest.class);
        log.info("read request : {}", request);
        return request;
    }

}
