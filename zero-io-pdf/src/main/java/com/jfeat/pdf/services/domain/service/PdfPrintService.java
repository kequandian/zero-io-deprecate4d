package com.jfeat.pdf.services.domain.service;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.pdf.services.domain.model.PdfPrintModel;

import java.io.ByteArrayInputStream;

/**
 * Created on 2021/2/3 4:33 下午.
 *
 * @author Wen Hao
 */
public interface PdfPrintService {

    /**
     * 根据名称打印PDF
     * @param name pdf名称
     */
    ByteArrayInputStream print(String name);

    ByteArrayInputStream printPreview(String name);

    Page<PdfPrintModel> queryPdfPrintPage(Page<PdfPrintService> page);
}
