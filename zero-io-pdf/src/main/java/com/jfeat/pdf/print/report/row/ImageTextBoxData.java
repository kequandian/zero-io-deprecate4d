package com.jfeat.pdf.print.report.row;


import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.report.request.RowFormatRequest;

/**
 * Created by vincenthuang on 19/03/2018.
 *  上下布局图文框 [上方图片，下方标题] 数据
 */
public class ImageTextBoxData extends PaddingRowBase {

    public static ImageTextBoxData EMPTY = new ImageTextBoxData();

    private String imageUrl;
    private String title;

    private RowFormatRequest titleFormat;
    private BorderDefinition borderStyle;

    @Override
    public String rowId() {
        return ImageTextBox.ID;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public RowFormatRequest getTitleFormat() {
        return titleFormat;
    }

    public void setTitleFormat(RowFormatRequest titleFormat) {
        this.titleFormat = titleFormat;
    }

    public BorderDefinition getBorderStyle() {
        return borderStyle;
    }

    public void setBorderStyle(BorderDefinition borderStyle) {
        this.borderStyle = borderStyle;
    }
}
