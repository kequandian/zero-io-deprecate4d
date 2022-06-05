package com.jfeat.pdf.print.report.builder;

/**
 * Created by vincenthuang on 23/03/2018.
 * FlowReport数据类 [POJO]
 */

@Deprecated
public class RowData {

    public static final RowData EMPTY = new RowData("", null, null, null);

    private String group;

    private String iconUrl;
    private String nextUrl;

    private String title;
    private String subtitle;
    private String hint;
    private String value;

    public RowData(){
    }

    public RowData(String group){
        this.group = group;
    }

    public RowData(String iconUrl, String title, String subtitle, String hint, String value, String nextUrl){
        this.iconUrl = iconUrl;
        this.title =  title;
        this.subtitle = subtitle;
        this.hint = hint;
        this.value = value;
        this.nextUrl = nextUrl;
    }
    public RowData(String title, String subtitle, String hint, String value){
        this.title =  title;
        this.subtitle = subtitle;
        this.hint = hint;
        this.value = value;
    }

    public String getIconUrl() {
        return iconUrl;
    }

    public RowData setIconUrl(String iconUrl) {
        this.iconUrl = iconUrl;
        return this;
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

    public RowData setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getSubtitle() {
        return subtitle;
    }

    public void setSubtitle(String subtitle) {
        this.subtitle = subtitle;
    }

    public String getHint() {
        return hint;
    }

    public void setHint(String hint) {
        this.hint = hint;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }
}
