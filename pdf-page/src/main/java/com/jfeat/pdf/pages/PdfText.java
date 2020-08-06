package com.jfeat.pdf.pages;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.*;
import com.jfeat.pdf.pages.util.ChineseFont;

import java.io.FileOutputStream;
import java.io.IOException;

import static com.itextpdf.text.Font.BOLD;
import static com.itextpdf.text.pdf.BaseFont.NOT_EMBEDDED;
import static com.itextpdf.text.pdf.BaseFont.createFont;

public class PdfText {
    public static BaseFont SONG;
    //public static BaseFont HELVETICA;

    static {
        try {
            SONG = createFont("STSong-Light", "UniGB-UCS2-H", NOT_EMBEDDED);
            //HELVETICA = createFont("Helvetica", "Cp1252", NOT_EMBEDDED);
        } catch (DocumentException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static void drawText(String pdfFilePath, int pageNumber, float posx, float posy, String text, int alignment, float fontSize, String fontFamily)throws IOException, DocumentException {

        String pdfFileName = pdfFilePath.substring(0, pdfFilePath.length()-".pdf".length());
        PdfReader reader = new PdfReader(pdfFilePath);
        PdfStamper stamp = new PdfStamper(reader, new FileOutputStream(String.format("%s-new.pdf",pdfFileName)));

        PdfContentByte cover = stamp.getOverContent(pageNumber);
        cover.saveState();
        // begin draw
        OnDrawText(cover, posx, posy, text, alignment, fontSize, fontFamily);
        // end draw
        cover.restoreState();

        stamp.close();
        reader.close();
    }

    private static void OnDrawText(PdfContentByte canvas, float posx, float posy, String text, int alignment, float fontSize, String fontFamily) throws IOException, DocumentException{

        BaseColor textColor = new BaseColor(30,30,30);
        Font font = new ChineseFont(fontFamily, fontSize, BOLD, textColor);

        /// 无法输出中文
        canvas.beginText();
        ColumnText.showTextAligned(canvas, alignment, new Phrase(text, font), posx, posy, 0);
        canvas.endText();

        //canvas.beginText();
        //canvas.setFontAndSize(SONG, fontSize);
        //canvas.showTextAligned(alignment, text, posx, posy, 0);
        //canvas.endText();
    }
}
