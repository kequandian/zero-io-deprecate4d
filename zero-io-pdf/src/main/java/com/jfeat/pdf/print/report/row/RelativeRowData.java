package com.jfeat.pdf.print.report.row;


import com.itextpdf.text.Element;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.report.request.RowFormatRequest;

/**
 * Created by vincenthuang on 19/03/2018.
 * FlowListRow 的数据定义
 */
public class RelativeRowData extends PaddingRowBase {
    private String imageUrl;
    private String nextImageUrl;

    private String title;
    private String subtitle;
    private String groupTitle;
    private String hint;
    private String value;

    private FontDefinition fontTitle;
    private FontDefinition fontSubtitle;
    private FontDefinition fontGroupTitle;
    private FontDefinition fontHint;
    private FontDefinition fontValue;

    private RowFormatRequest titleFormat;
    private RowFormatRequest subtitleFormat;
    private RowFormatRequest groupTitleFormat;

    @Override
    public String rowId() {
        return RelativeRow.ID;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(String imageUrl) {
        this.imageUrl = imageUrl;
    }

    public String getNextImageUrl() {
        return nextImageUrl;
    }

    public void setNextImageUrl(String nextImageUrl) {
        this.nextImageUrl = nextImageUrl;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title, FontDefinition font) {
        this.title = title;
        this.fontTitle = font;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle, FontDefinition font) {
        this.subtitle = subtitle;
        this.fontSubtitle = font;
    }
    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value, FontDefinition font) {
        this.value = value;
        this.fontValue = font;
    }
    public void setValue(String value) {
        this.value = value;
    }

    public void setHint(String hint, FontDefinition font) {
        this.hint = hint;
        this.fontHint = font;
    }
    public void setHint(String hint) {
        this.hint = hint;
    }

    public FontDefinition getFontTitle() {
        return fontTitle;
    }

    public FontDefinition getFontSubtitle() {
        return fontSubtitle;
    }

    public FontDefinition getFontValue() {
        return fontValue;
    }

    public String getHint() {
        return hint;
    }

    public FontDefinition getFontHint() {
        return fontHint;
    }

    public void setFontHint(FontDefinition fontHint) {
        this.fontHint = fontHint;
    }

    public String getGroupTitle() {
        return groupTitle;
    }

    public void setGroupTitle(String groupTitle) {
        this.groupTitle = groupTitle;
    }

    public FontDefinition getFontGroupTitle() {
        return fontGroupTitle;
    }

    public void setFontGroupTitle(FontDefinition fontGroupTitle) {
        this.fontGroupTitle = fontGroupTitle;
    }

    public RowFormatRequest getTitleFormat() {
        return titleFormat;
    }

    public void setTitleFormat(RowFormatRequest titleFormat) {
        this.titleFormat = titleFormat;
    }

    public RowFormatRequest getSubtitleFormat() {
        return subtitleFormat;
    }

    public void setSubtitleFormat(RowFormatRequest subtitleFormat) {
        this.subtitleFormat = subtitleFormat;
    }

    public RowFormatRequest getGroupTitleFormat() {
        return groupTitleFormat;
    }

    public void setGroupTitleFormat(RowFormatRequest groupTitleFormat) {
        this.groupTitleFormat = groupTitleFormat;
    }
}
