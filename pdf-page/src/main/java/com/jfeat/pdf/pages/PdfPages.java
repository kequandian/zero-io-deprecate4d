package com.jfeat.pdf.pages;

import com.itextpdf.text.*;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;
import com.jfeat.pdf.pages.util.FilePathExtention;
import com.jfeat.pdf.pages.util.ImageUtil;

import java.awt.*;
import java.awt.Image;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Created by vincent on 2018/5/9.
 */
public class PdfPages {

    public static void createPage(String pdfFilePath, String... imageUrl) throws IOException, DocumentException {
        // create empty PdfReader
        Document document = new Document(PageSize.A4);
        PdfWriter pdfWriter = PdfWriter.getInstance(document, new FileOutputStream(pdfFilePath));
        document.open();

        PdfContentByte canvas = pdfWriter.getDirectContent();
        for (String url : imageUrl) {
            document.newPage();
            addImage(canvas, url);
        }

        document.close();
    }

    public static void insertPage(String pdfFilePath, String... imageUrl) throws IOException, DocumentException {
        PdfReader reader = new PdfReader(pdfFilePath);
        Rectangle pageSize = reader.getPageSize(1);

        String newPdfFile = FilePathExtention.removeExtension(pdfFilePath) + "-new.pdf";

        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(newPdfFile));

        /// append image
        for (String url : imageUrl) {
            stamper.insertPage(1, pageSize);

            PdfContentByte canvas = stamper.getOverContent(1);
            addImage(canvas, url);
        }

        stamper.close();
        reader.close();
    }

    public static void addPage(String pdfFilePath, String... imageUrl) throws IOException, DocumentException {
        PdfReader reader = new PdfReader(pdfFilePath);
        Rectangle pageSize = reader.getPageSize(1);

        String newPdfFile = FilePathExtention.removeExtension(pdfFilePath) + "-new.pdf";

        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(newPdfFile));

        /// append image
        for (String url : imageUrl) {
            int newPages = reader.getNumberOfPages() + 1;
            stamper.insertPage(newPages, pageSize);

            PdfContentByte canvas = stamper.getOverContent(newPages);
            addImage(canvas, url);
        }

        stamper.close();
        reader.close();
    }

    private static void addImage(PdfContentByte canvas, String imageUrl) throws IOException, DocumentException {
        Rectangle pageSize = canvas.getPdfDocument().getPageSize();

        Image img = ImageUtil.getImage(imageUrl);
        com.itextpdf.text.Image image = com.itextpdf.text.Image.getInstance(img, Color.BLACK);
        image.setAlignment(Element.ALIGN_LEFT);
        image.scaleAbsolute(pageSize.getWidth(), pageSize.getHeight());
        image.setAbsolutePosition(0, 0);

        canvas.addImage(image);
    }

    public static  void  mergePages(String pdfFilePath, String mergePdfFielPath) throws IOException, DocumentException {
        PdfReader reader = new PdfReader(pdfFilePath);
        PdfReader mergeReader = new PdfReader(mergePdfFielPath);

        String newPdfFile = FilePathExtention.removeExtension(pdfFilePath) + "-new.pdf";

        PdfStamper stamper = new PdfStamper(reader, new FileOutputStream(newPdfFile));

        for(int index=1; index<=mergeReader.getNumberOfPages(); index++) {
            int newPages = reader.getNumberOfPages() + 1;

            Rectangle pageSize = mergeReader.getPageSize(index);

            stamper.insertPage(newPages, pageSize);
            PdfContentByte page1 = stamper.getOverContent(newPages);
            PdfImportedPage page = stamper.getImportedPage(mergeReader, index);
            page1.addTemplate(page, 0, 0);
        }

        stamper.close();
        reader.close();
        mergeReader.close();
    }

    public static  void deletePage(String pdfFilePath, int[] pageNum) throws IOException, DocumentException {
        PdfReader reader = new PdfReader(pdfFilePath);
        int numberOfPages = reader.getNumberOfPages();
        java.util.List<Integer> list = new ArrayList<>();

        for(int i=1;i<=numberOfPages;i++){
            boolean skip=false;
            for(int pi : pageNum) {

                // if page num < 0, means the last one
                if(pi<0){
                    pi = numberOfPages + pi + 1;
                }
                // end

                if(i==pi){
                    skip = true;
                }
            }
            if (!skip) {
                list.add(i);
            }

            //reset
            skip = false;
        }

        String newPdfFile = FilePathExtention.removeExtension(pdfFilePath) + "-new.pdf";

        reader.selectPages(list);
        PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(newPdfFile));
        stamp.close();
        reader.close();
    }
}
