package com.jfeat.pdf.service;


import java.io.ByteArrayInputStream;
import java.util.Map;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
public interface PdfService {

    /**
     * 生成Pdf文件
     * @param field field
     * @param requestParameter request 参数
     * @return 字节输入流，用于下载
     */
    ByteArrayInputStream exportPdfFile(String field, Map<String, String[]> requestParameter);

}
