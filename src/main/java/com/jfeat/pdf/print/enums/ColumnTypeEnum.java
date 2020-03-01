package com.jfeat.pdf.print.enums;

/**
 * Created on 2020/2/16.
 *
 * @author Wen Hao
 */
public enum ColumnTypeEnum {

    // 不处理
    NORMAL("N"),
    // 格式化
    FORMAT("F"),
    // 自定义
    CUSTOM("C");

    private final String value;

    ColumnTypeEnum(String val) {
        this.value = val;
    }

    public String getValue() {
        return value;
    }

    public static ColumnTypeEnum getColumnType(String str) {
        for (ColumnTypeEnum type : values()) {
            if (type.getValue().equals(str)) {
                return type;
            }
        }
        return NORMAL;
    }
}
