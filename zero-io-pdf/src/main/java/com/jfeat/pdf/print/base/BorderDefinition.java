package com.jfeat.pdf.print.base;

import com.itextpdf.text.BaseColor;

/**
 * Created by vincent on 2018/10/8.
 */
public class BorderDefinition {
    /// border style
    public static final String TOP = "TOP";
    public static final String BOTTOM = "BOTTOM";
    public static final String LEFT = "LEFT";
    public static final String RIGHT = "RIGHT";
    public static final String NO_BORDER = "NO_BORDER";
    public static final String BOX = "BOX";

    private String style;
    private String colorname;

    private float borderLeft = 0, borderRight = 0, borderTop = 0, borderBottom = 0;
    private ColorDefinition color;

    public BorderDefinition(String style, float width, ColorDefinition color){
        this.style = style;
        this.borderLeft = borderRight = borderTop = borderBottom = width;
        this.color = color;
    }
    public BorderDefinition(String style, float width, String colorname){
        this.style = style;
        this.borderLeft = borderRight = borderTop = borderBottom = width;
        this.colorname = colorname;
        this.color = ColorDefinition.getColor(colorname);
    }

    public static BaseColor getColor(ColorDefinition color){
        return new BaseColor(color.getRed(), color.getGreen(), color.getBlue());
    }

    public ColorDefinition getColor() {
        return color;
    }

    public void setColor(ColorDefinition color) {
        this.color = color;
    }

    public void setWidth(float width) {
        this.borderLeft = borderRight = borderTop = borderBottom = width;
    }

    public String getStyle() {
        return style;
    }

    public void setStyle(String style) {
        this.style = style;
    }

    public String getColorname() {
        return colorname;
    }

    public void setColorname(String colorname) {
        this.colorname = colorname;
        this.color = ColorDefinition.getColor(colorname);
    }

    public float getBorderLeft() {
        return borderLeft;
    }

    public void setBorderLeft(float borderLeft) {
        this.borderLeft = borderLeft;
    }

    public float getBorderRight() {
        return borderRight;
    }

    public void setBorderRight(float borderRight) {
        this.borderRight = borderRight;
    }

    public float getBorderTop() {
        return borderTop;
    }

    public void setBorderTop(float borderTop) {
        this.borderTop = borderTop;
    }

    public float getBorderBottom() {
        return borderBottom;
    }

    public void setBorderBottom(float borderBottom) {
        this.borderBottom = borderBottom;
    }
}
