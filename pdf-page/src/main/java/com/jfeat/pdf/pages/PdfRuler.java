package com.jfeat.pdf.pages;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;

import java.io.FileOutputStream;
import java.io.IOException;

public class PdfRuler {
    public static void drawRuler(String pdfFilePath, int pageNumber)throws IOException, DocumentException {
        String pdfFileName = pdfFilePath.substring(0, pdfFilePath.length()-".pdf".length());
        PdfReader reader = new PdfReader(pdfFilePath);
        PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(String.format("%s-new.pdf",pdfFileName)));

        ///
        PdfContentByte cover = stamp.getOverContent(pageNumber);
        float pageWidth = cover.getPdfDocument().getPageSize().getWidth();
        float pageHeight = cover.getPdfDocument().getPageSize().getHeight();
        cover.saveState();
        // begin draw
        OnDrawRuler(cover, pageWidth, pageHeight);
        OnDrawRulerMarker(cover, pageWidth, pageHeight);
        // end draw
        cover.restoreState();

        stamp.close();
        reader.close();
    }

    private static void OnDrawRuler(PdfContentByte canvas, float pageWidth, float pageHeight) throws IOException, DocumentException{
        canvas.setColorStroke(BaseColor.RED);
        canvas.setLineWidth(0.05f);

        float ww = 10f;
        float hh = 10f;

        float factorW = 8;
        float factorH = 6;

        float distW = 1;
        float distH = 1;
        float distWx5 = 2;
        float distHx5 = 2;
        float distWx10 = 3f;
        float distHx10 = 3f;

        for(int h=(int)hh; h<pageHeight; h+= hh){
            float dist = (h%100==0) ? distHx10 : ((h%50==0)? distHx5 : distH);

            canvas.moveTo(0, h);
            canvas.lineTo(factorH*dist, h);
        }

        for(int w=(int)ww; w<pageWidth; w+= ww){
            float dist = (w%100==0) ? distWx10 : ((w%50==0)? distWx5 : distW);

            canvas.moveTo(w, 0);
            canvas.lineTo(w, factorW*dist*0.8);
        }

        canvas.stroke();
    }

    private static void OnDrawRulerMarker(PdfContentByte canvas, float pageWidth, float pageHeight) throws IOException, DocumentException{
        float ww = 10f;
        float hh = 10f;

        float factorW = 8;
        float factorH = 6;

        float distX = 3;

        float markerW = factorW * distX - 6;
        float markerH = factorH * distX - 4;

        float offset = 1;
        float fontSize = 6;  // 字体大小

        canvas.beginText();
        canvas.setFontAndSize(BaseFont.createFont(), fontSize);

        for(int h=(int)hh; h<pageHeight; h+= hh){
            if(h%100==0){
                // draw text
                canvas.showTextAligned(PdfContentByte.ALIGN_LEFT, String.valueOf(h), markerW, h+offset, 90);
            }
        }

        for(int w=(int)ww; w<pageWidth; w+= ww){
            if(w%100==0){
                // draw text
                canvas.showTextAligned(PdfContentByte.ALIGN_LEFT, String.valueOf(w), w+offset, markerH, 0);
            }
        }

        canvas.endText();
    }
}
