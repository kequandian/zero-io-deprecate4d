package com.jfeat.pdf.print.util;

import com.itextpdf.text.Rectangle;

/**
 * Created by vincenthuang on 26/03/2018.
 */
public class PageUtil {
    public static Rectangle getContentSize(Rectangle pageSize, float margin){
        return getContentSize(pageSize, margin, margin, margin, margin);
    }

    public static Rectangle getContentSize(Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom){
        return new Rectangle(  pageSize.getLeft(marginLeft),
                pageSize.getBottom(marginBottom),
                pageSize.getRight(marginRight),
                pageSize.getTop(marginTop));
    }

    public static int calcRows(float totalHeight, float headerHeight, float rowHeight){
        if(totalHeight<=0){
            return 0;
        }
        if(rowHeight<=0){
            throw new RuntimeException("Row height is not set");
        }

        float rowsHeight = totalHeight - headerHeight;

        return (int) (rowsHeight / rowHeight);
    }
}
