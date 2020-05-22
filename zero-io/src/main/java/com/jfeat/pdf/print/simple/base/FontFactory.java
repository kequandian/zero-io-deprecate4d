package com.jfeat.pdf.print.simple.base;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.BaseFont;

/**
 * Created on 2020/5/8.
 *
 * @author Wen Hao
 */
public class FontFactory {

    public static Font getFont(String familyName, float size, String style, String color) {
        BaseFont baseFont = FontDefinition.getBaseFont(familyName);
        int fontStyle = FontDefinition.getStyle(style);
        BaseColor baseColor = ColorDefinition.getBaseColor(color);
        return new Font(baseFont, size, fontStyle, baseColor);
    }

}
