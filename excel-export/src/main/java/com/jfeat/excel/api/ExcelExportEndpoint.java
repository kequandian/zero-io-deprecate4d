package com.jfeat.excel.api;

import com.jfeat.excel.model.ExportParam;
import com.jfeat.excel.services.ExcelService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */

@RestController
@RequestMapping("/api/io/excel")
public class ExcelExportEndpoint {

    protected final static Logger logger = LoggerFactory.getLogger(ExcelExportEndpoint.class);

    @Resource
    ExcelService excelService;

    @GetMapping(value = "/{field}")
    public void exportExcelFile(@PathVariable String field, HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));
        response.setContentType("application/octet-stream");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", field));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.getOutputStream().write(excelService.export(field).readAllBytes());
    }

    @PostMapping("/export")
    public void testExportExcel(@Valid @RequestBody ExportParam exportParam, HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));

        String exportName = exportParam.getExportName();
        response.setContentType("application/octet-stream");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", exportName));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.getOutputStream().write(excelService.export(exportParam).readAllBytes());

    }

    private Map<String, List<String>> toPrintMap(Map<String, String[]> parameterMap) {
        Map<String, List<String>> printMap = new HashMap<>(parameterMap.size());
        for (String key : parameterMap.keySet()) {
            printMap.put(key, Arrays.asList(parameterMap.get(key)));
        }
        return printMap;
    }
}
