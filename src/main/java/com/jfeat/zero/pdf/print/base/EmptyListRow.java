package com.jfeat.zero.pdf.print.base;

import com.itextpdf.text.AccessibleElementId;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;

/**
 * Created by vincenthuang on 26/03/2018.
 * 空框，用于占位
 */
public class EmptyListRow implements ListRow {

    public static final EmptyListRow EMPTY = new EmptyListRow();

    public static String ID = "EmptyListRow";

    private AccessibleElementId cellId;

    @Override
    public String rowId() {
        return ID;
    }

    @Override
    public void draw(PdfContentByte canvas, Rectangle position) {

    }

    @Override
    public void drawCell(PdfContentByte[] canvases, Rectangle position) {

    }

    @Override
    public void setCellId(AccessibleElementId cellId) {
        this.cellId = cellId;
    }

    @Override
    public AccessibleElementId getCellId() {
        return cellId;
    }
}
