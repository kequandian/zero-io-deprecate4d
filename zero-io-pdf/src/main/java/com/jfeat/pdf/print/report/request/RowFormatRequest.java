package com.jfeat.pdf.print.report.request;

import com.itextpdf.text.Element;
import com.jfeat.pdf.print.base.FontDefinition;

/**
 * Created by vincenthuang on 23/03/2018.
 */

public class RowFormatRequest {

    /**
     * 标题字体
     */
    private FontDefinition titleFont;

    /**
     * 标题间隙
     */
    private float titleSpacing;

    /**
     * 标题缩进
     */
    private float titleIndent;

    /**
     * 标题对齐方式 (定义为字符串符号，转换为序号）
     */
    private String titleAlignment = "ALIGN_CENTER";
    private String titleVerticalAlignment = "ALIGN_MIDDLE";


    public RowFormatRequest(){
    }

    public FontDefinition getTitleFont() {
        return titleFont;
    }

    public void setTitleFont(FontDefinition titleFont) {
        this.titleFont = titleFont;
    }

    public float getTitleSpacing() {
        return titleSpacing;
    }

    public void setTitleSpacing(float titleSpacing) {
        this.titleSpacing = titleSpacing;
    }

    public float getTitleIndent() {
        return titleIndent;
    }

    public void setTitleIndent(float titleIndent) {
        this.titleIndent = titleIndent;
    }

    public String getTitleVerticalAlignment() {
        return this.titleVerticalAlignment;
    }

    public void setTitleVerticalAlignment(String verticalAlignment) {
        this.titleVerticalAlignment = verticalAlignment;
    }

    public String getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(String titleAlignment) {
        this.titleAlignment = titleAlignment;
    }
}
