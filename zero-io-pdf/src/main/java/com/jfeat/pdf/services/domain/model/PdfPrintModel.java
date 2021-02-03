package com.jfeat.pdf.services.domain.model;

import lombok.Data;

/**
 * Created on 2021/2/3 3:56 下午.
 *
 * @author Wen Hao
 */

@Data
public class PdfPrintModel {

    /**
     * 绑定api
     */
    private String api;

    /**
     * 类型 API、STATISTICS
     */
    private String type;

    /**
     * 自动报表的field
     */
    private String field;
    /**
     * 模版内容
     */
    private String templateContent;

    /**
     * 前端模版内容
     */
    private String originConfig;

}
