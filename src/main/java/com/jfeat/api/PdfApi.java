package com.jfeat.api;

import com.itextpdf.text.DocumentException;
import com.jfeat.model.PdfData;
import com.jfeat.service.PdfService;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
@RestController
@RequestMapping("/api/io/pdf")
public class PdfApi {

    @javax.annotation.Resource
    PdfService pdfService;

    @GetMapping
    public ResponseEntity<Resource> exportPdfFile(/*@RequestBody PdfData pdfData*/) throws IOException, DocumentException {

        HttpHeaders headers = new HttpHeaders();

        InputStreamResource resource = new InputStreamResource(pdfService.exportPdfFile(null));
        return ResponseEntity.ok().headers(headers)
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=out.pdf")
                .contentType(MediaType.parseMediaType("application/octet-stream"))
                .body(resource);
    }

}
