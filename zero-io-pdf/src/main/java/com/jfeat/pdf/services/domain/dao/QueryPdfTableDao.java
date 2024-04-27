package com.jfeat.pdf.services.domain.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.pdf.services.domain.model.PdfTableRecord;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Code Generator on 2020-03-13
 */
public interface QueryPdfTableDao extends BaseMapper<PdfTable> {
    List<PdfTableRecord> findPdfTablePage(Page<PdfTableRecord> page, @Param("record") PdfTableRecord record,
                                          @Param("search") String search, @Param("orderBy") String orderBy,
                                          @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    /* @Select("SELECT id, name, template_content FROM io_pdf_table where editable = true") */

    PdfTable findPdfTableByName(@Param("name") String name);

    List<PdfTableRecord> findPdfTableEditablePage(Page<PdfTableRecord> page, @Param("record") PdfTableRecord record,
                                                  @Param("search") String search, @Param("orderBy") String orderBy,
                                                  @Param("startTime") Date startTime, @Param("endTime") Date endTime);
}