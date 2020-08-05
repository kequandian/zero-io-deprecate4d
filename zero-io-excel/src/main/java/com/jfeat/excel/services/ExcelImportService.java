package com.jfeat.excel.services;

import java.io.InputStream;

/**
 * Created on 2020/8/4.
 *
 * @author Wen Hao
 */
public interface ExcelImportService {

    Boolean importExcel(String importName, InputStream inputStream);
}
