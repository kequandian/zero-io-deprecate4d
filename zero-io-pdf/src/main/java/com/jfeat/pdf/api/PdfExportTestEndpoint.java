package com.jfeat.pdf.api;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.pdf.services.domain.service.PdfPrintService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Map;

/**
 * Created on 2021/2/3 5:55 下午.
 *
 * @author Wen Hao
 */
@RestController
@RequestMapping("/api/io/pdf/export/test")
public class PdfExportTestEndpoint {

    @Resource
    PdfPrintService pdfPrintService;

    @GetMapping("/{tableName}")
    public Tip exportPdf(@PathVariable String tableName, HttpServletResponse response, HttpServletRequest request) throws IOException {
        pdfPrintService.print(tableName);
        return SuccessTip.create();
    }

    @GetMapping
    public Tip testData() {
        Page<Map<String, String>> mapPage = new Page<>();
        mapPage.setTotal(10);
        mapPage.setRecords(List.of(Map.of("id", "1", "name", "eric")));
        return SuccessTip.create(mapPage);
    }
}
