package com.jfeat.pdf.print.report.request;

import com.jfeat.pdf.print.base.FontDefinition;

/**
 * Created by vincenthuang on 23/03/2018.
 */

public class RowFormatRequest {

    /**
     * 标题字体
     */
    private FontDefinition font;

    /**
     * 标题间隙
     */
    private float spacing;

    /**
     * 标题缩进
     */
    private float indent;

    /**
     * 标题对齐方式 (定义为字符串符号，转换为序号）
     */
    private String alignment = "ALIGN_CENTER";
    private String verticalAlignment = "ALIGN_MIDDLE";


    public RowFormatRequest() {
    }

    public FontDefinition getFont() {
        return font;
    }

    public void setFont(FontDefinition font) {
        this.font = font;
    }

    public float getSpacing() {
        return spacing;
    }

    public void setSpacing(float spacing) {
        this.spacing = spacing;
    }

    public float getIndent() {
        return indent;
    }

    public void setIndent(float indent) {
        this.indent = indent;
    }

    public String getVerticalAlignment() {
        return this.verticalAlignment;
    }

    public void setVerticalAlignment(String verticalAlignment) {
        this.verticalAlignment = verticalAlignment;
    }

    public String getAlignment() {
        return alignment;
    }

    public void setAlignment(String alignment) {
        this.alignment = alignment;
    }
}
