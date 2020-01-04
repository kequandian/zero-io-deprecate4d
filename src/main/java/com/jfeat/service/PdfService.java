package com.jfeat.service;

import com.itextpdf.text.DocumentException;
import com.jfeat.model.PdfData;

import java.io.ByteArrayInputStream;
import java.io.FileNotFoundException;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
public interface PdfService {

    /**
     * 生成Pdf文件
     * @param pdfData pdf数据
     * @return 字节输入流，便于下载
     */
    ByteArrayInputStream exportPdfFile(PdfData pdfData) throws FileNotFoundException, DocumentException;
}
