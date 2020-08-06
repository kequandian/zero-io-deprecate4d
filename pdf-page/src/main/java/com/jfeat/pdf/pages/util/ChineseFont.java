package com.jfeat.pdf.pages.util;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;

/**
 * Created by vincenthuang on 16/03/2018.
 */
public class ChineseFont extends Font{

    //BaseFont baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
    public ChineseFont(String familyname, float textSize, int style, BaseColor color) {
        super(Fonts.SONG, textSize, style, color);
        setFamily(familyname);
    }

    public ChineseFont(Font font) {
        //BaseFont baseFont = BaseFont.createFont("STSongStd-Light", "UniGB-UCS2-H", BaseFont.NOT_EMBEDDED);
        super(Fonts.SONG, font.getSize());

        setFamily(font.getFamilyname());
        setStyle(font.getStyle());
        setColor(font.getColor());
    }
}
