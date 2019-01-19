package com.jfeat.pdf.print.util;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;

/**
 * Created by vincenthuang on 16/03/2018.
 */
public class ChineseFont extends Font{

    //BaseFont baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
    public ChineseFont(String familyname, float textSize, int style, BaseColor color) {
        super(Fonts.Definition.getFont(familyname), textSize, style, color);
        setFamily(familyname);
    }

    public ChineseFont(Font font) {
        //BaseFont baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
        super(Fonts.HELVETICA, font.getSize());

        setFamily(font.getFamilyname());
        setStyle(font.getStyle());
        setColor(font.getColor());
    }

}
