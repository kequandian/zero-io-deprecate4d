package com.jfeat.zero.pdf;

/**
 * https://developers.itextpdf.com/question/how-add-two-images-one-cell
 */

import com.itextpdf.awt.AsianFontMapper;
import com.itextpdf.awt.FontMapper;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.*;
import com.itextpdf.text.Font;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.draw.VerticalPositionMark;
import org.junit.Test;

import javax.swing.filechooser.FileSystemView;
import java.awt.*;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;

public class PdfBaseTest {
/*

    FileSystemView fsv = FileSystemView.getFileSystemView();
    File com = fsv.getHomeDirectory();    //读取桌面路径
    String DESKTOP_DIR = com.getPath() + "/";
    File pdfFile = new File("test.pdf");

    @Test
    public void createLeftRightPhrase() throws IOException, DocumentException {
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        document.open();

        PdfPTable table = new PdfPTable(1);

        Chunk glue = new Chunk(new VerticalPositionMark());
        Phrase p = new Phrase();
        p.add("Left");
        p.add(glue);
        p.add("Right");

        table.addCell(p);

        document.add(table);
        document.close();
    }

    @Test
    public void testParagraph() throws DocumentException, IOException { //最简单的例子,helloworld
        Document document = new Document(PageSize.A4);
        //Step 2—Get a PdfWriter instance.
        PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        //Step 3—Open the Document.
        document.open();

        try {
            //中文支持
            BaseFont baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
            Font chineseFont = new Font(baseFont);

            Paragraph paragraph = new Paragraph("这是我的第一个pdf文档", chineseFont);
            document.add(paragraph);

        }catch (DocumentException e){
        }catch (IOException e){
        }

        document.close();
    }

    @Test
    public void demoGraphicsString() throws IOException, DocumentException {
        FileOutputStream fo = new FileOutputStream(pdfFile.getAbsoluteFile());
        com.itextpdf.text.Rectangle size = new com.itextpdf.text.Rectangle(800, 6000);
        Document doc = new Document(size);
        PdfWriter pdfWriter = PdfWriter.getInstance(doc, fo);
        doc.open();

        PdfContentByte canvas = pdfWriter.getDirectContent();
        FontMapper fm = new AsianFontMapper(AsianFontMapper.ChineseSimplifiedFont, AsianFontMapper.ChineseSimplifiedEncoding_H);

        PdfGraphics2D pdfG = new PdfGraphics2D(canvas, size.getWidth(), size.getHeight(), fm);
        pdfG.drawString("中文测试abc123", 100, 100);
        pdfG.setColor(Color.BLUE);
        pdfG.drawRect(0, 0, 120, 45);
        pdfG.dispose();

        doc.close();
        pdfWriter.close();
        fo.close();
    }

    @Test
    public void testDocumentSize() throws IOException, DocumentException {
        //PdfDocumentWrapper pdfDocumentWrapper = new PdfDocumentWrapper();
        Document document = new Document(PageSize.A4);
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream("test.pdf"));
        document.open();

        com.itextpdf.text.Rectangle size = document.getPageSize(); //获取pdf文档的大小

        PdfContentByte canvas = writer.getDirectContent();
        FontMapper fm = new AsianFontMapper(AsianFontMapper.ChineseSimplifiedFont, AsianFontMapper.ChineseSimplifiedEncoding_H);//添加关于中文的支持
        PdfGraphics2D graphics2D = new PdfGraphics2D(canvas, size.getWidth(), size.getHeight(), fm);

        graphics2D.drawString("中文测试abc123", 100, 100);
        graphics2D.setColor(Color.BLUE);
        graphics2D.drawRect(0, 0, 120, 45);

        document.open();
    }

    public void inspect(PrintWriter writer, String filename)
            throws IOException {
        PdfReader reader = new PdfReader(filename);
        writer.println(filename);
        writer.print("Number of pages: ");
        int numberOfPages = reader.getNumberOfPages();
        writer.println(reader.getNumberOfPages());
        Rectangle mediabox = reader.getPageSize(1);
        writer.print("Size of page 1: [");
        writer.print(mediabox.getLeft());
        writer.print(',');
        writer.print(mediabox.getBottom());
        writer.print(',');
        writer.print(mediabox.getRight());
        writer.print(',');
        writer.print(mediabox.getTop());
        writer.println("]");
        writer.print("Rotation of page 1: ");
        writer.println(reader.getPageRotation(1));
        writer.print("Page size with rotation of page 1: ");
        writer.println(reader.getPageSizeWithRotation(1));
        writer.print("Is rebuilt? ");
        writer.println(reader.isRebuilt());
        writer.print("Is encrypted? ");
        writer.println(reader.isEncrypted());
        writer.println();
        writer.flush();
        reader.close();
    }

    @Test
    public void testPage() throws Exception {
        final String templatePdf = "海珠区人民政府一卡通系统数据分析与修复服务合同4-23.pdf";
        final String RESULT = "insertPage.pdf";

        PrintWriter writer = new PrintWriter(new FileOutputStream(RESULT));
        inspect(writer, templatePdf);
        writer.close();

        if(true)return;

        FileOutputStream out = new FileOutputStream("insertPage.pdf");

        Document document = new Document();

        PdfWriter.getInstance(document, out);

        document.open();
        Paragraph paragraph = new Paragraph("1 page");
        paragraph.setAlignment(Element.ALIGN_BASELINE);
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.setIndentationLeft(45);
        document.add(paragraph);

        document.newPage();
        document.add(new Paragraph("2 page"));

        document.newPage();
        document.add(new Paragraph("3 page"));

        document.close();
    }

    @Test
    public void testCellEvent() throws Exception {
        Document document = new Document();
        PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
        document.open();

        PdfPTable table = new PdfPTable(2);
        table.getDefaultCell().setCellEvent(new PdfPCellEvent() {

            protected String columns = "Gravity";
            protected String rows = "Occ";

            @Override
            public void cellLayout(PdfPCell cell, Rectangle position,
                                   PdfContentByte[] canvases) {

                PdfContentByte canvas = canvases[PdfPTable.TEXTCANVAS];
                ColumnText.showTextAligned(canvas, Element.ALIGN_RIGHT,
                        new Phrase(columns), position.getRight(2), position.getTop(12), 0);
                ColumnText.showTextAligned(canvas, Element.ALIGN_LEFT,
                        new Phrase(rows), position.getLeft(2), position.getBottom(2), 0);

                canvas = canvases[PdfPTable.LINECANVAS];
                canvas.moveTo(position.getLeft(), position.getTop());
                canvas.lineTo(position.getRight(), position.getBottom());
                canvas.stroke();
            }
        });


        table.addCell("Comp_Name");
        table.addCell("Comp_Address");
        String id1 = table.getRows().get(0).getCells()[0].getId().toString();
        String id2 = table.getRows().get(0).getCells()[1].getId().toString();
        table.addCell("Comp_Contact");
        table.addCell("Comp_Email");
        String id3 = table.getRows().get(1).getCells()[0].getId().toString();
        String id4 = table.getRows().get(1).getCells()[1].getId().toString();
        table.addCell("Comp_TIN");
        table.addCell("Comp_ST");
        String id5 = table.getRows().get(2).getCells()[0].getId().toString();
        String id6 = table.getRows().get(2).getCells()[1].getId().toString();

        document.add(table);

        document.close();
    }

    @Test
    public void testTableCell() throws Exception {
        try {
            Document document = new Document();
            PdfWriter writer = PdfWriter.getInstance(document, new FileOutputStream(pdfFile));
            document.setMargins(1, 10, 20, 30);
            document.open();
            PdfContentByte canvas = writer.getDirectContent();
            Rectangle pageSize = document.getPageSize();

            PdfPTable table = new PdfPTable(2);
            table.setTotalWidth(document.getPageSize().getWidth() - 200);
            //table.setWidthPercentage(50f);

            PdfPCell cell = new PdfPCell();
            cell.setCellEvent(new PdfPCellEvent() {
                @Override
                public void cellLayout(PdfPCell pdfPCell, Rectangle rectangle, PdfContentByte[] pdfContentBytes) {

                }
            });
            //PdfDiv div = new PdfDiv();
            //cell.addElement(div);

            BarcodeQRCode barcodeQRCode = new BarcodeQRCode("http://test.com", 10, 10, null);
            com.itextpdf.text.Image image = barcodeQRCode.getImage();
            image.scaleAbsolute(50, 50);
            image.setAlignment(Element.ALIGN_RIGHT);

            com.itextpdf.text.Image qrCode = new BarcodeQRCode("http://qrcode.com", 10, 10, null).getImage();
            qrCode.scaleAbsolute(50, 50);
            qrCode.setAlignment(Element.ALIGN_RIGHT);
            Paragraph phrase = new Paragraph();
            //phrase.add(new Chunk(qrCode, 0, -27));

            // add title
            PdfPCell titleCell = new PdfPCell();
            titleCell.setBorder(Rectangle.NO_BORDER);
            Paragraph title = new Paragraph("Title", FontFactory.getFont(FontFactory.TIMES_BOLDITALIC, 14, Font.BOLD, BaseColor.BLUE));
            Paragraph subtitle = new Paragraph("Subtitle", FontFactory.getFont(FontFactory.TIMES_BOLDITALIC, 14, Font.BOLD, BaseColor.BLUE));
            titleCell.addElement(title);
            titleCell.addElement(subtitle);


            //phrase.add(titleCell);

            //p1.setAlignment(Element.ALIGN_RIGHT);

            //cell.addElement(p1);
            //cell.addElement(new Paragraph("Company Information",FontFactory.getFont(FontFactory.TIMES_BOLDITALIC,14,Font.BOLD,BaseColor.WHITE)));
            //cell.addElement(image);
            //phrase.add(new Chunk(new VerticalPositionMark()));
            Paragraph p1 = new Paragraph("Company", FontFactory.getFont(FontFactory.COURIER, 14, Font.BOLD, BaseColor.CYAN));
            //phrase.add(new Chunk(new Verti
            Paragraph p2 = new Paragraph(" Info", FontFactory.getFont(FontFactory.COURIER, 12, Font.BOLD, BaseColor.DARK_GRAY));

            //cell.setColspan(4);
            //cell.setHorizontalAlignment(Element.ALIGN_CENTER);
            //cell.setBackgroundColor(BaseColor.RED);
            //cell.setPadding(9.0f);
            p1.setIndentationLeft(20);
            phrase.add(p1);
            phrase.add(Chunk.NEWLINE);
            p2.setFirstLineIndent(0);
            p2.setIndentationLeft(0);
            phrase.add(p2);

            PdfPTable tab1 = new PdfPTable(new float[]{2, 1});
            tab1.getDefaultCell().setBorder(Rectangle.NO_BORDER);
            tab1.getDefaultCell().setBorderWidth(0);
            tab1.addCell(phrase);

            titleCell.setHorizontalAlignment(Element.ALIGN_RIGHT);
            tab1.addCell(image);

            //PdfPTable tab2 = new PdfPTable(1);
            //tab2.addCell(titleCell);

            //cell.addElement(phrase);
            //cell.addElement(titleCell);
            //table.addCell(phrase);
            //table.addCell(titleCell);
            table.addCell(tab1);
            //table.addCell(tab2);
            table.getDefaultCell().setFixedHeight(60);


			*/
/*PdfContentByte canvas=writer.getDirectContent();
            Rectangle rect=new Rectangle(1,770,594,841);//left,bottom,right,top
			rect.setBorder(Rectangle.BOX);
			rect.setBackgroundColor(new BaseColor(31,155,118));
			rect.setBorderWidth(2);
			rect.setBorderColor(new BaseColor(31,155,118));
			canvas.rectangle(rect);
			table.writeSelectedRows(0,0,169,table.getTotalHeight()+10, canvas);*//*


            table.addCell("Comp_Name");
            table.addCell("Comp_Address");
            table.addCell("Comp_Contact");
            table.addCell("Comp_Email");
            table.addCell("Comp_TIN");
            table.addCell("Comp_ST");
            table.addCell("Comp_CIN");

            //table.writeSelectedRows(0,-1, 100, 200, canvas);
            table.writeSelectedRows(0, -1, 100, document.top() - 100, canvas);

            //table.completeRow();

            //document.add(table);

            document.close();
        } catch (Exception e) {
        }
    }
*/

}
