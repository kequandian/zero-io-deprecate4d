package com.jfeat.pdf.pages;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import java.io.FileOutputStream;
import java.io.IOException;

public class PdfMask {
    public static void maskPage(String pdfFilePath, int pageNumber, int startPos, int sizeInHeight)throws IOException, DocumentException {
        String pdfFileName = pdfFilePath.substring(0, pdfFilePath.length()-".pdf".length());
        PdfReader reader = new PdfReader(pdfFilePath);
        PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(String.format("%s-new.pdf",pdfFileName)));

        // if page num < 0, means the last one
        int numberOfPages = reader.getNumberOfPages();
        if(pageNumber<0){
            pageNumber = numberOfPages + pageNumber + 1;
        }
        // end

        ///
        PdfContentByte cover = stamp.getOverContent(pageNumber);
        float pageWidth = cover.getPdfDocument().getPageSize().getWidth();
        float pageHeight = cover.getPdfDocument().getPageSize().getHeight();
        cover.saveState();
        // draw
        OnDraw(cover, startPos, pageWidth, sizeInHeight);
        // end draw
        cover.restoreState();
        stamp.close();
        reader.close();
    }

    private static void OnDraw(PdfContentByte canvas, int startPos, float width, float height) {
        canvas.setColorFill(BaseColor.WHITE);
        canvas.rectangle(12, startPos, width, height);
        canvas.fill();
    }
}
