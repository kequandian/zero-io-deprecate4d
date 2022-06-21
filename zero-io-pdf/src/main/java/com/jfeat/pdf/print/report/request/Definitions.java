package com.jfeat.pdf.print.report.request;

/**
 * Created by vincenthuang on 22/03/2018.
 * 用于定义各种配置，包括
 * @flowDirections LTR UTD 从左至右， 从下至下
 * @fontStyles 字体风格
 * @titleAlignments 标题对齐
 * @rowOptions 表格单元 选项
 */
public class Definitions {
    private String[] flowDirections = new String[]{"LTR", "UTD"};

    private String[] fontStyles = new String[]{"NORMAL", "BOLD", "ITALIC", "UNDERLINE", "STRIKETHRU", "BOLDITALIC"};

    private String[] titleAlignments = new String[]{"ALIGN_BASELINE", "ALIGN_LEFT"};

    private String[] rowOptions = new String[]{"TextBox", "ImageBox", "ImageTextBox", "RelativeRow", "FlowLayout", "EmptyListRow"};


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
