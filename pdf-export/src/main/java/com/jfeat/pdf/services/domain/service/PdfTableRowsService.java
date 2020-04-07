package com.jfeat.pdf.services.domain.service;

import com.jfeat.pdf.services.gen.persistence.model.PdfTable;

import java.util.List;

/**
 * Created on 2020/3/30.
 *
 * @author Wen Hao
 */
public interface PdfTableRowsService {

    List<String> getRowsFromApi(PdfTable pdfTable);

    List<String> getRowsFromStatistics(PdfTable pdfTable);
}
