package com.jfeat.zero.pdf.print.report.builder;

import com.itextpdf.text.Font;

/**
 * Created by vincenthuang on 23/03/2018.
 */
public class RowFormat {

    private Font group;

    private Font title;
    private Font subtitle;
    private Font hint;
    private Font value;

    private float titleSpacing;
    private float titleIndent;

    private int titleAlignment;

    public Font getTitle() {
        return title;
    }

    public void setTitle(Font title) {
        this.title = title;
    }

    public Font getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(Font subtitle) {
        this.subtitle = subtitle;
    }

    public Font getHint() {
        return hint;
    }

    public void setHint(Font hint) {
        this.hint = hint;
    }

    public Font getValue() {
        return value;
    }

    public void setValue(Font value) {
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

    public Font getGroup() {
        return group;
    }

    public void setGroup(Font group) {
        this.group = group;
    }

    public int getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(int titleAlignment) {
        this.titleAlignment = titleAlignment;
    }
}
