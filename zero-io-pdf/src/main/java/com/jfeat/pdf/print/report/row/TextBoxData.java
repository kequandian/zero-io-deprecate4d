package com.jfeat.pdf.print.report.row;


import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.report.request.RowFormatRequest;

/**
 * Created by vincenthuang on 19/03/2018.
 * 上下布局图文框 [上方图片，下方标题] 数据
 */
public class TextBoxData extends PaddingRowBase {

    public static TextBoxData EMPTY = new TextBoxData();

    private String text;

    private RowFormatRequest textFormat;   //字体格式
    private BorderDefinition borderFormat;  //边界格式
    private ColorDefinition backgroundColor;//背景格式

    @Override
    public String rowId() {
        return TextBox.ID;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public RowFormatRequest getTextFormat() {
        return textFormat;
    }

    public void setTextFormat(RowFormatRequest textFormat) {
        this.textFormat = textFormat;
    }

    public void setTitleFont(FontDefinition font) {
        if (this.textFormat == null) {
            this.textFormat = new RowFormatRequest();
        }
        this.textFormat.setFont(font);
    }

    public void setSpacing(float spacing) {
        if (this.textFormat == null) {
            this.textFormat = new RowFormatRequest();
        }
        this.textFormat.setSpacing(spacing);
    }

    public void setIndent(float indent) {
        if (this.textFormat == null) {
            this.textFormat = new RowFormatRequest();
        }
        this.textFormat.setIndent(indent);
    }

    public void setAlignment(String alignment) {
        if (this.textFormat == null) {
            this.textFormat = new RowFormatRequest();
        }
        this.textFormat.setAlignment(alignment);
    }

    public void setVerticalAlignment(String alignment) {
        if (this.textFormat == null) {
            this.textFormat = new RowFormatRequest();
        }
        this.textFormat.setVerticalAlignment(alignment);
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
