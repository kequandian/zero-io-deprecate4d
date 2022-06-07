package com.jfeat.pdf.print.report.request;

import com.itextpdf.text.Font;

/**
 * Created by vincenthuang on 23/03/2018.
 */

public class RowFormat {

    private Font title;

    private float titleSpacing;
    private float titleIndent;

    private int titleAlignment;

    public Font getTitle() {
        return title;
    }

    public void setTitle(Font title) {
        this.title = title;
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
