package com.jfeat.pdf.api.enums;

/**
 * Created on 2020/3/16.
 *
 * @author Wen Hao
 */
public enum MetaColumnEnum {
    //金钱
    DECIMAL("D"),
    //时间
    TIME("T"),
    //百分比
    PERCENT("P"),
    //数量
    COUNT("C"),
    //字符串
    STRING("S");

    private final String value;

    MetaColumnEnum(String val) {
        this.value = val;
    }

    public String getValue() {
        return value;
    }
}
