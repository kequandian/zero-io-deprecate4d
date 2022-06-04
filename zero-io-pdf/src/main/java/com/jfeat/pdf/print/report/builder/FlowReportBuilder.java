package com.jfeat.pdf.print.report.builder;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.Font;
import com.jfeat.pdf.print.base.ListRowBase;
import com.jfeat.pdf.print.report.FlowReport;
import com.jfeat.pdf.print.report.reports.HeaderContentFlowReport;
import com.jfeat.pdf.print.report.reports.HeaderFlowReport;
import com.jfeat.pdf.print.report.row.*;
import com.jfeat.pdf.print.util.PageUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class FlowReportBuilder{

    /// document
    private int columns;
    private int flowDirection;
    private String rowOption;

    private float flowHeight;

    // table border
    private float borderWidth;
    private BaseColor borderColor;

    // rows margins
    private float rowsMarginLeft;
    private float rowsMarginTop;
    private float rowsMarginRight;
    private float rowsMarginBottom;

    private RowData header;
    private List<RowData> flowReportRowDataList;

    private RowFormat headerFormat;
    private RowLayout headerLayout;
    private RowFormat rowFormat;
    private RowLayout rowLayout;

    /// background Color only for group row
    private BaseColor groupBackgroundColor;

    public FlowReportBuilder(){
        rowOption = FlowListRow.ID;
    }

    public FlowReportBuilder columns(int cols){
        this.columns = cols;
        return this;
    }

    public FlowReportBuilder flowDirection(int flowDirection){
        this.flowDirection = flowDirection;
        return this;
    }
    public FlowReportBuilder rowOption(String option){
        if(option!=null) {
            this.rowOption = option;
        }
        return this;
    }
    public FlowReportBuilder flowHeight(float flowHeight){
        this.flowHeight = flowHeight;
        return this;
    }
    public FlowReportBuilder rowsMargin(float left, float top, float right, float bottom){
        this.rowsMarginLeft =  left;
        this.rowsMarginTop =  top;
        this.rowsMarginRight =  right;
        this.rowsMarginBottom =  bottom;
        return this;
    }

    public FlowReportBuilder borderWidth(float width){
        this.borderWidth = width;
        return this;
    }

    public FlowReportBuilder borderColor(BaseColor color){
        if(color!=null) {
            this.borderColor = color;

            /// set default color
            if(color.getRed()>0 || color.getGreen()>0 || color.getBlue()>9) {

                headerBorderColor(color.getRed(), color.getGreen(), color.getBlue());

                rowBorderColor(color.getRed(), color.getGreen(), color.getBlue());
            }
        }
        return this;
    }

    /**
     * header area
     * @return
     */
    public FlowReportBuilder headerData(RowData data){
        this.header = data;
        return this;
    }

    public FlowReportBuilder headerData(String iconUrl, String title, String subtitle, String hint, String value, String nextUrl){
        if(header ==null){
            header = new RowData();
        }
        header.setTitle(title);
        header.setSubtitle(subtitle);
        header.setHint(hint);
        header.setValue(value);
        header.setIconUrl(iconUrl);
        header.setNextUrl(nextUrl);
        return this;
    }

    public FlowReportBuilder headerHeight(float height){
        if(headerLayout==null){
            headerLayout = new RowLayout();
        }
        headerLayout.setHeight(height);
        return this;
    }
    public FlowReportBuilder headerPadding(float left, float right, float top, float bottom){
        if(headerLayout==null){
            headerLayout = new RowLayout();
        }
        headerLayout.setPadding(left, right, top, bottom);
        return this;
    }
    public FlowReportBuilder headerPadding(float padding){
        if(headerLayout==null){
            headerLayout = new RowLayout();
        }
        headerLayout.setPadding(padding,padding,padding,padding);
        return this;
    }
    public FlowReportBuilder headerBorderWidth(float left, float right, float top, float bottom){
        if(left<0 || right<0 || top<0 || bottom<0){
            // do nothing
        }else {
            if (headerLayout == null) {
                headerLayout = new RowLayout();
            }
            headerLayout.setBorderWidth(left, right, top, bottom);
        }
        return this;
    }
    public FlowReportBuilder headerBorderWidth(float width){
        if(width<0){
            /// do nothing
        }else {
            if (headerLayout == null) {
                headerLayout = new RowLayout();
            }
            headerLayout.setBorderWidth(width);
        }
        return this;
    }
    public FlowReportBuilder headerBorderColor(int red, int green, int blue){
        if(headerLayout==null){
            headerLayout = new RowLayout();
        }

        /// do not set color while black
        if(red>0 || green>0 || blue>0) {
            headerLayout.setBorderColor(red, green, blue);
        }
        return this;
    }

    public FlowReportBuilder headerFonts(Font title, Font subtitle, Font hint, Font value){
        if(headerFormat==null){
            headerFormat = new RowFormat();
        }
        if(title!=null) headerFormat.setTitle(title);
        if(subtitle!=null) headerFormat.setSubtitle(subtitle);
        if(hint!=null) headerFormat.setHint(hint);
        if(value!=null) headerFormat.setValue(value);
        return this;
    }

    public FlowReportBuilder headerSpacing(float spacing, float indent, int alignment){
        if(headerFormat==null){
            headerFormat = new RowFormat();
        }
        headerFormat.setTitleSpacing(spacing);
        headerFormat.setTitleIndent(indent);
        headerFormat.setTitleAlignment(alignment);
        return this;
    }



    /**
     * rows
     * @return
     */
    public FlowReportBuilder rowData(List<RowData> rows){
        this.flowReportRowDataList = rows;
        return this;
    }

    public FlowReportBuilder rowHeight(float height){
        if(rowLayout==null){
            rowLayout = new RowLayout();
        }
        rowLayout.setHeight(height);
        return this;
    }
    public FlowReportBuilder rowPadding(float left, float right, float top, float bottom){
        if(rowLayout==null){
            rowLayout = new RowLayout();
        }
        rowLayout.setPadding(left, right, top, bottom);
        return this;
    }
    public FlowReportBuilder rowBorderWidth(float left, float right, float top, float bottom){
        if(rowLayout==null){
            rowLayout = new RowLayout();
        }
        rowLayout.setBorderWidth(left, right, top, bottom);
        return this;
    }
    public FlowReportBuilder rowBorderWidth(float width){
        if(rowLayout==null){
            rowLayout = new RowLayout();
        }
        rowLayout.setBorderWidth(width);
        return this;
    }
    public FlowReportBuilder rowBorderColor(int red, int green, int blue){
        if(rowLayout==null){
            rowLayout = new RowLayout();
        }

        // do not set color while black
        if(red>0 || green>0 || blue>0) {
            rowLayout.setBorderColor(red, green, blue);
        }
        return this;
    }
    public FlowReportBuilder rowFonts(Font title, Font subtitle, Font hint, Font value){
        if(rowFormat==null){
            rowFormat = new RowFormat();
        }
        rowFormat.setTitle(title);
        rowFormat.setSubtitle(subtitle);
        rowFormat.setHint(hint);
        rowFormat.setValue(value);
        return this;
    }

    public FlowReportBuilder groupFormat(Font group, BaseColor backgroundColor){
        if(group!=null) {
            if (rowFormat == null) {
                rowFormat = new RowFormat();
            }
            rowFormat.setGroup(group);
        }

        if(backgroundColor!=null) {
            this.groupBackgroundColor = backgroundColor;
        }
        return this;
    }
    public FlowReportBuilder rowSpacing(float spacing, float indent, int alignment){
        if(rowFormat==null){
            rowFormat = new RowFormat();
        }
        rowFormat.setTitleSpacing(spacing);
        rowFormat.setTitleIndent(indent);
        rowFormat.setTitleAlignment(alignment);
        return this;
    }

    public HeaderFlowReport build(){

        HeaderFlowReport report = null;
        if(rowsMarginLeft>0 || rowsMarginTop>0 || rowsMarginRight>0){
            /// rows table in double-row parent table
            report = new HeaderContentFlowReport(columns);
            report.setRowsMargin(rowsMarginLeft, rowsMarginTop, rowsMarginRight, rowsMarginBottom);

        }else{
            report = new HeaderFlowReport(columns);
        }

        report.setFlowDirection(flowDirection);
        /// setMaxRowsPerColumn
        if(flowDirection == FlowReport.FLOW_UTD){
            if(flowHeight<=0){
                throw new RuntimeException("Flow height is not set for FLOW_UTD direction.");
            }
            int maxRowsPerColumn = PageUtil.calcRows(flowHeight,
                    headerLayout != null ? headerLayout.getHeight() : 0,
                    rowLayout != null ? rowLayout.getHeight() : 0);
            report.setMaxRowsPerColumn(maxRowsPerColumn);
        }

        if(borderWidth<0) {
            // do nothing
        }else{
            report.setHeaderBorderWidth(borderWidth);
            report.setRowBorderWidth(borderWidth);
        }
        report.setHeaderBorderColor(borderColor);
        report.setRowBorderColor(borderColor);


        /// header data
        FlowListRowData headerRowData = new FlowListRowData();
        headerRowData.setTitle(header.getTitle(), headerFormat.getTitle());
        headerRowData.setSubtitle(header.getSubtitle(), headerFormat.getSubtitle());
        headerRowData.setHint(header.getHint(), headerFormat.getHint());
        headerRowData.setValue(header.getValue(), headerFormat.getValue());
        headerRowData.setIconUrl(header.getIconUrl());
        headerRowData.setNextUrl(header.getNextUrl());


        // header padding
        headerRowData.setPadding(
                headerLayout.getPaddingLeft(),
                headerLayout.getPaddingRight(),
                headerLayout.getPaddingTop(),
                headerLayout.getPaddingBottom());

        report.setHeaderBorderWidth(headerLayout.getBorderLeft(),headerLayout.getBorderTop(),
                headerLayout.getBorderRight(), headerLayout.getBorderBottom()
                );
        report.setHeaderBorderColor(new BaseColor(headerLayout.getBorderColorRed(), headerLayout.getBorderColorGreen(), headerLayout.getBorderColorBlue()));

        if(headerFormat.getTitleSpacing()>0) {
            headerRowData.setTitleSpacing(headerFormat.getTitleSpacing());
        }
        if(headerFormat.getTitleIndent()>0){
            headerRowData.setTitleIndent(headerFormat.getTitleIndent());
        }
        headerRowData.setTitleAlignment(headerFormat.getTitleAlignment());


        report.setHeaderData(headerRowData);
        report.setHeaderHeight(headerLayout.getHeight());

        report.setRowBorderWidth(rowLayout.getBorderLeft(), rowLayout.getBorderTop(), rowLayout.getBorderRight(), rowLayout.getBorderBottom());
        report.setRowBorderColor(new BaseColor(rowLayout.getBorderColorRed(), rowLayout.getBorderColorGreen(), rowLayout.getBorderColorBlue()));


        /// rows
        List<ListRowBase> rowDataItems = new ArrayList<>();
        for(RowData item : flowReportRowDataList) {

            if(item.getTitle()!=null) {

                FlowListRowData rowItemData = null;
                if( FlowListRow.ID.compareTo(rowOption)==0 ){
                    rowItemData = new FlowListRowData();
                }else if(StackFlowListRow.ID.compareTo(rowOption)==0){
                    rowItemData = new StackFlowListRowData();
                }else {
                    throw new RuntimeException("Not support row option:"+rowOption);
                }

                rowItemData.setTitle(item.getTitle(), rowFormat.getTitle());
                rowItemData.setSubtitle(item.getSubtitle(), rowFormat.getSubtitle());
                rowItemData.setHint(item.getHint(), rowFormat.getHint());
                rowItemData.setValue(item.getValue(), rowFormat.getValue());
                rowItemData.setIconUrl(item.getIconUrl());
                rowItemData.setNextUrl(item.getNextUrl());

                rowItemData.setTitleSpacing(rowFormat.getTitleSpacing());
                rowItemData.setTitleIndent(rowFormat.getTitleIndent());
                rowItemData.setTitleAlignment(rowFormat.getTitleAlignment());

                // row padding
                rowItemData.setPadding(rowLayout.getPaddingLeft(), rowLayout.getPaddingRight(), rowLayout.getPaddingTop(), rowLayout.getPaddingBottom());

                rowDataItems.add(rowItemData);

            }else if(item.getGroup()!=null){
                TextBoxData textBoxData  = new TextBoxData();
                textBoxData.setContent(item.getGroup(), rowFormat.getGroup());
                textBoxData.setFont(rowFormat.getGroup());
                textBoxData.setSolid(groupBackgroundColor);

                rowDataItems.add(textBoxData);
            }
        }

        report.setRowHeight(rowLayout.getHeight());

        report.setRowData(rowDataItems);

        return report;
    }


    /**
     * getter
     */

    public float getBorderWidth(){
        return borderWidth;
    }

    public int getFlowDirection(){
        return this.flowDirection;
    }
}
