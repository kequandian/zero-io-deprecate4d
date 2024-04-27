package com.jfeat.pdf.print.report.row;


import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.report.request.RowFormatRequest;

/**
 * Created by vincenthuang on 19/03/2018.
 * 上下布局图文框 [上方图片，下方标题] 数据
 */
public class ImageTextBoxData extends PaddingRowBase {

    public static ImageTextBoxData EMPTY = new ImageTextBoxData();

    private String imageUrl;
    private String title;

    private RowFormatRequest titleFormat;   //字体格式
    private BorderDefinition borderFormat;  //边界格式
    private ColorDefinition backgroundColor;//背景格式


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

    public void setTitleFont(FontDefinition font) {
        if (this.titleFormat == null) {
            this.titleFormat = new RowFormatRequest();
        }
        this.titleFormat.setFont(font);
    }

    public void setSpacing(float spacing) {
        if (this.titleFormat == null) {
            this.titleFormat = new RowFormatRequest();
        }
        this.titleFormat.setSpacing(spacing);
    }

    public void setIndent(float indent) {
        if (this.titleFormat == null) {
            this.titleFormat = new RowFormatRequest();
        }
        this.titleFormat.setIndent(indent);
    }

    public void setAlignment(String alignment) {
        if (this.titleFormat == null) {
            this.titleFormat = new RowFormatRequest();
        }
        this.titleFormat.setAlignment(alignment);
    }

    public void setVerticalAlignment(String alignment) {
        if (this.titleFormat == null) {
            this.titleFormat = new RowFormatRequest();
        }
        this.titleFormat.setVerticalAlignment(alignment);
    }


    public BorderDefinition getBorderFormat() {
        return borderFormat;
    }

    public void setBorderFormat(BorderDefinition borderFormat) {
        this.borderFormat = borderFormat;
    }

    public ColorDefinition getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(ColorDefinition backgroundColor) {
        this.backgroundColor = backgroundColor;
    }
}
