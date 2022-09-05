package com.jfeat.pdf.print.report.request;

import com.jfeat.pdf.print.base.FontDefinition;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class RelativeRowFormatRequest {

    private FontDefinition title;
    private FontDefinition subtitle;
    private FontDefinition hint;
    private FontDefinition value;

    private float titleSpacing = 8;     //标题间距
    private float titleIndent = 4;      //缩进

    private String titleAlignment = "ALIGN_BASELINE";   //ALIGN_BASELINE-左上角，ALIGN_LEFT-靠左居中

    public RelativeRowFormatRequest() {
    }

    public RelativeRowFormatRequest(FontDefinition title, FontDefinition subtitle, FontDefinition hint, FontDefinition value) {
        this.title = title;
        this.subtitle = subtitle;
        this.hint = hint;
        this.value = value;
    }

    public RelativeRowFormatRequest spacing(float spacing) {
        titleSpacing = spacing;
        return this;
    }

    public RelativeRowFormatRequest indent(float indent) {
        titleIndent = indent;
        return this;
    }

    public RelativeRowFormatRequest alignment(String alignment) {
        titleAlignment = alignment;
        return this;
    }

    public FontDefinition getTitle() {
        return title;
    }

    public void setTitle(FontDefinition title) {
        this.title = title;
    }

    public FontDefinition getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(FontDefinition subtitle) {
        this.subtitle = subtitle;
    }

    public FontDefinition getHint() {
        return hint;
    }

    public void setHint(FontDefinition hint) {
        this.hint = hint;
    }

    public FontDefinition getValue() {
        return value;
    }

    public void setValue(FontDefinition value) {
        this.value = value;
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

    public String getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(String titleAlignment) {
        this.titleAlignment = titleAlignment;
    }
}
