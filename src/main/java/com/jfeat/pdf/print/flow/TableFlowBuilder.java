package com.jfeat.pdf.print.flow;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.jfeat.pdf.print.PdfExporter;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.util.ChineseFont;
import com.jfeat.pdf.print.util.Strings;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import static com.itextpdf.text.Font.BOLD;
import static com.itextpdf.text.Font.NORMAL;

/**
 * Created by vincent on 2018/9/27.
 */
public class TableFlowBuilder {

    /// table properties
    private float totalWidth;
    private float[] columnWidths;
    private int numColumns = 0;
    private float borderWidth = 1;
    private int borderStyle = Rectangle.BOX;    // 下划线
    private BaseColor borderColor = new BaseColor(0,0,0);

    /// table header
    private boolean header = false;
    private float headerHeight;
    private String headerTitle;
    private Font headerFormat;
    private BaseColor headerColor;

    // table row
    private boolean firstRow = false;
    private float firstRowHeight = 0;     /// 相当于表头 headers
    private Font firstRowFormat;
    private BaseColor firstRowColor;
    private float rowHeight;
    private Font rowFormat;
    private String[] rows;
    private BaseColor rowColor;

    public TableFlowBuilder(){
    }

    public TableFlowBuilder columnWidths(float[] columnWidths){
        this.columnWidths = columnWidths;
        return this;
    }

    public TableFlowBuilder numColumns(int numColumns){
        this.numColumns = numColumns;
        return this;
    }

    public TableFlowBuilder totalWidth(float totalWidth){
        this.totalWidth = totalWidth;
        return this;
    }

    public TableFlowBuilder borderWidth(float borderWidth){
        this.borderWidth = borderWidth;
        return this;
    }

    public TableFlowBuilder borderColor(BaseColor borderColor) {
        this.borderColor = borderColor;
        return this;
    }

    public TableFlowBuilder borderStyle(int borderStyle){
        this.borderStyle = borderStyle;
        return this;
    }

    public TableFlowBuilder header(){
        this.header = true;
        return this;
    }

    public TableFlowBuilder row(){
        return this;
    }

    public TableFlowBuilder headerTitle(String headerTitle){
        if(!header){
            throw new RuntimeException("header must be set previously!");
        }
        this.headerTitle = headerTitle;
        return this;
    }

    public TableFlowBuilder headerHeight(float headerHeight){
        if(!header){
            throw new RuntimeException("header must be set previously!");
        }
        this.headerHeight = headerHeight;
        return this;
    }

    public TableFlowBuilder headerFormat(Font headerFormat){
        if(!header){
            throw new RuntimeException("header must be set previously!");
        }
        this.headerFormat = headerFormat;
        return this;
    }

    public TableFlowBuilder firstRow(){
        this.firstRow = true;
        return this;
    }

    public TableFlowBuilder firstRowHeight(float firstRowHeight){
        if(!firstRow){
            throw new RuntimeException("firstRow must be set previously!");
        }
        this.firstRowHeight = firstRowHeight;
        return this;
    }

    public TableFlowBuilder firstRowFormat(Font format){
        if(!firstRow){
            throw new RuntimeException("firstRow must be set previously!");
        }
        this.firstRowFormat = format;
        return this;
    }

    public TableFlowBuilder rowFormat(Font format){
        this.rowFormat = format;
        return this;
    }

    public TableFlowBuilder rowHeight(float rowHeight){
        this.rowHeight = rowHeight;
        return this;
    }

    public TableFlowBuilder headerColor(BaseColor headerColor) {
        this.headerColor = headerColor;
        return this;
    }
    public TableFlowBuilder firstRowColor(BaseColor firstRowColor) {
        this.firstRowColor = firstRowColor;
        return this;
    }
    public TableFlowBuilder rowColor(BaseColor rowColor) {
        this.rowColor = rowColor;
        return this;
    }

    public TableFlowBuilder rows(String[] rows){
        //补全列内容，单元格数据与列数目一致
        int len = columnWidths!=null ? columnWidths.length : numColumns;
        this.rows = Strings.alignUpStringArray(rows, len);
        return this;
    }


    public TableFlow build(){
        if(numColumns==0 && (columnWidths==null || columnWidths.length==0)){
            throw new RuntimeException("BadRequest: columnWidths is null!");
        }

        TableFlow report = new TableFlow();
        if(columnWidths!=null) {
            report.setColumnWidths(columnWidths);
        }
        if(numColumns>0){
            report.setNumColumns(numColumns);
        }
        report.setTotalWidth(totalWidth);
        report.setBorderWidth(borderWidth);
        report.setBorderColor(borderColor);
        report.setBorderStyle(borderStyle);
        report.setRowHeight(rowHeight);
        report.setRowColor(rowColor);

        if(header){
            report.setHeaderHeight(headerHeight);

            TextBox header = new TextBox();
            header.setContent(headerTitle, headerFormat);
            report.setHeader(header);
            report.setHeaderColor(headerColor);
        }

        if(firstRow){
            report.setFirstRowHeight(firstRowHeight);
            report.setFirstRowColor(firstRowColor);
        }

        List<ListRow> listRows = new ArrayList<>();

        int columns = columnWidths !=null? columnWidths.length : numColumns;
        for (int i=0; i<rows.length; i++){
            String rowTitle = rows[i];

            // 如果有设置 firstRow
            if(firstRow){
                if(i<columns){
                    if(firstRowHeight>0){
                        TextBox firstRow = new TextBox();
                        firstRow.setContent(rowTitle, firstRowFormat);

                        listRows.add(firstRow);
                        continue;
                    }
                }
            }

            // rows
            TextBox firstRow = new TextBox();
            firstRow.setContent(rowTitle, rowFormat);
            listRows.add(firstRow);
        }

        report.setRows(listRows);

        return report;
    }

    public static void main(String[] args) throws FileNotFoundException, DocumentException{
        Font headerFormat = new ChineseFont("宋体", 18, BOLD, new BaseColor(255,0,0));
        Font firstRowFormat = new ChineseFont("宋体", 14, NORMAL, new BaseColor(30,30,17));
        Font rowFormat = new ChineseFont("宋体", 14, NORMAL, new BaseColor(30,30,37));

        String[] listRows = new String[]{
                "序号","商品编号", "关键属性", "商品名称", "货号", "库位", "数量",
                "1", "2", "3", "4", "5", "6", "7", "8"};

        TableFlow tableFlow = new TableFlowBuilder()
                .columnWidths(new float[]{2f, 8, 5,  10, 4, 4, 2f})
                .totalWidth(500)
                .borderWidth(1)
                .header().headerHeight(30).headerFormat(headerFormat).headerTitle("商品清单")
                .firstRow().firstRowHeight(26).firstRowFormat(firstRowFormat)
                .rowHeight(24).rowFormat(rowFormat)
                .rows(listRows)
                .build()
                ;

        // export
        PdfExporter exporter = new PdfExporter();

        PdfContentByte canvas = exporter.export("table.pdf", 20).canvas();
        Rectangle pageSize=  exporter.getPageSize();

        tableFlow.draw(canvas);

        exporter.addElement(tableFlow.getElement());

        exporter.close();
    }
}

