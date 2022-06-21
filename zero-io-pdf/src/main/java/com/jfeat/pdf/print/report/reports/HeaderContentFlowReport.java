package com.jfeat.pdf.print.report.reports;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.PdfFlowRequest;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.element.EmptyListRow;
import com.jfeat.pdf.print.base.ListRow;

import static com.jfeat.pdf.print.simple.base.FontDefinition.BASE_FONT;

/**
 * Created by vincent on 2018/3/19.
 */
public class HeaderContentFlowReport extends HeaderFlowReport {

    public HeaderContentFlowReport(int columns) {
        super(columns);
    }

    @Override
    public void draw(PdfContentByte canvas) {

        PdfPTable rootTable = new PdfPTable(1);
        rootTable.setWidthPercentage(100);

        PdfPTable table = new PdfPTable(columns);
        table.setWidthPercentage(100);
        if(rowHeight>0) {
            table.getDefaultCell().setFixedHeight(rowHeight);
        }


        if(header!=null && headerHeight > 0) {
            /// 表头，占满一行
            PdfPCell headerCell = new PdfPCell();
            headerCell.setColspan(columns);
            headerCell.setBorderWidthLeft(headerBorderWidthLeft);
            headerCell.setBorderWidthRight(headerBorderWidthRight);
            headerCell.setBorderWidthTop(headerBorderWidthTop);
            headerCell.setBorderWidthBottom(headerBorderWidthBottom);

            if (headerHeight > 0) {
                headerCell.setFixedHeight(headerHeight);
            }
            headerCell.setCellEvent(new PdfPCellEvent() {
                @Override
                public void cellLayout(PdfPCell cell, Rectangle position,
                                       PdfContentByte[] canvases) {
                    if (header != null) {
                        header.drawCell(canvases, position);
                    }
                }
            });

            /// add empty cells
            if (checkHeaderNoBorder()) {
                headerCell.setBorder(Rectangle.NO_BORDER);
            } else {
                headerCell.setBorder(Rectangle.BOX);
                headerCell.setBorderWidthLeft(headerBorderWidthLeft);
                headerCell.setBorderWidthRight(headerBorderWidthRight);
                headerCell.setBorderWidthTop(headerBorderWidthTop);
                headerCell.setBorderWidthBottom(headerBorderWidthBottom);
                headerCell.setBorderColor(headerBorderColor);
            }

            rootTable.addCell(headerCell);
        }



        /**
         *  handle row cell
         */
        for(ListRow row : rows) {

            PdfPCell cell = new PdfPCell();
            AccessibleElementId cellId = cell.getId();
            /// remember cell id
            row.setCellId(cellId);

            if(rowHeight>0) {
                cell.setFixedHeight(rowHeight);
            }

            cell.setCellEvent(new PdfPCellEvent() {
                @Override
                public void cellLayout(PdfPCell cell, Rectangle position,
                                       PdfContentByte[] canvases) {

                    AccessibleElementId cellId = cell.getId();
                    ListRow row = getRowByCellId(cellId);

                    // for debug
                    //canvases[0].setFontAndSize(BASE_FONT, 12);
                    //canvases[0].showTextAligned(Element.ALIGN_LEFT, "Column 1", position.getLeft(), position.getTop(), 0);

                    if(row !=null){
                        row.drawCell(canvases, position);
                    }
                }
            });

            BaseColor defaultColor = cell.getBorderColor();
            /// set border
            if(checkNoBorder() || row== EmptyListRow.EMPTY) {
                cell.setBorder(Rectangle.NO_BORDER);
            }else{
                cell.setBorder(Rectangle.BOX);
                cell.setBorderWidthLeft(rowBorderWidthLeft);
                cell.setBorderWidthRight(rowBorderWidthRight);
                cell.setBorderWidthTop(rowBorderWidthTop);
                cell.setBorderWidthBottom(rowBorderWidthBottom);
                cell.setBorderColor(rowBorderColor);
            }

            table.addCell(cell);
        }
        table.setComplete(true);

        if(header!=null && headerHeight > 0) {
            // add rows table
            PdfPCell rowsCell = new PdfPCell();
            rowsCell.setBorder(Rectangle.NO_BORDER);
            rowsCell.setPaddingLeft(rowsPaddingLeft);
            rowsCell.setPaddingTop(rowsPaddingTop);
            rowsCell.setPaddingRight(rowsPaddingRight);
            rowsCell.setPaddingBottom(rowsPaddingBottom);

            rowsCell.addElement(table);
            rootTable.addCell(rowsCell);
        }

        /// document
        try {
            Document document = canvas.getPdfDocument();
            document.add( (header!=null && headerHeight > 0) ? rootTable : table);

        }catch (DocumentException e){
            throw new RuntimeException(e);
        }
    }
}
