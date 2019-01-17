package com.jfeat.pdf.print.report.request;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class Definitions {
    private String[] flowDirections = new String[]{"LTR", "UTD"};

    private String[] fontStyles = new String[]{"NORMAL", "BOLD", "ITALIC", "UNDERLINE", "STRIKETHRU", "BOLDITALIC"};

    private String[] titleAlignments = new String[]{"ALIGN_BASELINE", "ALIGN_LEFT"};

    private String[] rowOptions = new String[]{"FlowListRow", "StackFlowListRow"};

    public String[] getFlowDirections() {
        return flowDirections;
    }

    public String[] getFontStyles() {
        return fontStyles;
    }

    public String[] getTitleAlignments() {
        return titleAlignments;
    }

    public String[] getRowOptions() {
        return rowOptions;
    }
}
