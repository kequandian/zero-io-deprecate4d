package com.jfeat.pdf;

import com.itextpdf.text.*;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.PdfWriter;
import com.jfeat.pdf.print.util.ImageUtil;
import java.io.*;

/**
 * Created by zy on 2019/4/1.
 */
public class ItextTest {
    public static void main(String[] args) throws IOException, DocumentException {
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream("test.pdf"));
        document.open();
        Image image = Image.getInstance(ImageUtil.getBytes("test.png"));

        document.add(image);
        document.close();
    }
}
