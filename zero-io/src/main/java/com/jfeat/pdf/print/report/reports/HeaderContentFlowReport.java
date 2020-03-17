package com.jfeat.pdf.print.report.reports;

import com.itextpdf.text.AccessibleElementId;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.EmptyListRow;
import com.jfeat.pdf.print.base.ListRow;

/**
 * Created by vincent on 2018/3/19.
 */
public class HeaderContentFlowReport extends HeaderFlowReport {

    public HeaderContentFlowReport(int columns) {
        super(columns);
    }

    @Override
    public void draw(PdfContentByte canvas) {

        // TODO, override table write

        PdfPTable rootTable = new PdfPTable(1);
        rootTable.setWidthPercentage(100);

        PdfPTable table = new PdfPTable(columns);
        table.setWidthPercentage(100);
        if(rowHeight>0) {
            table.getDefaultCell().setFixedHeight(rowHeight);
        }


        /// 表头，占满一行
        PdfPCell headerCell = new PdfPCell();
        headerCell.setColspan(columns);
        headerCell.setBorderWidthLeft(headerBorderWidthLeft);
        headerCell.setBorderWidthRight(headerBorderWidthRight);
        headerCell.setBorderWidthTop(headerBorderWidthTop);
        headerCell.setBorderWidthBottom(headerBorderWidthBottom);

        if(headerHeight>0) {
            headerCell.setFixedHeight(headerHeight);
        }
        headerCell.setCellEvent(new PdfPCellEvent() {
            @Override
            public void cellLayout(PdfPCell cell, Rectangle position,
                                   PdfContentByte[] canvases) {
                if(header!=null) {
                    header.drawCell(canvases, position);
                }
            }
        });

        /// add empty cells
        if(checkNoBorder(0)) {
            headerCell.setBorder(Rectangle.NO_BORDER);
        }else{
            headerCell.setBorder(Rectangle.BOX);
            headerCell.setBorderWidthLeft(headerBorderWidthLeft);
            headerCell.setBorderWidthRight(headerBorderWidthRight);
            headerCell.setBorderWidthTop(headerBorderWidthTop);
            headerCell.setBorderWidthBottom(headerBorderWidthBottom);
            headerCell.setBorderColor(headerBorderColor);
        }

        rootTable.addCell(headerCell);



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

                    if(row !=null){
                        //position.setBorder(Rectangle.BOX);
                        //position.setBorderWidth(1);
                        //position.setBorderColor(BaseColor.BLUE);

                        row.drawCell(canvases, position);
                    }
                }
            });

            /// set border
            if(checkNoBorder(1) || row== EmptyListRow.EMPTY) {
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

        // add rows table
        PdfPCell rowsCell = new PdfPCell();
        rowsCell.setBorder(Rectangle.NO_BORDER);
        rowsCell.setPaddingLeft(rowsMarginLeft);
        rowsCell.setPaddingTop(rowsMarginTop);
        rowsCell.setPaddingRight(rowsMarginRight);
        rowsCell.setPaddingBottom(rowsMarginBottom);

        rowsCell.addElement(table);
        rootTable.addCell(rowsCell);

        /// document
        try {
            Document document = canvas.getPdfDocument();
            document.add(rootTable);

        }catch (DocumentException e){
            throw new RuntimeException(e);
        }
    }
}
