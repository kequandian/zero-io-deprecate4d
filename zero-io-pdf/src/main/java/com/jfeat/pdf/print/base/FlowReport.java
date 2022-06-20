package com.jfeat.pdf.print.base;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.element.EmptyListRow;

import java.util.List;

/**
 * Created by vincent on 2018/3/19.
 * 流报表基类，按列平均分布，通常用于商口展示
 */
public abstract class FlowReport implements FlowElement {
    public static final int FLOW_LTR = 0;   //从左到右 Left to Right
    public static final int FLOW_UTD = 1;   //右上至下 Up to Down

    protected ListRow header;               // 头部
    protected List<? extends ListRow> rows; // 报表行
    protected int maxRowsPerColumn;         // 报表最多允许行高, only for UTD

    protected int columns;
    protected int flowDirection;
    protected float flowHeight;   //报表总高度

    protected float headerHeight;
    protected float rowHeight;

    /// border
    protected float headerBorderWidthLeft, headerBorderWidthRight, headerBorderWidthTop, headerBorderWidthBottom;
    protected BaseColor headerBorderColor;
    protected float rowBorderWidthLeft, rowBorderWidthRight, rowBorderWidthTop, rowBorderWidthBottom;
    protected BaseColor rowBorderColor;

    // rows margin
    protected float rowsMarginLeft, rowsMarginRight, rowsMarginTop, rowsMarginBottom;

    public FlowReport(int columns){
        this.columns = columns;
    }


    public void draw(PdfContentByte canvas){

        PdfPTable table = new PdfPTable(columns);
        table.setWidthPercentage(100);

        if(rowHeight>0) {
            table.getDefaultCell().setFixedHeight(rowHeight);
        }
        /// draw border
        // table.getDefaultCell().setBorder(Rectangle.BOX);
        // table.getDefaultCell().setBorderWidth(1);

        if(this.header!=null) {
            /// 表头，占满一行
            PdfPCell headerCell = new PdfPCell();
            headerCell.setColspan(columns);

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
            if (checkNoBorder(0)) {
                headerCell.setBorder(Rectangle.NO_BORDER);
            } else {
                headerCell.setBorder(Rectangle.BOX);
                headerCell.setBorderWidthLeft(headerBorderWidthLeft);
                headerCell.setBorderWidthRight(headerBorderWidthRight);
                headerCell.setBorderWidthTop(headerBorderWidthTop);
                headerCell.setBorderWidthBottom(headerBorderWidthBottom);
                headerCell.setBorderColor(headerBorderColor);
            }

            table.addCell(headerCell);
        }


        /**
         *  handle row cell
         */
        for(ListRow row : rows) {

            PdfPCell cell = new PdfPCell();
            AccessibleElementId cellId = cell.getId();
            /// remember cell id
            row.setCellId(cellId);

            // cell padding
            cell.setPaddingLeft(this.rowsMarginLeft);
            cell.setPaddingRight(this.rowsMarginRight);
            cell.setPaddingTop(this.rowsMarginTop);
            cell.setPaddingBottom(this.rowsMarginBottom);
            System.out.println(String.format("cell rowsMarginLeft: %d", rowsMarginLeft));


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

        try {
            Document document = canvas.getPdfDocument();
            document.add(table);

        }catch (DocumentException e){
            throw new RuntimeException(e);
        }
    }


    protected boolean checkNoBorder(int flag){
        if(flag==0) {
            return (headerBorderWidthLeft + headerBorderWidthRight + headerBorderWidthTop + headerBorderWidthBottom) == 0;
        }else{
            return (rowBorderWidthLeft + rowBorderWidthRight + rowBorderWidthTop + rowBorderWidthBottom) == 0;
        }
    }

    public int getFlowDirection() {
        return flowDirection;
    }

    public void setFlowDirection(int flowDirection) {
        this.flowDirection = flowDirection;
    }

    public float getFlowHeight() {
        return flowHeight;
    }

    public void setFlowHeight(float height) {
        this.flowHeight = height;
    }

    public int getMaxRowsPerColumn() {
        return maxRowsPerColumn;
    }

    public void setMaxRowsPerColumn(int rows) {
        this.maxRowsPerColumn = rows;
    }

    public float getRowHeight() {
        return rowHeight;
    }

    public void setRowHeight(float rowHeight) {
        this.rowHeight = rowHeight;
    }

    public float getHeaderHeight() {
        return headerHeight;
    }

    public void setHeaderHeight(float headerHeight) {
        this.headerHeight = headerHeight;
    }

    public List<? extends ListRow> getRows() {
        return rows;
    }

    public void setRows(List<? extends ListRow> rows) {
        this.rows = rows;
    }

    public ListRow getHeader() {
        return header;
    }

    public void setHeader(ListRow header){
        this.header = header;
    }

    public ListRow getRowByCellId(AccessibleElementId cellId){
        if(rows != null){

            for(ListRow row : rows){
                if(row.getCellId().compareTo(cellId)==0){
                    return row;
                }
            }
        }
        return null;
    }


    /**
     * 画对角线
     * @param canvases
     * @param position
     */
    private void drawCorner(PdfContentByte[] canvases, Rectangle position){
        PdfContentByte lineCanvas = canvases[PdfPTable.LINECANVAS];
        lineCanvas.moveTo(position.getLeft(), position.getTop());
        lineCanvas.lineTo(position.getRight(), position.getBottom());
        lineCanvas.stroke();
    }

    public float getHeaderBorderWidthLeft() {
        return headerBorderWidthLeft;
    }
    public float getHeaderBorderWidthRight() {
        return headerBorderWidthRight;
    }
    public float getHeaderBorderWidthTop() {
        return headerBorderWidthTop;
    }
    public float getHeaderBorderWidthBottom() {
        return headerBorderWidthBottom;
    }

    public float getRowBorderWidthLeft() {
        return rowBorderWidthLeft;
    }
    public float getRowBorderWidthRight() {
        return rowBorderWidthRight;
    }
    public float getRowBorderWidthTop() {
        return rowBorderWidthTop;
    }
    public float getRowBorderWidthBottom() {
        return rowBorderWidthBottom;
    }

    public float getRowsMarginLeft() {
        return rowsMarginLeft;
    }
    public float getRowMarginRight() {
        return rowsMarginRight;
    }
    public float getRowMarginTop() {
        return rowsMarginTop;
    }
    public float getRowMarginBottom() {
        return rowsMarginBottom;
    }


    public void setHeaderBorderWidth(float borderWidth) {
        if(borderWidth<0){
            // do nothing
        }else {
            this.headerBorderWidthLeft = borderWidth;
            this.headerBorderWidthTop = borderWidth;
            this.headerBorderWidthRight = borderWidth;
            this.headerBorderWidthBottom = borderWidth;
        }
    }

    public void setHeaderBorderWidth(float left, float top, float right, float bottom) {
        if(left<0 || top<0 || right<0 || bottom<0){
            // do nothing
        }else {
            this.headerBorderWidthLeft = left;
            this.headerBorderWidthTop = top;
            this.headerBorderWidthRight = right;
            this.headerBorderWidthBottom = bottom;
        }
    }

    public BaseColor getHeaderBorderColor() {
        return headerBorderColor;
    }

    public void setHeaderBorderColor(BaseColor color) {
        this.headerBorderColor = color;
    }

    public void setRowBorderWidth(float borderWidth) {
        if(borderWidth<0){
            // do nothing
        }else {
            this.rowBorderWidthLeft = borderWidth;
            this.rowBorderWidthTop = borderWidth;
            this.rowBorderWidthRight = borderWidth;
            this.rowBorderWidthBottom = borderWidth;
        }
    }

    public void setRowBorderWidth(float left, float top, float right, float bottom) {
        if(left<0 || top<0 || right<0 || bottom<0){
            // do nothing
        }else {
            this.rowBorderWidthLeft = left;
            this.rowBorderWidthTop = top;
            this.rowBorderWidthRight = right;
            this.rowBorderWidthBottom = bottom;
        }
    }

    public BaseColor getRowBorderColor() {
        return rowBorderColor;
    }

    public void setRowBorderColor(BaseColor color) {
        this.rowBorderColor = color;
    }

    public void setRowsMargin(float margin) {
        if(margin<0){
            // do nothing
        }else {
            this.rowsMarginLeft = margin;
            this.rowsMarginTop = margin;
            this.rowsMarginRight = margin;
            this.rowsMarginBottom = margin;
        }
    }

    public void setRowsMargin(float left, float top, float right, float bottom) {
        if(left<0 || top<0 || right<0 || bottom<0){
            // do nothing
        }else {
            this.rowsMarginLeft = left;
            this.rowsMarginTop = top;
            this.rowsMarginRight = right;
            this.rowsMarginBottom = bottom;
        }
    }
}
