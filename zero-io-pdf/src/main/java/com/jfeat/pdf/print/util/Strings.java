package com.jfeat.pdf.print.util;

/**
 * Created by vincent on 2018/9/29.
 */
public class Strings {

    /**
     * 字符行数 与 列数 对齐
     *
     * @param rows
     * @param align
     * @return
     */
    public static String[] alignUpStringArray(String[] rows, int align) {
        final String empty = new String();
        //排除除数为0的情况
        if (align == 0) {
            align = 1;
        }
        //用空格补充缺漏
        if ((rows.length % align) > 0) {
            int alignLen = rows.length + (align - rows.length % align);
            String[] alignRows = new String[alignLen];
            for (int i = 0; i < rows.length; i++) {
                alignRows[i] = rows[i];
            }
            for (int i = rows.length; i < alignLen; i++) {
                alignRows[i] = empty;
            }
            return alignRows;
        }
        return rows;
    }

}
