package com.jfeat.excel.constant;

/**
 * Created on 2020/8/7.
 *
 * @author Wen Hao
 */
public interface ExcelConstant {

    /**
     * sql 查询方式导出Excel
     */
    String SQL_EXPORT = "SQL";

    /**
     * api 请求方式导出Excel
     */
    String API_EXPORT = "API";

    /**
     * 导入模版文件后缀
     */
    String IMPORT_TEMPLATE_SUFFIX = ".json";

    /**
     * 导出模版文件后缀
     */
    String EXPORT_TEMPLATE_SUFFIX = ".xlsx";

    /**
     * 导出字段转换字段
     */
    String EXPORT_DICT_SUFFIX = ".json";

    String EXPORT_SQL_SUFFIX = ".sql";

    /**
     * SQL模版的替换前缀，同时也是注释
     */
    String EXPORT_SQL_REPLACE_PREFIX = "--";

    /**
     * SQL模版替换格式, #{replace}
     */
    String EXPORT_SQL_REPLACE_FORMAT = "#{%s}";

    String NEW_LINE = "\n";
}
