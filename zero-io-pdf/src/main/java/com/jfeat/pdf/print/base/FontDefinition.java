package com.jfeat.pdf.print.base;

import com.itextpdf.text.BaseColor;
import com.jfeat.pdf.print.util.ChineseFont;

/**
 * Created by vincenthuang on 25/03/2018.
 */
public class FontDefinition {
    //public static final int NORMAL = 0;
    //public static final int BOLD = 1;
    //public static final int ITALIC = 2;
    //public static final int UNDERLINE = 4;
    //public static final int STRIKETHRU = 8;
    //public static final int BOLDITALIC = 3;
    public static final String NORMAL = "NORMAL";
    public static final String BOLD = "BOLD";
    public static final String ITALIC = "ITALIC";
    public static final String UNDERLINE = "UNDERLINE";
    public static final String STRIKETHRU = "STRIKETHRU";
    public static final String BOLDITALIC = "BOLDITALIC";

    public static int getStyle(String style) {
        if (style.equals(BOLD)) {
            return com.itextpdf.text.Font.BOLD;
        }
        if (style.equals(ITALIC)) {
            return com.itextpdf.text.Font.ITALIC;
        }
        if (style.equals(UNDERLINE)) {
            return com.itextpdf.text.Font.UNDERLINE;
        }
        if (style.equals(STRIKETHRU)) {
            return com.itextpdf.text.Font.STRIKETHRU;
        }
        if (style.equals(BOLDITALIC)) {
            return com.itextpdf.text.Font.BOLDITALIC;
        }

        return com.itextpdf.text.Font.NORMAL;
    }

    public static com.itextpdf.text.Font getFont(FontDefinition font) {
        return new ChineseFont(font.getFamilyname(),
                font.getSize(),
                getStyle(font.getStyle()),
                ColorDefinition.getBaseColor(font.color));
    }


    /**
     * class FontDefinition
     */
    private String familyname;
    private String style;
    private float size;
    private String colorname;
    private ColorDefinition color;  //##00ff00

    public FontDefinition() {
    }

    public FontDefinition(String familyname, float size, String style, ColorDefinition color) {
        this.familyname = familyname;
        this.style = style;
        this.size = size;
        /// convert #ff000000 into BaseColor r,g,b
        this.color = color;
    }

    public FontDefinition(String familyname, float size, String style, String colorname) {
        this.familyname = familyname;
        this.style = style;
        this.size = size;
        this.colorname = colorname;
        this.color = ColorDefinition.getColor(colorname);
    }

    public String getFamilyname() {
        return familyname;
    }

    public void setFamilyname(String familyname) {
        this.familyname = familyname;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public float getSize() {
        return size;
    }

    public void setSize(float size) {
        this.size = size;
    }

    public String getColorname() {
        return colorname;
    }

    public void setColorname(String colorname) {
        this.colorname = colorname;
        this.color = ColorDefinition.getColor(colorname);
    }

    public ColorDefinition getColor() {
        return color;
    }

    public void setColor(ColorDefinition color) {
        this.color = color;
    }
}
