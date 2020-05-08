package com.jfeat.excel.services;

import java.io.ByteArrayInputStream;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */
public interface ExcelService {

    ByteArrayInputStream export(String field);
}
