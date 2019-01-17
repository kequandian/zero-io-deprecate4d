package com.jfeat.pdf.print.util;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.BaseFont;

import java.io.IOException;

import static com.itextpdf.text.pdf.BaseFont.NOT_EMBEDDED;
import static com.itextpdf.text.pdf.BaseFont.createFont;

/**
 * Created by vincenthuang on 19/03/2018.
 */
public class Fonts {
    public static final float FONT_SIZE_6 = 6.0f;
    public static final float FONT_SIZE_8 = 8.0f;
    public static final float FONT_SIZE_9 = 9.0f;
    public static final float FONT_SIZE_10 = 12.60f;
    public static final float FONT_SIZE_12 = 14.12f;
    public static final float FONT_SIZE_14 = 15.64f;
    public static final float FONT_SIZE_16 = 17.16f;
    public static final float FONT_SIZE_18 = 18.68f;
    public static final float FONT_SIZE_20 = 20.20f;
    public static final float FONT_SIZE_21 = 20.96f;
    public static final float FONT_SIZE_22 = 21.72f;
    public static final float FONT_SIZE_24 = 24.24f;

    public static BaseFont SONG;
    public static BaseFont HELVETICA;

    static {
        try {
            SONG = createFont("STSong-Light", "UniGB-UCS2-H", NOT_EMBEDDED);
            HELVETICA = BaseFont.createFont("Helvetica", "Cp1252", NOT_EMBEDDED);

        } catch (DocumentException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }
}
