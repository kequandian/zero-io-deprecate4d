package com.jfeat.pdf.print.element;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.base.PaddingListRow;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.util.TableCellDrawUtil;
import org.springframework.util.Assert;

/**
 * Created by vincent on 2018/3/16.
 * 上下布局图文框 [上方图片，下方标题]
 */
public class ImageTextBox extends TextBox implements ListRow {

    public static String ID = "ImageTextRow";
    @Override
    public String rowId() {
        return ID;
    }

    private Image image;

    public ImageTextBox() {
        super();
    }

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }


    @Override
    public void drawCell(PdfContentByte[] canvases, Rectangle position) {
        Assert.isTrue(image!=null, "image is not set !");

        PdfContentByte bgcanvas = canvases[PdfPTable.BACKGROUNDCANVAS];

        // draw cell stroke
        bgcanvas.rectangle(position);

        // draw images
        bgcanvas.saveState();

        /// draw images, its layout determine by icon alignment
        TableCellDrawUtil.drawImage(bgcanvas, position, paddingLeft, paddingTop, paddingRight, paddingBottom, image);
        //drawIcon(bgcanvas, position, next);

        bgcanvas.restoreState();


        /**
         * draw text
         */
        PdfContentByte canvas = canvases[PdfPTable.TEXTCANVAS];
        canvas.saveState();

        // draw lines
        {
            Rectangle linesPosition = new Rectangle(position);

            if (image != null) {
                linesPosition.setTop(position.getTop() - image.getScaledHeight());
            }

            TableCellDrawUtil.drawLines(canvas, linesPosition, new Phrase[]{new Phrase(content)},
                    paddingLeft, paddingTop,paddingTop, paddingBottom,
                    alignment, indent, spacing);
        }

        canvas.restoreState();
    }

}
