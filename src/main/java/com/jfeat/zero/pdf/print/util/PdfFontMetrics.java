package com.jfeat.zero.pdf.print.util;

import com.itextpdf.awt.AsianFontMapper;
import com.itextpdf.awt.FontMapper;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;

import java.awt.*;


/**
 * Created by vincenthuang on 21/03/2018.
 */
public class PdfFontMetrics {

    public static float getFontHeight(BaseFont baseFont, float fontSize){
        float descent = baseFont.getFontDescriptor(BaseFont.DESCENT, fontSize);
        float ascent = baseFont.getFontDescriptor(BaseFont.ASCENT, fontSize);
        return ascent - descent;
    }

    private FontMetrics fontMetrics;

    public PdfFontMetrics(PdfContentByte canvas, Font ifont){
        java.awt.Font font = new java.awt.Font(ifont.getFamilyname(), ifont.getStyle(), (int) ifont.getSize());
        PdfGraphics2D graphics2D = createGraphics2D(canvas);
        graphics2D.setFont(font);
        fontMetrics = graphics2D.getFontMetrics(font);

        graphics2D.dispose();
    }

    public int getStringWidth(String content){
        return fontMetrics.stringWidth(content);
    }

    public int getStringHeight(){
        return fontMetrics.getAscent() - fontMetrics.getDescent();
    }

    private PdfGraphics2D createGraphics2D(PdfContentByte canvas) {

        Document document = canvas.getPdfDocument();
        com.itextpdf.text.Rectangle pageSize = document.getPageSize(); //获取pdf文档的大小

        //添加关于中文的支持
        FontMapper fm = new AsianFontMapper(AsianFontMapper.ChineseSimplifiedFont, AsianFontMapper.ChineseSimplifiedEncoding_H);

        PdfGraphics2D graphics2D = new PdfGraphics2D(canvas, pageSize.getWidth(), pageSize.getHeight(), fm);


        return graphics2D;
    }
}
