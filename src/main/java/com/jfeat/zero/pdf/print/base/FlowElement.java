package com.jfeat.zero.pdf.print.base;

import com.itextpdf.text.Element;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;

/**
 * Created by vincent on 2018/9/27.
 * 通过canvas绘制文档元素的接口，通常添加到 document 当前位置
 */
public interface FlowElement {
    /**
     * render 内容
     * @param canvas
     */
    void draw(PdfContentByte canvas);
}
