package com.jfeat.pdf.print.flow;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.jfeat.pdf.print.PdfExporter;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.util.ChineseFont;
import com.jfeat.pdf.print.util.Fonts;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.List;

import static com.itextpdf.text.Font.NORMAL;

/**
 * Created by vincent on 2018/9/27.
 * 创建内容列表的 TableFlow, 没有边框，仅有文字，
 * 有指定title，TableFlow分两列， 没有指定title, TableFlow仅有一列
 */
public class ContentFlowBuilder {

    protected final static Logger logger = LoggerFactory.getLogger(ContentFlowBuilder.class);

    private boolean title;
    private float contentHeight;
    private Font contentFormat;
    private Font numberFormat;
    private String [] titles;
    private float[] columnWidths;
    private String[] lines;
    private int align;

    public ContentFlowBuilder(){
    }

    public ContentFlowBuilder columnWidths(float[] columnWidths){
        if(!title){
            throw new RuntimeException("title must be set for columnWidths!");
        }
        this.columnWidths = columnWidths;
        return this;
    }

    public ContentFlowBuilder contentFormat(Font contentFormat){
        this.contentFormat = contentFormat;
        return this;
    }

    public ContentFlowBuilder numberFormat(Font numberFormat){
        this.numberFormat = numberFormat;
        return this;
    }

    public ContentFlowBuilder contentHeight(float contentHeight){
        this.contentHeight = contentHeight;
        return this;
    }

    public ContentFlowBuilder title(){
        if(columnWidths!=null){
            throw new RuntimeException("title must be set before columnWidths!");
        }
        this.title = true;
        return this;
    }

    public ContentFlowBuilder titles(String[] titles){
        if(!title){
            throw new RuntimeException("title must be set previously!");
        }
        if(this.lines!=null && this.lines.length != titles.length){
            throw new RuntimeException("titles and lines length must be equal!");
        }
        this.titles = titles;
        return this;
    }

    public ContentFlowBuilder lines(String[] lines){
        if(this.titles!=null && this.titles.length != lines.length){
            throw new RuntimeException("titles and lines length must be equal!");
        }
        this.lines = lines;
        return this;
    }

    public ContentFlowBuilder align(int align) {
        this.align = align;
        return this;
    }

    public TableFlow build(){
        if(contentHeight<=0){
            throw new RuntimeException("contentHeight must be set!");
        }

        TableFlow report = new TableFlow();
        report.setColumnWidths(columnWidths);
        report.setBorderStyle(Rectangle.NO_BORDER);
        report.setRowHeight(contentHeight);
        report.setWidthPercentage(100);
        int verticalAlign = this.align;

        logger.info("content flow verticalAlign : {}", verticalAlign);
        List<ListRow> listRows = new ArrayList<>();

        for (int i = 0; i< lines.length; i++){
            String line = lines[i];
            TextBox lineRow = new TextBox(Element.ALIGN_LEFT, verticalAlign);
            if(numberFormat != null && line.matches("^\\d+$")) {
                lineRow.setContent(line, numberFormat);
            }else{
                lineRow.setContent(line, contentFormat);
            }

            if(titles!=null){
                String title = titles[i];
                TextBox titleRow = new TextBox(Element.ALIGN_LEFT, verticalAlign);
                if(numberFormat != null && title.matches("^\\d+$")) {
                    titleRow.setContent(title, numberFormat);
                }else{
                    titleRow.setContent(title, contentFormat);
                }

                listRows.add(titleRow);
            }

            listRows.add(lineRow);
        }

        report.setRows(listRows);

        return report;
    }

    public static void main(String[] args) throws DocumentException, FileNotFoundException {
        // must be run via @Test

        Font lineFont = new ChineseFont("微软雅黑", Fonts.FONT_SIZE_12, NORMAL, new BaseColor(30, 30, 37));

        String[] titles = new String[]{"平台订单编码", "收货人", "联系电话", "收货地"};
        String[] lines = new String[]{"12234235", "张伟", "13922212590", "广东省 广州市 天河区 棠下街道"};

        ContentFlowBuilder builder = new ContentFlowBuilder()
                .contentFormat(lineFont)
                .contentHeight(34)
                .title()
                .columnWidths(new float[]{1, 5})
                .titles(titles)
                .lines(lines);
        TableFlow tableFlow = builder.build();

        PdfExporter exporter = new PdfExporter();

        PdfContentByte canvas = exporter.export("table.pdf", 20).canvas();
        tableFlow.draw(canvas);

        exporter.addElement(tableFlow.getElement());

        exporter.close();
    }
}

