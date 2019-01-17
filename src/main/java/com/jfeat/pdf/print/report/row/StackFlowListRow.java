package com.jfeat.pdf.print.report.row;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.report.row.FlowListRow;

/**
 * Created by vincent on 2018/3/16.
 * 上下布局图文框 [上方图片，下方标题]
 */
public class StackFlowListRow extends FlowListRow implements ListRow {

    public static String ID = "StackFlowListRow";

    public StackFlowListRow(Rectangle position) {
        super(position);
    }

    public StackFlowListRow(){
        super();
    }

    @Override
    public String rowId() {
        return ID;
    }

    @Override
    public int iconAlignment(){
        return Element.ALIGN_TOP;
    }

    @Override
    public void drawCell(PdfContentByte[] canvases, Rectangle position) {
        PdfContentByte bgcanvas = canvases[PdfPTable.BACKGROUNDCANVAS];

        // draw cell stroke
        bgcanvas.rectangle(position);

        // draw images
        bgcanvas.saveState();

        /// draw images, its layout determine by icon alignment
        drawIcon(bgcanvas, position, icon);
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

            if (icon != null) {
                linesPosition.setTop(position.getTop() - icon.getScaledHeight());
            }

            drawLines(canvas, linesPosition, new Phrase[]{title, value}, titleAlignment, titleIndent, titleSpacing);
        }

        canvas.restoreState();
    }
}
