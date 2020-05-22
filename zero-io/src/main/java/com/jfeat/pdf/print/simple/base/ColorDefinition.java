package com.jfeat.pdf.print.simple.base;

import com.itextpdf.text.BaseColor;

/**
 * Created on 2020/5/8.
 *
 * @author Wen Hao
 */
public class ColorDefinition {

    public final static String BLACK = "BLACK";

    public final static String WHITE = "WHITE";

    public final static String RED = "RED";

    public final static String YELLOW = "YELLOW";

    public final static String BLUE = "BLUE";

    public final static String GREEN = "GREEN";

    public static BaseColor getBaseColor(String colorName) {
        if (BLACK.equals(colorName)) {
            return BaseColor.BLACK;
        } else if (WHITE.equals(colorName)) {
            return BaseColor.WHITE;
        } else if (RED.equals(colorName)) {
            return BaseColor.RED;
        } else if (YELLOW.equals(colorName)) {
            return BaseColor.YELLOW;
        } else if (GREEN.equals(colorName)) {
            return BaseColor.GREEN;
        } else if (BLUE.equals(colorName)) {
            return BaseColor.BLUE;
        } else {
            throw new RuntimeException("provide the color name is more color is required.");
        }
    }
}
