package com.jfeat.pdf.print.report.request;

import com.jfeat.pdf.print.base.FontDefinition;

/**
 * Created by vincenthuang on 23/03/2018.
 */

public class RowFormatRequest {

    private FontDefinition titleFont;

    private float titleSpacing;
    private float titleIndent;

    private int titleAlignment;


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

    public int getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(int titleAlignment) {
        this.titleAlignment = titleAlignment;
    }
}
