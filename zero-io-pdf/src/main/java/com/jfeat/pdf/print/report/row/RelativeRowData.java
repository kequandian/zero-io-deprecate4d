package com.jfeat.pdf.print.report.row;


import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.RelativeRow;

/**
 * Created by vincenthuang on 19/03/2018.
 * FlowListRow 的数据定义
 */
public class RelativeRowData extends PaddingRowBase {
    private String iconUrl;
    private String nextUrl;

    private Image iconImage;
    private Image nextImage;

    private String title;
    private String subtitle;
    private String hint;
    private String value;

    private Font fontTitle;
    private Font fontSubtitle;
    private Font fontHint;
    private Font fontValue;

    private float titleIndent = 0f;
    private float titleSpacing = 0f;
    private int titleAlignment = Element.ALIGN_BASELINE;

    @Override
    public String rowId() {
        return RelativeRow.ID;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public void setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
    }

    public String getNextUrl() {
        return nextUrl;
    }

    public void setNextUrl(String nextUrl) {
        this.nextUrl = nextUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title, Font font) {
        this.title = title;
        this.fontTitle = font;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle, Font font) {
        this.subtitle = subtitle;
        this.fontSubtitle = font;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value, Font font) {
        this.value = value;
        this.fontValue = font;
    }

    public void setHint(String hint, Font font) {
        this.hint = hint;
        this.fontHint = font;
    }

    public Font getFontTitle() {
        return fontTitle;
    }

    public Font getFontSubtitle() {
        return fontSubtitle;
    }

    public Font getFontValue() {
        return fontValue;
    }

    public float getTitleIndent() {
        return titleIndent;
    }

    public void setTitleIndent(float titleIndent) {
        this.titleIndent = titleIndent;
    }

    public float getTitleSpacing() {
        return titleSpacing;
    }

    public void setTitleSpacing(float titleSpacing) {
        this.titleSpacing = titleSpacing;
    }

    public Image getIconImage() {
        return iconImage;
    }

    public void setIconImage(Image iconImage) {
        this.iconImage = iconImage;
    }

    public Image getNextImage() {
        return nextImage;
    }

    public void setNextImage(Image nextImage) {
        this.nextImage = nextImage;
    }

    public String getHint() {
        return hint;
    }

    public Font getFontHint() {
        return fontHint;
    }

    public void setFontHint(Font fontHint) {
        this.fontHint = fontHint;
    }

    public int getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(int titleAlignment) {
        this.titleAlignment = titleAlignment;
    }
}
