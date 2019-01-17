package com.jfeat.pdf.print.report.row;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.jfeat.pdf.print.base.PaddingListRow;

/**
 * Created by vincent on 2018/3/16.
 */
public class TextBoxData extends PaddingListRow {
    public static String ID = "TextBox";

    private Font font;
    private String content;
    private BaseColor solid;

    public void setContent(String content, Font font) {
        this.content = content;
        this.font = font;
    }

    public String rowId() {
        return ID;
    }

    public Font getFont() {
        return font;
    }

    public void setFont(Font font) {
        this.font = font;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public BaseColor getsolid() {
        return solid;
    }

    public void setSolid(BaseColor solid) {
        this.solid = solid;
    }
}
