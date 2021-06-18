package com.jfeat.zero.pdf.print.report.request;

import com.jfeat.zero.pdf.print.base.ColorDefinition;
import com.jfeat.zero.pdf.print.base.FontDefinition;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class GroupFormatRequest {

    private FontDefinition group;
    private ColorDefinition backgroundColor;

    public GroupFormatRequest(){
    }

    public GroupFormatRequest(FontDefinition group, ColorDefinition backgroundColor){
        this.group = group;
        this.backgroundColor = backgroundColor;
    }

    public FontDefinition getGroup() {
        return group;
    }

    public void setGroup(FontDefinition group) {
        this.group = group;
    }

    public ColorDefinition getBackgroundColor() {
        return backgroundColor;
    }

    public void setBackgroundColor(ColorDefinition backgroundColor) {
        this.backgroundColor = backgroundColor;
    }

    public void setGroupingColor(int r, int g, int b) {
        this.backgroundColor = new ColorDefinition(r,g,b);;
    }
}
