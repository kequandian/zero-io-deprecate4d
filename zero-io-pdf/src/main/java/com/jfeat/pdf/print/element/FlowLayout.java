package com.jfeat.pdf.print.element;

import com.itextpdf.text.Image;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

/**
 * Created by vincent on 2018/9/28.
 */
public class FlowLayout extends PdfPTable {

    public FlowLayout(float[] columnWidths) {
        super(columnWidths);
        setWidthPercentage(100);
        setSpacingAfter(2);
        setSpacingBefore(2);
    }

    public FlowLayout(int numColumns) {
        super(numColumns);
        setWidthPercentage(100);
        setSpacingAfter(2);
        setSpacingBefore(2);
    }

    public FlowLayout add(PdfPTable element, int alignment) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, alignment);
        return this;
    }

    public FlowLayout add(PdfPTable element) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, ALIGN_LEFT);
        return this;
    }

    public FlowLayout add(Phrase element, int alignment) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, alignment);
        return this;
    }

    public FlowLayout add(Phrase element) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, ALIGN_LEFT);
        return this;
    }

    public FlowLayout add(Image element, int alignment) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, alignment);
        return this;
    }

    public FlowLayout add(Image element) {
        PdfPCell cell = new PdfPCell(element);
        this.addCell(cell, ALIGN_LEFT);
        return this;
    }

    private void addCell(PdfPCell cell, int alignment) {
        cell.setPaddingLeft(getSpacingBefore());
        cell.setPaddingRight(getSpacingAfter());

        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setHorizontalAlignment(alignment);

        super.addCell(cell);
    }
}

