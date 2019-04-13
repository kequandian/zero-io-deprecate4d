package com.jfeat.zero.pdf;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.zero.pdf.print.PdfExporter;
import com.jfeat.zero.pdf.print.PdfFlowRequest;
import com.jfeat.zero.pdf.print.base.BorderDefinition;
import com.jfeat.zero.pdf.print.base.FontDefinition;
import com.jfeat.zero.pdf.print.element.DashedLineSeparator;
import com.jfeat.zero.pdf.print.element.FlowLayout;
import com.jfeat.zero.pdf.print.element.TextBox;
import com.jfeat.zero.pdf.print.flow.BarCodes;
import com.jfeat.zero.pdf.print.flow.ContentFlowBuilder;
import com.jfeat.zero.pdf.print.flow.TableFlow;
import com.jfeat.zero.pdf.print.flow.TableFlowBuilder;
import com.jfeat.zero.pdf.print.util.ChineseFont;
import com.jfeat.zero.pdf.print.util.Fonts;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;

import static com.itextpdf.text.Font.BOLD;
import static com.itextpdf.text.Font.NORMAL;

/**
 * Created by vincenthuang on 25/03/2018.
 */
public class TableFlowTest {

    @Test
    public void testHorizontalLayout() throws IOException, DocumentException, FileNotFoundException {
        PdfExporter exporter = new PdfExporter();
        PdfContentByte canvas = exporter.export("table.pdf", 20).canvas();

        BaseColor textColor = new BaseColor(30,30,30);
        Font headerFormat = new ChineseFont("宋体", 9, BOLD, textColor);
        Font rowFormat = new ChineseFont("宋体", 9, NORMAL, textColor);

        String[] listRows = new String[]{
                "序号","商品编号", "关键属性", "商品名称", "货号", "库位", "数量",
                "1", "405936432908", "6-1号黑色/亮白", "【狂疯价】adidas 阿迪达斯 三叶草 男子 X_PLR 经典鞋 CQ2405", "CQ2405", "3-1F2-0244-1-1", "1"};

        TableFlow tableFlow = new TableFlowBuilder()
                .columnWidths(new float[]{2f, 8, 5, 10, 4, 4, 2f})
                .header().headerHeight(30).headerFormat(headerFormat).headerTitle("商品清单")
                .firstRow().firstRowHeight(24).firstRowFormat(rowFormat)
                .rowHeight(30).rowFormat(rowFormat)
                .rows(listRows)
                .build()
                ;

        String[] headers = new String[]{
                "尺寸","颜色", "面料", "质量", "价格", "物流", "数量", ""};

        TableFlow tableFlowRight = new TableFlowBuilder()
                .numColumns(7)
                .header().headerHeight(30).headerFormat(headerFormat).headerTitle("中需退货，为更好地服务于你，请在退货原因处打")
                .firstRow().firstRowHeight(24).firstRowFormat(rowFormat)
                .rowHeight(30).rowFormat(rowFormat)
                .rows(headers)
                .build()
                ;


        //Image imageRight = Image.getInstance("https://timgsa.baidu.com/timg?image&quality=80&size=b10000_10000&sec=1538107195&di=25383e44fbc9940857fa0a1664732b21&src=http://img2.cnxz.cn/photo_upload/kindeditor/201503/23/20150323045328571.jpg");
        //imageRight.setAlignment(Image.RIGHT);
        //imageRight.scaleAbsolute(32, 32 * imageRight.getHeight()/imageRight.getWidth());

        Font titleFont = new ChineseFont("微软雅黑", Fonts.FONT_SIZE_14, BOLD, new BaseColor(30,30,37));
        Paragraph pageHint = new Paragraph("感谢你选择阿迪达斯官方网店商品！",titleFont);
        pageHint.setAlignment(Element.ALIGN_CENTER);


        tableFlow.draw(canvas);
        tableFlowRight.draw(canvas);

        /// barcode
        Font barcodeFont = new Font(Fonts.HELVETICA);
        barcodeFont.setSize(9);

        FlowLayout qrCodeLayout = new FlowLayout(1);
        qrCodeLayout.add(BarCodes.createBarCode39(canvas, "P13224242", true));
        qrCodeLayout.add(new Phrase("配货批次号：P13224242", barcodeFont));

        //条码间隔
        qrCodeLayout.setSpacingAfter(12);

        FlowLayout qrCode2Layout = new FlowLayout(1);
        qrCode2Layout.add(BarCodes.createBarCode39(canvas, "P13224242", true));
        qrCode2Layout.add(new Phrase("要单编号：OD22335464", barcodeFont));

        FlowLayout qrCodeStack = new FlowLayout(1);
        qrCodeStack.add(qrCodeLayout);
        qrCodeStack.add(qrCode2Layout);


        /// 订单信息
        Font lineFont = new ChineseFont("微软雅黑", 12, NORMAL, textColor);
        Font numFont = new Font(Fonts.HELVETICA);
        numFont.setSize(10);
        numFont.setColor(textColor);

        String[] titles = new String[] {"平台订单编码", "收货人", "联系电话", "收货地"};
        String[] lines = new String[] {"12234235", "张伟", "13922212590", "广东省 广州市 天河区 棠下街道"};

        ContentFlowBuilder builder = new ContentFlowBuilder()
                .contentFormat(lineFont)
                .numberFormat(numFont)
                .contentHeight(24)
                .title()
                .columnWidths(new float[]{2,5})
                .titles(titles)
                .lines(lines);
        TableFlow contentFlow = builder.build();

        contentFlow.draw(canvas);

        FlowLayout wrapLayout = new FlowLayout(new float[]{4, 2});
        wrapLayout.add((PdfPTable) contentFlow.getElement());
        wrapLayout.add(qrCodeStack);

        FlowLayout orderLayout = new FlowLayout(new float[]{4, 2});
        orderLayout.add((PdfPTable) tableFlow.getElement());
        orderLayout.add((PdfPTable) tableFlowRight.getElement());
        orderLayout.setSpacingBefore(10);

        // export
        //exporter.addElement(imageRight);
        exporter.addElement(pageHint);
        exporter.addElement(Chunk.NEWLINE);
        exporter.addElement(wrapLayout);
        exporter.addElement(Chunk.NEWLINE);
        exporter.addElement(new DashedLineSeparator());
        exporter.addElement(orderLayout);
        exporter.close();
    }

    @Test
    public void testTextBox()throws IOException, DocumentException, FileNotFoundException {
        PdfExporter exporter = new PdfExporter();
        PdfContentByte canvas = exporter.export("test.pdf", 20).canvas();
        //float pageTop = canvas.getPdfDocument().getPageSize().getTop();
        //Rectangle position = new Rectangle(100, pageTop-600, 200, pageTop - 500);

        /// create row
        Font lineFont = new Font(Fonts.SONG);
        lineFont.setSize(12);

        TextBox textBox = new TextBox();
        textBox.setContent("6-1号黑色/亮白", lineFont);
        TextBox emptyTextBox = new TextBox();

        TableFlow flow = new TableFlow(12);
        flow.setRowHeight(60);
        flow.addRow(emptyTextBox, 5);
        flow.addRow(textBox);
        flow.addRow(emptyTextBox, 6);

        flow.draw(canvas);

        exporter.addElement(Chunk.NEWLINE);
        exporter.addElement(flow.getElement());

        exporter.close();
    }

}
