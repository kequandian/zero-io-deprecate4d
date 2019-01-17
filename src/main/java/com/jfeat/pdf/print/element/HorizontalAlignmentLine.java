package com.jfeat.pdf.print.element;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;

/**
 * Created by vincent on 2018/9/28.
 */
public class HorizontalAlignmentLine extends PdfPTable{

    /*public HorizontalAlignmentLine(String left, String right, Font font){
        Chunk glue = new Chunk(new VerticalPositionMark());
        add(new Chunk(left, font));
        add(glue);
        add(new Chunk(right, font));  //"Text to the right"
    }*/

    private Font leftFont;
    private Font centerFont;
    private Font rightFont;

    public HorizontalAlignmentLine(String left, String center, String right, Font font) {
        this(left,center,right,font, font, font);
    }

    public HorizontalAlignmentLine(String left, String center, String right, Font leftFont, Font centerFont, Font rightFont){
        super(3);
        setWidthPercentage(100);

        this.leftFont = leftFont;
        this.rightFont = rightFont;
        this.centerFont = centerFont;

        if(left!=null && left.length()>0) {
            PdfPCell leftCell = new PdfPCell(new Phrase(left, leftFont));
            leftCell.setPadding(0);
            leftCell.setHorizontalAlignment(Element.ALIGN_LEFT);
            leftCell.setBorder(PdfPCell.NO_BORDER);

            addCell(leftCell);
        }else {
            addCell("");
        }

        if(center!=null && center.length()>0) {
            PdfPCell centerCell = new PdfPCell(new Phrase(center, centerFont));
            centerCell.setPadding(0);
            centerCell.setHorizontalAlignment(Element.ALIGN_CENTER);
            centerCell.setBorder(PdfPCell.NO_BORDER);
            addCell(centerCell);
        }else{
            addCell("");
        }

        if(right!=null && right.length()>0) {
            PdfPCell rightCell = new PdfPCell(new Phrase(right, rightFont));
            rightCell.setPadding(0);
            rightCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            rightCell.setBorder(PdfPCell.NO_BORDER);

            addCell(rightCell);
        }else{
            addCell("");
        }

    }

    public Font getLeftFont() {
        return leftFont;
    }

    public void setLeftFont(Font leftFont) {
        this.leftFont = leftFont;
    }

    public Font getCenterFont() {
        return centerFont;
    }

    public void setCenterFont(Font centerFont) {
        this.centerFont = centerFont;
    }

    public Font getRightFont() {
        return rightFont;
    }

    public void setRightFont(Font rightFont) {
        this.rightFont = rightFont;
    }

    public void setFont(Font font){
        this.leftFont = font;
        this.centerFont = font;
        this.rightFont = font;
    }
}
