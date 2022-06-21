package com.jfeat.pdf.print.util;

import com.itextpdf.awt.AsianFontMapper;
import com.itextpdf.awt.FontMapper;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.Document;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfContentByte;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.awt.*;


/**
 * Created by vincenthuang on 21/03/2018.
 */
public class PdfFontMetrics {


    public static float getFontHeight(BaseFont baseFont, float fontSize){
        if(baseFont!=null) {
            float descent = baseFont.getFontDescriptor(BaseFont.DESCENT, fontSize);
            float ascent = baseFont.getFontDescriptor(BaseFont.ASCENT, fontSize);
            return ascent - descent;
        }
        return fontSize;
    }

    private FontMetrics fontMetrics;

    private Font ifont;

    protected final static Logger logger = LoggerFactory.getLogger(PdfFontMetrics.class);


    public PdfFontMetrics(PdfContentByte canvas, Font ifont){

        String temp_font = "wqy-microhei";
        this.ifont = ifont;
        /// logger.info("name: {} style: {} size: {}", ifont.getFamilyname(), ifont.getStyle(), ifont.getSize());
        //java.awt.Font font = new java.awt.Font(ifont.getFamilyname(), ifont.getStyle(), (int) ifont.getSize());
        // 临时设置字体
        // 使用 awt
        java.awt.Font font = new java.awt.Font(temp_font, ifont.getStyle(), (int) ifont.getSize());

        PdfGraphics2D graphics2D = createGraphics2D(canvas);
        graphics2D.setFont(font);
        fontMetrics = graphics2D.getFontMetrics(font);

        logger.info("name: {} style: {} size: {}", ifont.getFamilyname(), ifont.getStyle(), ifont.getSize());
        logger.info("chinese width --> {}, letter width --> {}", fontMetrics.stringWidth("测"), fontMetrics.stringWidth("A"));
        float width1 = ifont.getCalculatedBaseFont(true).getWidthPoint("测", ifont.getCalculatedSize());
        float width2 = ifont.getCalculatedBaseFont(true).getWidthPoint("A", ifont.getCalculatedSize());
        logger.info("chinese width --> {}, letter width --> {}", width1, width2);

        graphics2D.dispose();
    }

    public int getStringWidth(String content){
        return fontMetrics.stringWidth(content);
    }

    public int getFontStringWidth(String content) {
        return Math.round(ifont.getCalculatedBaseFont(true)
                .getWidthPoint(content, ifont.getCalculatedSize()));
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
