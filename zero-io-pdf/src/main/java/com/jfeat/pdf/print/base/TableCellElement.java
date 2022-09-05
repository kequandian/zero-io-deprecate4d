package com.jfeat.pdf.print.base;

import com.itextpdf.text.AccessibleElementId;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;

public abstract class TableCellElement extends Rectangle implements ListRow {

    protected float paddingLeft;
    protected float paddingRight;
    protected float paddingTop;
    protected float paddingBottom;

    public void setPadding(float left, float right, float top, float bottom) {
        this.paddingLeft = left;
        this.paddingRight = right;
        this.paddingTop = top;
        this.paddingBottom = bottom;
    }

    public float getPaddingLeft() {
        return paddingLeft;
    }

    public void setPaddingLeft(float paddingLeft) {
        this.paddingLeft = paddingLeft;
    }

    public float getPaddingRight() {
        return paddingRight;
    }

    public void setPaddingRight(float paddingRight) {
        this.paddingRight = paddingRight;
    }

    public float getPaddingTop() {
        return paddingTop;
    }

    public void setPaddingTop(float paddingTop) {
        this.paddingTop = paddingTop;
    }

    public float getPaddingBottom() {
        return paddingBottom;
    }

    public void setPaddingBottom(float paddingBottom) {
        this.paddingBottom = paddingBottom;
    }

    /**
     * data member
     */

    protected AccessibleElementId cellId;

    public TableCellElement() {
        super(0, 0, 0, 0);
    }

    public TableCellElement(float llx, float lly, float urx, float ury) {
        super(llx, lly, urx, ury);
    }

    public TableCellElement(float llx, float lly, float urx, float ury, int rotation) {
        super(llx, lly, urx, ury, rotation);
    }

    public TableCellElement(float urx, float ury) {
        super(urx, ury);
    }

    public TableCellElement(float urx, float ury, int rotation) {
        super(urx, ury, rotation);
    }

    public TableCellElement(Rectangle rect) {
        super(rect);
    }

    public TableCellElement(com.itextpdf.awt.geom.Rectangle rect) {
        super(rect);
    }


    @Override
    public void setCellId(AccessibleElementId cellId) {
        this.cellId = cellId;
    }

    @Override
    public AccessibleElementId getCellId() {
        return cellId;
    }

    @Override
    public void draw(PdfContentByte canvas, Rectangle position) {
        PdfContentByte[] canvases = new PdfContentByte[]{canvas, canvas, canvas, canvas};
        drawCell(canvases, position);
    }
}
