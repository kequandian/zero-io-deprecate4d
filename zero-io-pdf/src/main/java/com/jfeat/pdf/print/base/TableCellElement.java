package com.jfeat.pdf.print.base;

import com.itextpdf.text.AccessibleElementId;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.jfeat.pdf.print.base.ListRow;

public abstract class TableCellElement extends Rectangle implements ListRow {

    protected AccessibleElementId cellId;

    public TableCellElement(){
        super(0,0,0,0);
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
    public AccessibleElementId getCellId(){
        return cellId;
    }

    @Override
    public void draw(PdfContentByte canvas, Rectangle position){
        PdfContentByte[] canvases = new PdfContentByte[]{canvas, canvas, canvas, canvas};
        drawCell(canvases, position);
    }
}
