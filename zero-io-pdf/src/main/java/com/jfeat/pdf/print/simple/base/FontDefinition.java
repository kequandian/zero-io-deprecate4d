package com.jfeat.pdf.print.simple.base;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;

import java.io.IOException;

import static com.itextpdf.text.pdf.BaseFont.NOT_EMBEDDED;

/**
 * Created on 2020/5/8.
 *
 * @author Wen Hao
 */
@Deprecated
public class FontDefinition {

    /**
     * font family name
     */
    public static final String SONG = "SONG";

    public static final String HELVETICA = "HELVETICA";

    public static final String BASE = "BASE";

    /**
     * font style
     */
    public static final String NORMAL = "NORMAL";
    public static final String BOLD = "BOLD";
    public static final String ITALIC = "ITALIC";
    public static final String UNDERLINE = "UNDERLINE";
    public static final String STRIKETHRU = "STRIKETHRU";
    public static final String BOLDITALIC = "BOLDITALIC";


    public static final BaseFont SONG_FONT;
    public static final BaseFont HELVETICA_FONT;
    public static final BaseFont BASE_FONT;
    static {
        try {
            SONG_FONT = BaseFont.createFont("STSong-Light", "UniGB-UCS2-H", NOT_EMBEDDED);
            HELVETICA_FONT = BaseFont.createFont("Helvetica", "Cp1252", NOT_EMBEDDED);
            BASE_FONT = SONG_FONT;
        } catch (DocumentException | IOException e) {
            throw new RuntimeException(e);
        }
    }

    public static BaseFont getBaseFont (String familyName) {
        if (familyName.equals(SONG)) {
            return SONG_FONT;
        }
        if (familyName.equals(HELVETICA)) {
            return HELVETICA_FONT;
        }
        return BASE_FONT;
    }

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
}
