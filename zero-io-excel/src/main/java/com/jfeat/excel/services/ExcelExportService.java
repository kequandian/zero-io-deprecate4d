package com.jfeat.excel.services;

import com.jfeat.excel.model.ExportParam;

import java.io.ByteArrayInputStream;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */
public interface ExcelExportService {

    ByteArrayInputStream export(String field);

    /**
     * 导出excel
     * @param exportParam  - 导出参数
     * @return
     */
    ByteArrayInputStream export(ExportParam exportParam);
}
