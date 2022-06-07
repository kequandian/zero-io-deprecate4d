package com.jfeat.pdf.print.report.row;


import com.itextpdf.text.Element;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.PaddingRowBase;
import com.jfeat.pdf.print.element.RelativeRow;

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

    private float titleIndent = 0f;
    private float titleSpacing = 0f;
    private int titleAlignment = Element.ALIGN_BASELINE;

    @Override
    public String rowId() {
        return RelativeRow.ID;
    }

    public String getIconUrl() {
        return imageUrl;
    }

    public void setIconUrl(String imageUrl) {
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

    public String getValue() {
        return value;
    }

    public void setValue(String value, FontDefinition font) {
        this.value = value;
        this.fontValue = font;
    }

    public void setHint(String hint, FontDefinition font) {
        this.hint = hint;
        this.fontHint = font;
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

    public String getHint() {
        return hint;
    }

    public FontDefinition getFontHint() {
        return fontHint;
    }

    public void setFontHint(FontDefinition fontHint) {
        this.fontHint = fontHint;
    }

    public int getTitleAlignment() {
        return titleAlignment;
    }

    public void setTitleAlignment(int titleAlignment) {
        this.titleAlignment = titleAlignment;
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
}
