package com.jfeat.pdf.print.base;

import com.itextpdf.text.Rectangle;
import com.jfeat.pdf.print.element.TableCellElement;

/**
 * Created by vincent on 2018/3/19.
 * 指定 Padding 的数据行
 */
public abstract class PaddingListRow extends TableCellElement implements ListRow {
    protected float paddingLeft;
    protected float paddingRight;
    protected float paddingTop;
    protected float paddingBottom;

    public PaddingListRow() {
        super(0, 0, 0, 0);
    }

    public PaddingListRow(float llx, float lly, float urx, float ury) {
        super(llx, lly, urx, ury);
    }

    public PaddingListRow(float llx, float lly, float urx, float ury, int rotation) {
        super(llx, lly, urx, ury, rotation);
    }

    public PaddingListRow(float urx, float ury) {
        super(urx, ury);
    }

    public PaddingListRow(float urx, float ury, int rotation) {
        super(urx, ury, rotation);
    }

    public PaddingListRow(Rectangle rect) {
        super(rect);
    }

    public PaddingListRow(com.itextpdf.awt.geom.Rectangle rect) {
        super(rect);
    }

    public void setPadding(float left, float right, float top, float bottom){
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
}
