package com.jfeat.pdf.print.flow;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPCellEvent;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.PdfExporter;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.base.PositionFlowElement;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.util.ChineseFont;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import static com.itextpdf.text.Font.NORMAL;

/**
 * Created by vincent on 2018/3/19.
 * 输出简单表格
 */
public class TableFlow extends PositionFlowElement {

    protected float[] columnWidths;
    protected int numColumns = 1;
    protected float totalWidth = 0;
    protected float widthPercentage = 100;

    /// border
    protected BaseColor borderColor;
    protected float borderWidth = 0.5f;
    protected int borderStyle = Rectangle.BOX;

    /// table title
    protected ListRow header;
    /// 第一行为表头字段
    protected List<ListRow> rows;

    protected float headerHeight;
    protected float firstRowHeight;     /// 相当于表头 headers
    protected float rowHeight;

    protected BaseColor headerColor;
    protected BaseColor firstRowColor;
    protected BaseColor rowColor;

    public TableFlow(){}

    public TableFlow(int numColumns){
        this.numColumns = numColumns;
    }
    public TableFlow(float[] columnWidths){
        this.columnWidths = columnWidths;
    }

    public void draw(PdfContentByte canvas){
        if(rowHeight<=0){
            throw new RuntimeException("rowHeight must great then zero!");
        }
        int numCols = columnWidths==null?numColumns : columnWidths.length;
        if((rows.size() % numCols)>0){
            throw new RuntimeException("rows size must align up with num of columns");
        }

        PdfPTable table = columnWidths!=null? new PdfPTable(columnWidths) : new PdfPTable(numColumns);

        if(totalWidth>0) {
            table.setTotalWidth(totalWidth);
        }else {
            table.setWidthPercentage(widthPercentage);
        }

        // default
        table.getDefaultCell().setBorder(borderStyle);
        if(borderWidth>0) {
            table.getDefaultCell().setBorderWidth(borderWidth);
        }
        if(borderColor!=null) {
            table.getDefaultCell().setBorderColor(borderColor);
        }
        table.getDefaultCell().setFixedHeight(rowHeight);

        /// 表头，占满一行
        if(header!=null) {

            PdfPCell headerCell = new PdfPCell();

            if(headerColor != null) {
                headerCell.setBackgroundColor(headerColor);
            }

            headerCell.setColspan(columnWidths!=null?columnWidths.length:numColumns);
            if(borderWidth>0) {
                headerCell.setBorderWidth(borderWidth);
            }
            headerCell.setBorder(borderStyle);
            if(borderColor!=null) {
                headerCell.setBorderColor(borderColor);
            }

            if (headerHeight > 0) {
                headerCell.setFixedHeight(headerHeight);
            }
            headerCell.setCellEvent(new PdfPCellEvent() {
                @Override
                public void cellLayout(PdfPCell cell, Rectangle position,
                                       PdfContentByte[] canvases) {
                    header.drawCell(canvases, position);
                }
            });

            /// add empty cells
            table.addCell(headerCell);
        }


        /**
         *  handle row cell
         */
        int rowIndex = 0;
        for(ListRow row : rows) {

            PdfPCell cell = new PdfPCell();
            cell.setFixedHeight(rowHeight);
            cell.setBorder(borderStyle);
            if(borderWidth>0) {
                cell.setBorderWidth(borderWidth);
            }
            if(borderColor!=null) {
                cell.setBorderColor(borderColor);
            }

            /// remember cell id
            AccessibleElementId cellId = cell.getId();
            row.setCellId(cell.getId());

            int len = columnWidths!=null? columnWidths.length : numColumns;
            if(firstRowHeight>0) {
                if(rowIndex < len ){
                    cell.setFixedHeight(firstRowHeight);
                    cell.setBackgroundColor(firstRowColor);
                }
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
            BaseColor cellColor = rowIndex < len ? firstRowColor : rowColor;
            cell.setBackgroundColor(cellColor);
            table.addCell(cell);

            rowIndex ++;
        }

        //table.setHeaderRows(columnWidths.length);
        table.setComplete(true);

        _element = table;
    }

    private Element _element;

    @Override
    public Element getElement() {
        return _element;
    }

    public List<? extends ListRow> getRows() {
        return rows;
    }

    public void setRows(List<ListRow> rows) {
        int numCols = columnWidths==null?numColumns : columnWidths.length;
        if((rows.size() % numCols)>0){
            throw new RuntimeException("rows size must align up with num of columns");
        }
        this.rows = rows;
    }
    public void addRow(ListRow row) {
        if(this.rows==null){
            this.rows = new ArrayList<>();
        }
        this.rows.add(row);
    }
    public void addRow(ListRow row, int repeat) {
        if(this.rows==null){
            this.rows = new ArrayList<>();
        }
        for(int i=0; i<repeat; i++) {
            this.rows.add(row);
        }
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

    public void setColumnWidths(float[] columnWidths) {
        this.columnWidths = columnWidths;
    }

    public void setRowHeight(float rowHeight) {
        this.rowHeight = rowHeight;
    }

    public void setHeaderHeight(float headerHeight) {
        this.headerHeight = headerHeight;
    }

    public void setFirstRowHeight(float firstRowHeight) {
        this.firstRowHeight = firstRowHeight;
    }

    public void setTotalWidth(float totalWidth) {
        this.totalWidth = totalWidth;
    }

    public void setWidthPercentage(float widthPercentage) {
        this.widthPercentage = widthPercentage;
    }

    public void setNumColumns(int numColumns) {
        this.numColumns = numColumns;
    }

    public void setBorderColor(BaseColor borderColor) {
        this.borderColor = borderColor;
    }

    public void setBorderWidth(float borderWidth) {
        this.borderWidth = borderWidth;
    }

    public void setBorderStyle(int borderStyle) {
        this.borderStyle = borderStyle;
    }

    public void setHeaderColor(BaseColor headerColor) {
        this.headerColor = headerColor;
    }

    public void setRowColor(BaseColor rowColor) {
        this.rowColor = rowColor;
    }

    public void setFirstRowColor(BaseColor firstRowColor) {
        this.firstRowColor = firstRowColor;
    }

    /**
     * 移到单元测试中测试, 本地测试无效
     * @param args
     * @throws DocumentException
     * @throws FileNotFoundException
     */
    public static void main(String[] args) throws DocumentException, FileNotFoundException{
        TableFlow tableFlow = new TableFlow();
        tableFlow.setHeaderHeight(24);
        tableFlow.setRowHeight(26);
        tableFlow.setFirstRowHeight(24);
        tableFlow.setColumnWidths(new float[]{2f, 8, 5,  10, 4, 4, 2f});
        tableFlow.setTotalWidth(500);

        Font headerFont = new ChineseFont("宋体", 14, NORMAL, new BaseColor(30,30,37));
        Font firstRowFont = new ChineseFont("宋体", 12, NORMAL, new BaseColor(30,30,37));

        TextBox header = new TextBox("商品清单", headerFont);

        TextBox fcol1 = new TextBox("序号", firstRowFont);
        TextBox fcol2 = new TextBox("商品编号", firstRowFont);
        TextBox fcol3 = new TextBox("关键属性", firstRowFont);
        TextBox fcol4 = new TextBox("商品名称", firstRowFont);
        TextBox fcol5 = new TextBox("货号", firstRowFont);
        TextBox fcol6 = new TextBox("库位", firstRowFont);
        TextBox fcol7 = new TextBox("数量", firstRowFont);

        List<ListRow> firstRow = new ArrayList<>();
        firstRow.add(fcol1);
        firstRow.add(fcol2);
        firstRow.add(fcol3);
        firstRow.add(fcol4);
        firstRow.add(fcol5);
        firstRow.add(fcol6);
        firstRow.add(fcol7);

        tableFlow.setHeader(header);
        tableFlow.setRows(firstRow);
        //

        PdfExporter exporter = new PdfExporter();

        PdfContentByte canvas = exporter.export("table.pdf", PageSize.A4, 20).canvas();
        Rectangle pageSize=  exporter.getPageSize();

        tableFlow.draw(canvas);

        exporter.addElement(tableFlow.getElement());

        exporter.close();
    }
}
