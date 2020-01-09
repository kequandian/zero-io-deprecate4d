package com.jfeat.poi.api;

import com.jfeat.poi.service.ExcelService;
import com.jfeat.poi.service.IOStatisticsMetaService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
    IOStatisticsMetaService statisticsMetaService;

    @GetMapping(value = "/{field}")
    public void exportExcelFile(@PathVariable String field, HttpServletRequest request,HttpServletResponse response) throws IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));
        response.setContentType("application/octet-stream");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", field));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.getOutputStream().write(excelService.exportExcelFile(field, parameterMap).readAllBytes());

    }

    private Map<String, List<String>> toPrintMap(Map<String, String[]> parameterMap) {
        Map<String, List<String>> printMap = new HashMap<>(parameterMap.size());

        for (String key : parameterMap.keySet()) {
            printMap.put(key, Arrays.asList(parameterMap.get(key)));
        }
        return printMap;
    }
}
