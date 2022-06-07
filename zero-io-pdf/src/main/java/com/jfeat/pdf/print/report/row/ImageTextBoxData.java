package com.jfeat.pdf.print.report.row;


import com.jfeat.pdf.print.element.ImageTextBox;

/**
 * Created by vincenthuang on 19/03/2018.
 *  上下布局图文框 [上方图片，下方标题] 数据
 */
public class ImageTextBoxData extends RelativeRowData {

    private String url;
    private String text;

    @Override
    public String rowId() {
        return ImageTextBox.ID;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
