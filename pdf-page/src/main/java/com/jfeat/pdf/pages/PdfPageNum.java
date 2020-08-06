package com.jfeat.pdf.pages;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import java.io.FileOutputStream;
import java.io.IOException;

public class PdfPageNum {
    public static void printPageNumber(String pdfFilePath, int pageNumber) throws IOException, DocumentException{
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
        cover.beginText();
        cover.setFontAndSize(BaseFont.createFont(), 9);
        // draw text
        for(int pos=0; pos<pageHeight; pos+=25) {
            cover.showTextAligned(PdfContentByte.ALIGN_LEFT, String.valueOf(pos), 10, pos, 0);
        }
        // end text
        cover.endText();

        cover.setColorStroke(BaseColor.BLACK);
        for(int pos=0; pos<pageHeight; pos+=25) {
            cover.moveTo(0, pos);
            cover.lineTo(20, pos);
        }
        cover.restoreState();

        stamp.close();
        reader.close();
    }
}
