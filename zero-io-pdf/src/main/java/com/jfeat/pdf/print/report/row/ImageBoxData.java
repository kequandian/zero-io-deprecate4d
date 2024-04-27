package com.jfeat.pdf.print.report.row;


import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.report.request.RowFormatRequest;

/**
 * Created by vincenthuang on 19/03/2018.
 * 上下布局图文框 [上方图片，下方标题] 数据
 */
public class ImageBoxData extends PaddingRowBase {

    public static ImageBoxData EMPTY = new ImageBoxData();

    private String imageUrl;

    private BorderDefinition borderFormat;   //边界格式

    @Override
    public String rowId() {
        return ImageBox.ID;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public BorderDefinition getBorderFormat() {
        return borderFormat;
    }

    public void setBorderFormat(BorderDefinition borderFormat) {
        this.borderFormat = borderFormat;
    }
}
