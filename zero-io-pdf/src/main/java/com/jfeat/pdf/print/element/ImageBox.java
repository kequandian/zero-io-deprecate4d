package com.jfeat.pdf.print.element;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.base.PaddingListRow;
import com.jfeat.pdf.print.util.TableCellDrawUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Created by vincent on 2018/3/16.
 * 图像框: 图像排列
 */
public class ImageBox extends PaddingListRow implements ListRow {
    protected final static Logger logger = LoggerFactory.getLogger(ImageBox.class);

    public static String ID = "ImageBox";
    @Override
    public String rowId() {
        return ID;
    }

    private Image image;

    public ImageBox(){
        super();
    }

    public Image getImage(){
        return this.image;
    }
    public void setImage(Image imageUrl){
        this.image = imageUrl;
    }


    public void drawCell(PdfContentByte[] canvases, Rectangle position){
        if(image ==null){
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


        // draw cell stroke
        bgcanvas.rectangle(position);

        // draw images
        bgcanvas.saveState();

        /// draw images, its layout determine by icon alignment
        TableCellDrawUtil.drawImage(bgcanvas, position, paddingLeft, paddingTop, paddingRight, paddingBottom, image);
        //drawIcon(bgcanvas, position, next);

        bgcanvas.restoreState();
    }

}