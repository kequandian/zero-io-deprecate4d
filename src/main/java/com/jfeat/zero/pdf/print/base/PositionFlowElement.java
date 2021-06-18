package com.jfeat.zero.pdf.print.base;

import com.itextpdf.text.Element;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;

/**
 * Created by vincenthuang on 27/09/2018.
 */
public abstract class PositionFlowElement implements FlowElement {

    /**
     * 获取绘制结果，用于输出到指定位置，而非文档当前位置
     *
     * @return
     */
    abstract protected Element getElement();


    /**
     * 指定位置输出
     *
     * @param canvas
     * @param position
     */
    public void locateElement(PdfContentByte canvas, Rectangle position) {

        if (getElement() instanceof PdfPTable) {

            PdfPTable table = (PdfPTable) getElement();

            // 指定位置输出
            float yAbsolute = (float) (canvas.getPdfDocument().getPageSize().getHeight() - position.getLeft());
            table.writeSelectedRows(0, -1, (float) position.getLeft(), yAbsolute, canvas);


        } else {
            throw new RuntimeException("Not implemented yet for element: " + getElement().getClass().getSimpleName());
        }
    }

}

