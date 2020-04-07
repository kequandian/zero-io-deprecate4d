package com.jfeat.pdf.api;

import com.jfeat.pdf.services.domain.service.PdfExportService;
import org.springframework.http.HttpHeaders;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;

/**
 * Created on 2020/3/10.
 *
 * @author Wen Hao
 */
@RestController

@RequestMapping("/api/io/pdf/export")
public class PdfExportEndpoint {

    // 导出

    @Resource
    PdfExportService pdfExportService;

    @GetMapping("/{tableName}")
    public void exportPdf(@PathVariable String tableName, HttpServletResponse response, HttpServletRequest request) throws IOException {

        response.setContentType("application/pdf");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=\"%s.pdf\"", URLEncoder.encode(tableName, StandardCharsets.UTF_8)));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        // output
        response.getOutputStream().write(pdfExportService.export(tableName).readAllBytes());
    }

}
