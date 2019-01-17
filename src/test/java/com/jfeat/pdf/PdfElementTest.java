package com.jfeat.pdf;

/**
 * https://developers.itextpdf.com/question/how-add-two-images-one-cell
 */

import com.itextpdf.text.*;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.BarcodeQRCode;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfWriter;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.report.row.FlowListRow;
import org.junit.Test;

import javax.swing.filechooser.FileSystemView;
import java.io.File;
import java.io.FileOutputStream;


public class PdfElementTest {

    FileSystemView fsv = FileSystemView.getFileSystemView();
    File com = fsv.getHomeDirectory();    //读取桌面路径
    String DESKTOP_DIR = com.getPath() + "/";
    File pdfFile = new File("test.pdf");


    @Test
    public void testListBox() throws Exception {
        Document document = new Document(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        document.open();

        PdfContentByte canvas = writer.getDirectContent();

        Font font = FontFactory.getFont(FontFactory.COURIER_BOLD, 18, Font.BOLD, BaseColor.RED);
        Font font1 = FontFactory.getFont(FontFactory.COURIER_BOLD, 12, Font.BOLD, BaseColor.RED);
        Rectangle position = new Rectangle(50, document.getPageSize().getTop()-50, 400, document.getPageSize().getTop()-150);
        position.normalize();

        /// draw text box
        com.itextpdf.text.Image qrCode = new BarcodeQRCode("http://qrcode.com", 10, 10, null)
                .getImage();
        com.itextpdf.text.Image qrCodeNext = new BarcodeQRCode("http://qrcode.com", 10, 10, null)
                .getImage();

        /// draw listRow
        FlowListRow flowListRow = new FlowListRow(position)
                .title("标题", "副标题", "", font, font1,null,5f, 10f, Element.ALIGN_BASELINE)
                .value("值", font)
                .icon(qrCode)
                //.next(qrCodeNext)
        ;

        flowListRow.setPadding(8);
        flowListRow.setBorder(Rectangle.BOX);
        flowListRow.setBorderWidth(1);
        flowListRow.setBorderColor(BaseColor.BLUE);

        flowListRow.draw(canvas, position);

        document.close();
    }

    @Test
    public void testTextBox() throws Exception {
        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        document.open();
        PdfContentByte canvas = writer.getDirectContent();

        Font font = FontFactory.getFont(FontFactory.COURIER_BOLD, 14, Font.BOLD, BaseColor.WHITE);
        Rectangle position = new Rectangle(50, document.getPageSize().getTop()-50, 200, document.getPageSize().getTop()-150);

        /// draw text box
        TextBox textBox = new TextBox(position,"中文", font);
        textBox.setBackgroundColor(BaseColor.BLUE);
        textBox.draw(canvas, textBox);

        document.close();
    }

}
