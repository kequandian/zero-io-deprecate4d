package com.jfeat.pdf.print.report.row;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.jfeat.pdf.print.base.ListRowBase;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.ImageBox;

/**
 * Created by vincent on 2018/3/16.
 */
public class ImageBoxData extends PaddingRowBase {
    @Override
    public String rowId() {
        return ImageBox.ID;
    }

    private String imageUrl;
    private int corner = 0;

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public int getCorner() {
        return corner;
    }

    public void setCorner(int corner) {
        this.corner = corner;
    }
}
