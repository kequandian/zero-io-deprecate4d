package com.jfeat.pdf.services.domain.service;

import java.io.ByteArrayInputStream;

/**
 * Created on 2020/3/13.
 *
 * @author Wen Hao
 */
public interface PdfExportService {

    ByteArrayInputStream export(String tableName);

    ByteArrayInputStream exportMultiApis(String tableName, Long id);

    ByteArrayInputStream exportPreview(String tableName);
}
