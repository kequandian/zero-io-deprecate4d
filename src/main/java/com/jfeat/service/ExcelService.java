package com.jfeat.service;

import javax.servlet.http.HttpServletRequest;
import java.io.ByteArrayInputStream;
import java.util.Map;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
public interface ExcelService {

    /**
     * 生成Excel文件
     * @param field field
     * @param requestParameter requestParameter
     * @return 字节输入流，便于下载
     */
    ByteArrayInputStream exportExcelFile(String field, Map<String, String[]> requestParameter);
}
