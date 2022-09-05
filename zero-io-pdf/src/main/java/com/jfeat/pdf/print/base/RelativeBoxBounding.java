package com.jfeat.pdf.print.base;

import com.itextpdf.awt.geom.Point;
import com.itextpdf.text.Element;
import com.itextpdf.text.Rectangle;

/**
 * 相对包围框位置计算
 */
public class RelativeBoxBounding {
    /**
     * get position
     *
     * @param position
     * @param alignment
     * @return
     */
    public static Point getDockPosition(Rectangle position, float paddingLeft, float paddingTop, float paddingRight, float paddingBottom, int alignment) {
        Point pos = new Point();
        switch (alignment) {
            case Element.ALIGN_LEFT: {
                float ux = getRowStart(position, paddingLeft);
                float uy = getVerticalCenter(position, paddingTop, paddingBottom);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_RIGHT: {
                float ux = getRowEnd(position, paddingRight);
                float uy = getVerticalCenter(position, paddingTop, paddingBottom);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_BASELINE: {
                float ux = getRowStart(position, paddingLeft);
                float uy = getRowTop(position, paddingTop);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_TOP: {
                float ux = getHorizontalCenter(position, paddingLeft, paddingRight);
                float uy = getRowTop(position, paddingTop);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_BOTTOM: {
                float ux = getHorizontalCenter(position, paddingLeft, paddingRight);
                float uy = getRowBottom(position, paddingBottom);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_MIDDLE:
            case Element.ALIGN_CENTER: {
                float ux = getHorizontalCenter(position, paddingLeft, paddingRight);
                float uy = getVerticalCenter(position, paddingTop, paddingBottom);
                pos.setLocation(ux, uy);
            }
            break;

            default:
                throw new RuntimeException("Alignment not support: " + alignment);
        }

        return pos;
    }

    public static float getVerticalCenter(Rectangle position, float paddingTop, float paddingBottom) {
        return (position.getTop() + paddingTop + position.getBottom() - paddingBottom) * 0.5f;
    }

    public static float getHorizontalCenter(Rectangle position, float paddingLeft, float paddingRight) {
        return (position.getLeft() + paddingLeft + position.getRight() - paddingRight) * 0.5f;
    }

    public static float getRowTop(Rectangle position, float paddingTop) {
        return position.getTop() > paddingTop ? (position.getTop() - paddingTop) : paddingTop;
    }

    public static float getRowBottom(Rectangle position, float paddingBottom) {
        return position.getBottom() + paddingBottom;
    }

    public static float getRowStart(Rectangle position, float paddingLeft) {
        return position.getLeft() + paddingLeft;
    }

    public static float getRowEnd(Rectangle position, float paddingRight) {
        return position.getRight() > paddingRight ? (position.getRight() - paddingRight) : paddingRight;
    }

    public static float getInternalWidth(Rectangle position, float paddingLeft, float paddingRight) {
        return position.getWidth() - paddingLeft - paddingRight;
    }

    public static float getInternalHeight(Rectangle position, float paddingTop, float paddingBottom) {
        return position.getHeight() - paddingTop - paddingBottom;
    }

}
