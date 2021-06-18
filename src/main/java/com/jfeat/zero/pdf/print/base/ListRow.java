package com.jfeat.zero.pdf.print.base;

import com.itextpdf.text.AccessibleElementId;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;

/**
 * Created by vincent on 2018/3/19.
 * 提供内容接口
 */
public interface ListRow extends ListRowBase {
    void draw(PdfContentByte canvas, Rectangle position);
    void drawCell(PdfContentByte[] canvases, Rectangle position);

    /// cell id
    void setCellId(AccessibleElementId cellId);
    AccessibleElementId getCellId();
}
