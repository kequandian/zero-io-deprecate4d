package com.jfeat.api;

import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.service.ExcelService;
import com.jfeat.service.StatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */

@RestController
@RequestMapping("/api/io/excel")
public class ExcelApi {

    protected final static Logger logger = LoggerFactory.getLogger(ExcelApi.class);

    @javax.annotation.Resource
    ExcelService excelService;

    @javax.annotation.Resource
    StatisticsMetaService statisticsMetaService;

    @GetMapping("/{field}")
    public ResponseEntity<Resource> exportExcelFile(@PathVariable String field, HttpServletRequest request) throws IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));

        ByteArrayInputStream byteStream = excelService.exportExcelFile(field, parameterMap);
        InputStreamResource resource = new InputStreamResource(byteStream);
        return ResponseEntity.ok()
                .header(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", field))
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(resource);
    }

    @GetMapping("/sql/{field}")
    public Tip getSql(@PathVariable String field, HttpServletRequest request) {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));
        return SuccessTip.create(statisticsMetaService.getSqlByField(field, parameterMap));
    }

    private Map<String, List<String>> toPrintMap(Map<String, String[]> parameterMap) {

        Map<String, List<String>> printMap = new HashMap<>();

        for (String key : parameterMap.keySet()) {
            printMap.put(key, Arrays.asList(parameterMap.get(key)));
        }
        return printMap;
    }




}
