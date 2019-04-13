package com.jfeat.zero.pdf.print.base;

/**
 * Created by vincenthuang on 25/03/2018.
 */
public class ColorDefinition {
    public static final String CN_BLACK = "BLACK";
    public static final String CN_WHITE = "WHITE";
    public static final String CN_RED = "RED";
    public static final String CN_GREEN = "GREEN";
    public static final String CN_BLUE = "BLUE";

    public static ColorDefinition BLACK = new ColorDefinition(0,0,0);
    public static ColorDefinition WHITE = new ColorDefinition(255,255,255);
    public static ColorDefinition RED = new ColorDefinition(255,0,0);
    public static ColorDefinition BLUE = new ColorDefinition(0,0,255);
    public static ColorDefinition GREEN = new ColorDefinition(0,255,0);

    public static ColorDefinition getColor(String colorname) {
        if(CN_BLACK.equals(colorname)){
            return ColorDefinition.BLACK;
        }else if(CN_WHITE.equals(colorname)){
            return ColorDefinition.WHITE;
        }else if(CN_RED.equals(colorname)) {
            return ColorDefinition.RED;
        }else if(CN_GREEN.equals(colorname)) {
            return ColorDefinition.GREEN;
        }else if(CN_BLUE.equals(colorname)){
            return ColorDefinition.BLUE;
        }else{
            throw new RuntimeException("provide the color name is more color is required.");
        }
    }

    /**
     * class ColorDefinition
     */
    private int r;
    private int g;
    private int b;

    public ColorDefinition(){}

    public ColorDefinition(int r, int g, int b){
        this.r = r;
        this.g = g;
        this.b = b;
    }

    public int getRed() {
        return r;
    }

    public void setRed(int r) {
        this.r = r;
    }

    public int getGreen() {
        return g;
    }

    public void setGreen(int g) {
        this.g = g;
    }

    public int getBlue() {
        return b;
    }

    public void setBlue(int b) {
        this.b = b;
    }
}
