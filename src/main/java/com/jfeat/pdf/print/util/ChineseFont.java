package com.jfeat.pdf.print.util;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;

/**
 * Created by vincenthuang on 16/03/2018.
 */
public class ChineseFont extends Font{

    public ChineseFont(String familyname, float textSize, int style, BaseColor color) {
        super(Fonts.Definition.getFont(familyname), textSize, style, color);
        setFamily(familyname);
    }

    public ChineseFont(Font font) {
        super(Fonts.BASE, font.getSize());

        setFamily(font.getFamilyname());
        setStyle(font.getStyle());
        setColor(font.getColor());
    }

}
