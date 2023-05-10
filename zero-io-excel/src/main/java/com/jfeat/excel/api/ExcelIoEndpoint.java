package com.jfeat.excel.api;

import com.jfeat.am.common.annotation.UrlPermission;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.excel.services.ExcelExportService;
import com.jfeat.excel.services.ExcelImportService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */

@RestController
@RequestMapping("/api/io/excel")
public class ExcelIoEndpoint {

    protected final static Logger logger = LoggerFactory.getLogger(ExcelIoEndpoint.class);
//    private static final String API_PREFIX = "/api/adm/stat/meta";

    @Resource
    ExcelExportService excelExportService;

    @Resource
    ExcelImportService excelImportService;

    /**
     * 自动报表专用
     *
     * @param field    从表 st_field_config_meta 获取的字域
     * @param filename 由前端指定下载文件名
     */
    @GetMapping(value = "/{field}")
    public void exportExcelFile(@PathVariable String field, @RequestParam(value = "filename", required = false) String filename, HttpServletRequest request, HttpServletResponse response) throws IOException, IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));

        response.setContentType("application/octet-stream");
        // 完整格式：attachment; filename="filename.xlsx",所以请不要省略\"
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=\"%s.xlsx\"", StringUtils.isEmpty(filename) ? field : filename));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);

        response.getOutputStream().write(excelExportService.autoExport(field).readAllBytes());
    }


    // modelName 用于权限控制
    @UrlPermission
    @PostMapping("/export/{exportName}")
    public void exportExcel(@PathVariable String exportName, @RequestParam(value = "filename", required = false) String filename, HttpServletRequest request, HttpServletResponse response) throws IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));

        response.setContentType("application/octet-stream");
        // 完整格式：attachment; filename="filename.xlsx",所以请不要省略\"
        exportName = new String(exportName.getBytes("UTF-8"), "ISO8859-1");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=\"%s.xlsx\"", StringUtils.isEmpty(filename) ? exportName : filename));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.getOutputStream().write(excelExportService.export(exportName).readAllBytes());
    }


    @UrlPermission
    @PostMapping("/import/{importName}")
    public Tip importExcelFile(@PathVariable String importName, @RequestBody MultipartFile multipartFile) throws Exception {
        assert multipartFile != null;
        return SuccessTip.create(excelImportService
                .importExcel(importName, multipartFile.getInputStream()));
    }

    private Map<String, List<String>> toPrintMap(Map<String, String[]> parameterMap) {
        Map<String, List<String>> printMap = new HashMap<>(parameterMap.size());
        for (String key : parameterMap.keySet()) {
            printMap.put(key, Arrays.asList(parameterMap.get(key)));
        }
        return printMap;
    }


}
