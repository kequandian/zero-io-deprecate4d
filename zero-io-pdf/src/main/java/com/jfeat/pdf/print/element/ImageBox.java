package com.jfeat.pdf.print.element;

import cn.hutool.core.util.StrUtil;
import com.itextpdf.awt.AsianFontMapper;
import com.itextpdf.awt.FontMapper;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.util.PdfFontMetrics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincent on 2018/3/16.
 * 图像框: 图像排列
 */
public class ImageBox extends Rectangle implements ListRow {
    protected final static Logger logger = LoggerFactory.getLogger(ImageBox.class);

    public static String ID = "ImageBox";
    @Override
    public String rowId() {
        return ID;
    }

    private String url;

    private AccessibleElementId cellId;

    public String getUrl(){
        return this.url;
    }
    public void setUrl(String url){
        this.url = url;
    }

    public ImageBox(){
        super(0,0,0,0);
    }

    public void draw(PdfContentByte canvas, Rectangle position){
        PdfContentByte[] canvases = new PdfContentByte[]{canvas, canvas, canvas, canvas};
        drawCell(canvases, position);
    }

    public void drawCell(PdfContentByte[] canvases, Rectangle position){
        if(url==null || url.length()==0){
            return;
        }

        super.setLeft(position.getLeft());
        super.setTop(position.getTop());
        super.setRight(position.getRight());
        super.setBottom(position.getBottom());

        // draw background
        PdfContentByte bgcanvas = canvases[PdfPTable.BACKGROUNDCANVAS];
        bgcanvas.saveState();
        Rectangle solid = new Rectangle(this);
        float borderWidth = solid.getBorderWidth();
        if(borderWidth>0) {
            solid.setLeft(solid.getLeft() + borderWidth);
            solid.setRight(solid.getRight() - borderWidth);
            solid.setTop(solid.getTop() - borderWidth);
            solid.setBottom(solid.getBottom() + borderWidth);
        }
        bgcanvas.rectangle(solid);
        bgcanvas.restoreState();


        /// draw text
        PdfContentByte canvas = canvases[PdfPTable.TEXTCANVAS];

        ///draw text
        canvas.saveState();

        float boxHeight = getHeight();


        canvas.restoreState();
    }

    @Override
    public void setCellId(AccessibleElementId cellId) {
        this.cellId = cellId;
    }

    @Override
    public AccessibleElementId getCellId(){
        return cellId;
    }

}
