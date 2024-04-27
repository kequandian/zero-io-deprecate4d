package com.jfeat.pdf.print.report.request;

import com.itextpdf.text.BaseColor;
import com.jfeat.pdf.print.base.ColorDefinition;

import java.awt.*;

/**
 * Created by vincenthuang on 23/03/2018.
 * deprecated by BorderDefinition
 */
public class RowLayoutRequest {

    private int alignment;
    private float height;
    private float paddingLeft = 0, paddingRight = 0, paddingTop = 0, paddingBottom = 0;

    /// border
    private float borderLeft = 0, borderRight = 0, borderTop = 0, borderBottom = 0;
    private ColorDefinition borderColor;

    // background
    private ColorDefinition backgroundColor;


    public RowLayoutRequest() {
        borderLeft = -1;
        borderRight = -1;
        borderTop = -1;
        borderBottom = -1;
    }

    public RowLayoutRequest(float height) {
        this();
        this.height = height;
    }

    public RowLayoutRequest(float height, float padding) {
        this(height);
        this.paddingLeft = padding;
        this.paddingRight = padding;
        this.paddingTop = padding;
        this.paddingBottom = padding;
    }

    /**
     * padding
     */
    public RowLayoutRequest setPadding(float left, float right, float top, float bottom) {
        this.paddingLeft = left;
        this.paddingRight = right;
        this.paddingTop = top;
        this.paddingBottom = bottom;
        return this;
    }

    public void setPadding(float padding) {
        this.paddingLeft = this.paddingRight = this.paddingTop = this.paddingBottom = padding;
    }

    public void setPadding(String padding) {
        if (padding != null && padding.length() > 0) {
            try {
                if (padding.contains(",")) {
                    String[] values = padding.split(",");
                    if (values.length == 4) {
                        this.paddingLeft = Float.parseFloat(values[0]);
                        this.paddingRight = Float.parseFloat(values[1]);
                        this.paddingTop = Float.parseFloat(values[2]);
                        this.paddingBottom = Float.parseFloat(values[3]);
                    }

                } else {

                    float paddingF = Float.parseFloat(padding);
                    this.paddingLeft = paddingF;
                    this.paddingRight = paddingF;
                    this.paddingTop = paddingF;
                    this.paddingBottom = paddingF;
                }
            } catch (NumberFormatException e) {
                throw new RuntimeException(e);
            }
        }
    }

    public String getPadding() {
        float ave = (paddingLeft + paddingRight + paddingTop + paddingBottom) / 4.0f;
        if (ave == paddingLeft && ave == paddingRight && ave == paddingTop && ave == paddingBottom) {
            return String.valueOf(ave);
        }
        return String.format("%f,%f,%f,%f", paddingLeft, paddingTop, paddingRight, paddingBottom);
    }

    /**
     * border
     */
    public RowLayoutRequest setBorderWidth(float left, float right, float top, float bottom) {
        this.borderLeft = left;
        this.borderRight = right;
        this.borderTop = top;
        this.borderBottom = bottom;
        return this;
    }

    public RowLayoutRequest setBorderWidth(float width) {
        this.borderLeft = width;
        this.borderRight = width;
        this.borderTop = width;
        this.borderBottom = width;
        return this;
    }

    public RowLayoutRequest setBorderWidth(String width) {
        if (width != null && width.length() > 0) {
            try {
                if (width.contains(",")) {
                    String[] values = width.split(",");
                    if (values.length == 4) {
                        this.borderLeft = Float.parseFloat(values[0]);
                        this.borderRight = Float.parseFloat(values[1]);
                        this.borderTop = Float.parseFloat(values[2]);
                        this.borderBottom = Float.parseFloat(values[3]);
                    }

                } else {

                    float paddingF = Float.parseFloat(width);
                    this.borderLeft = paddingF;
                    this.borderRight = paddingF;
                    this.borderTop = paddingF;
                    this.borderBottom = paddingF;
                }
            } catch (NumberFormatException e) {
                throw new RuntimeException(e);
            }
        }
        return this;
    }

    public String getBorderWidth() {
        float ave = (borderLeft + borderRight + borderTop + borderBottom) / 4.0f;
        if (ave == borderLeft && ave == borderRight && ave == borderTop && ave == borderBottom) {
            return String.valueOf(ave);
        }
        return String.format("%f,%f,%f,%f", borderLeft, borderTop, borderRight, borderBottom);
    }

    public RowLayoutRequest setBorderColor(int red, int green, int blue) {
        this.borderColor = new ColorDefinition(red, green, blue);
        return this;
    }

    public RowLayoutRequest setBorderColor(ColorDefinition color) {
        this.borderColor = color;
        return this;
    }

    public RowLayoutRequest setBorderColor(String colorString) {
        if (colorString != null && colorString.length() > 0) {
            try {
                if (colorString.contains(",")) {
                    String[] values = colorString.split(",");
                    if (values.length == 3) {
                        int red = Integer.parseInt(values[0]);
                        int green = Integer.parseInt(values[1]);
                        int blue = Integer.parseInt(values[2]);
                        this.borderColor = new ColorDefinition(red, green, blue);
                    }
                }
            } catch (NumberFormatException e) {
                throw new RuntimeException(e);
            }
        }
        return this;
    }

    public String getBorderColor(String colorString) {
        if (borderColor == null) {
            return "0,0,0";
        }
        int total = (this.borderColor.getRed() + this.borderColor.getGreen() + this.borderColor.getBlue());
        if (total % 3 == 0) {
            int ave = total / 3;
            if (ave == this.borderColor.getRed() && ave == this.borderColor.getGreen() && ave == this.borderColor.getBlue()) {
                return String.valueOf(ave);
            }
        }
        return borderColor.toString();
    }

    public ColorDefinition getBorderColor() {
        return this.borderColor;
    }

    /**
     * getter & setter
     *
     * @return
     */

    public float getHeight() {
        return height;
    }

    public void setHeight(float height) {
        this.height = height;
    }

    public float getPaddingLeft() {
        return paddingLeft;
    }

    public void setPaddingLeft(float paddingLeft) {
        this.paddingLeft = paddingLeft;
    }

    public float getPaddingRight() {
        return paddingRight;
    }

    public void setPaddingRight(float paddingRight) {
        this.paddingRight = paddingRight;
    }

    public float getPaddingTop() {
        return paddingTop;
    }

    public void setPaddingTop(float paddingTop) {
        this.paddingTop = paddingTop;
    }

    public float getPaddingBottom() {
        return paddingBottom;
    }

    public void setPaddingBottom(float paddingBottom) {
        this.paddingBottom = paddingBottom;
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

    public ColorDefinition getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(ColorDefinition backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public int getAlignment() {
        return alignment;
    }

    public void setAlignment(int alignment) {
        this.alignment = alignment;
    }
}
