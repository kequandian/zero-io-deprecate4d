package com.jfeat.pdf.print.report.reports;

import com.itextpdf.text.*;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FlowReport;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.base.ListRowBase;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.report.request.RowFormatRequest;
import com.jfeat.pdf.print.report.request.RowLayoutRequest;
import com.jfeat.pdf.print.report.row.*;
import com.jfeat.pdf.print.util.PageUtil;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class HeaderFlowReportBuilder{

    /// document
    private int columns;        //列数
    private int flowDirection;  //方向
    private String rowOption;  //流实体类型
    private float rowRatio;    //单元格高宽比

    private float flowHeight;
    private Rectangle pageSize = PageSize.A4;
    private float pageMarginLeft;
    private float pageMarginTop;
    private float pageMarginRight;
    private float pageMarginBottom;

    // rows margin
    private float rowsPaddingLeft;
    private float rowsPaddingTop;
    private float rowsPaddingRight;
    private float rowsPaddingBottom;

    private ListRowBase headerData;
    private ListRowBase groupingData;
    private List<ListRowBase> rowsData;

    private RowFormatRequest headerFormat;
    private RowLayoutRequest headerLayout;
    private RowFormatRequest groupingFormat;
    private RowLayoutRequest groupingLayout;
    private RowFormatRequest rowFormat = new RowFormatRequest();
    private RowLayoutRequest rowLayout = new RowLayoutRequest();


    /// background Color only for group row
    private BaseColor groupBackgroundColor;

    public HeaderFlowReportBuilder(){
        rowOption = ImageTextBox.ID;
    }

    public HeaderFlowReportBuilder columns(int cols){
        this.columns = cols;
        return this;
    }
    public HeaderFlowReportBuilder pageSize(float w, float h) {
        this.pageSize = new Rectangle(w, h);
        return this;
    }
    public HeaderFlowReportBuilder pageMargin(float margin){
        this.pageMarginLeft = this.pageMarginTop = this.pageMarginRight  = this.pageMarginBottom = margin;
        return this;
    }
    public HeaderFlowReportBuilder pageMargin(float l, float t, float r, float b){
        this.pageMarginLeft = l;
        this.pageMarginTop = t;
        this.pageMarginRight = r;
        this.pageMarginBottom = b;
        return this;
    }
    public HeaderFlowReportBuilder flowDirection(int flowDirection){
        this.flowDirection = flowDirection;
        return this;
    }
    public HeaderFlowReportBuilder rowOption(String option){
        if(option!=null) {
            this.rowOption = option;
        }
        return this;
    }
    public HeaderFlowReportBuilder rowRatio(float ratio){
        this.rowRatio = ratio;
        return this;
    }
    public HeaderFlowReportBuilder flowHeight(float flowHeight){
        this.flowHeight = flowHeight;
        return this;
    }
    public int rowAlignment(){
        return this.rowLayout==null? Element.ALIGN_LEFT :
                this.rowLayout.getAlignment();
    }

    public HeaderFlowReportBuilder rowsPadding(float left, float top, float right, float bottom){
        this.rowsPaddingLeft =  left;
        this.rowsPaddingTop =  top;
        this.rowsPaddingRight =  right;
        this.rowsPaddingBottom =  bottom;
        return this;
    }

    public HeaderFlowReportBuilder borderWidth(float l, float r, float t, float b){
        this.rowLayout.setBorderWidth(l, r, t, b);
        return this;
    }

    public HeaderFlowReportBuilder borderColor(ColorDefinition color){
        if(color!=null) {
            this.rowLayout.setBorderColor(color);

            /// set default color
            if(color.getRed()>0 || color.getGreen()>0 || color.getBlue()>9) {
                rowBorderColor(color.getRed(), color.getGreen(), color.getBlue());
            }
        }
        return this;
    }

    public HeaderFlowReportBuilder headerBorderColor(ColorDefinition color){
        if(color!=null) {
            this.rowLayout.setBorderColor(color);

            /// set default color
            if(color.getRed()>0 || color.getGreen()>0 || color.getBlue()>9) {
                rowBorderColor(color.getRed(), color.getGreen(), color.getBlue());
            }
        }
        return this;
    }

    public HeaderFlowReportBuilder headerFormat(RowFormatRequest format) {
        this.headerFormat = format;
        return this;
    }

    public HeaderFlowReportBuilder rowFormat(RowFormatRequest format) {
        this.rowFormat = format;
        return this;
    }

    public HeaderFlowReportBuilder headerHeight(float height){
        if(headerLayout==null){
            headerLayout = new RowLayoutRequest();
        }
        headerLayout.setHeight(height);
        return this;
    }
    public HeaderFlowReportBuilder headerPadding(float left, float right, float top, float bottom){
        if(headerLayout==null){
            headerLayout = new RowLayoutRequest();
        }
        headerLayout.setPadding(left, right, top, bottom);
        return this;
    }
    public HeaderFlowReportBuilder headerPadding(float padding){
        if(headerLayout==null){
            headerLayout = new RowLayoutRequest();
        }
        headerLayout.setPadding(padding,padding,padding,padding);
        return this;
    }
    public HeaderFlowReportBuilder headerBorderWidth(float left, float right, float top, float bottom){
        if(left<0 || right<0 || top<0 || bottom<0){
            // do nothing
        }else {
            if (headerLayout == null) {
                headerLayout = new RowLayoutRequest();
            }
            headerLayout.setBorderWidth(left, right, top, bottom);
        }
        return this;
    }
    public HeaderFlowReportBuilder headerBorderWidth(float width){
        if(width<0){
            /// do nothing
        }else {
            if (headerLayout == null) {
                headerLayout = new RowLayoutRequest();
            }
            headerLayout.setBorderWidth(width);
        }
        return this;
    }
    public HeaderFlowReportBuilder headerBorderColor(int red, int green, int blue){
        if(headerLayout==null){
            headerLayout = new RowLayoutRequest();
        }

        /// do not set color while black
        if(red>0 || green>0 || blue>0) {
            headerLayout.setBorderColor(red, green, blue);
        }
        return this;
    }

     public HeaderFlowReportBuilder headerFont(FontDefinition font){
         if(headerFormat==null){
             headerFormat = new RowFormatRequest();
         }
         headerFormat.setFont(font);
         return this;
     }

     public HeaderFlowReportBuilder headerSpacing(float spacing, float indent, String alignment, String verticalAlignment){
         if(headerFormat==null){
             headerFormat = new RowFormatRequest();
         }
         headerFormat.setSpacing(spacing);
         headerFormat.setIndent(indent);
         headerFormat.setAlignment(alignment);
         headerFormat.setVerticalAlignment(verticalAlignment);
         return this;
     }

    public HeaderFlowReportBuilder rowHeight(float height){
        rowLayout.setHeight(height);
        return this;
    }
    public HeaderFlowReportBuilder rowAlignment(int alignment){
        rowLayout.setAlignment(alignment);
        return this;
    }

    public HeaderFlowReportBuilder rowPadding(float left, float right, float top, float bottom){
        rowLayout.setPadding(left, right, top, bottom);
        return this;
    }
    public HeaderFlowReportBuilder rowBorderWidth(float left, float right, float top, float bottom){
        rowLayout.setBorderWidth(left, right, top, bottom);
        return this;
    }
    public HeaderFlowReportBuilder rowBorderWidth(float width){
        rowLayout.setBorderWidth(width);
        return this;
    }
    public HeaderFlowReportBuilder rowBorderColor(int red, int green, int blue){
        // do not set color while black
        if(red>0 || green>0 || blue>0) {
            rowLayout.setBorderColor(red, green, blue);
        }
        return this;
    }
    public HeaderFlowReportBuilder rowBorderColor(ColorDefinition colorDefinition){
        rowLayout.setBorderColor(colorDefinition);
        return this;
    }

     public HeaderFlowReportBuilder rowFont(FontDefinition font){
         rowFormat.setFont(font);
         return this;
     }
     public HeaderFlowReportBuilder rowSpacing(float spacing, float indent, String alignment, String verticalAlignment){
         rowFormat.setSpacing(spacing);
         rowFormat.setIndent(indent);
         rowFormat.setAlignment(alignment);
         rowFormat.setVerticalAlignment(verticalAlignment);
         return this;
     }

    // public FlowReportBuilder groupFormat(Font group, BaseColor backgroundColor){
    //     if(group!=null) {
    //         if (rowFormat == null) {
    //             rowFormat = new RowFormat();
    //         }
    //         rowFormat.setGroup(group);
    //     }

    //     if(backgroundColor!=null) {
    //         this.groupBackgroundColor = backgroundColor;
    //     }
    //     return this;
    // }

    public HeaderFlowReportBuilder headerData(ListRowBase data){
        this.headerData = data;
        return this;
    }

    public HeaderFlowReportBuilder rowsData(List<ListRowBase> data){
        this.rowsData = data;
        return this;
    }


    /**
     * build HeaderFlowReport
     * @return
     */
    public HeaderFlowReport build(){

        // create report
        HeaderFlowReport report = new HeaderContentFlowReport(columns);
        if(rowsPaddingLeft >0 || rowsPaddingTop >0 || rowsPaddingRight >0){
            /// rows table in double-row parent table
            report.setRowsPadding(rowsPaddingLeft, rowsPaddingTop, rowsPaddingRight, rowsPaddingBottom);
        }

        // set row height directly
        if(this.rowLayout.getHeight()>0) {
            report.setRowHeight(this.rowLayout.getHeight() + rowsPaddingTop + rowsPaddingBottom);

        }else if( Math.abs(this.rowRatio-1.0f) > 0.001){
            // calc row height by columns
            float rowWidth = (pageSize.getWidth() - pageMarginLeft - pageMarginRight) / columns
                    - (rowsPaddingLeft + rowsPaddingRight) * columns;
            report.setRowHeight(rowWidth*rowRatio + rowsPaddingTop + rowsPaddingBottom);

        }else{
            // equals to columns width
            float calcRowHeight = (pageSize.getWidth() - pageMarginLeft - pageMarginRight) / columns
                    - (rowsPaddingLeft + rowsPaddingRight) * columns;
            report.setRowHeight(calcRowHeight + rowsPaddingTop + rowsPaddingBottom);
        }

        report.setFlowDirection(flowDirection);
        if(flowDirection == FlowReport.FLOW_UTD){
            if(flowHeight<=0){
                throw new RuntimeException("Flow height is not set for FLOW_UTD direction.");
            }
            int maxRowsPerColumn = PageUtil.calcRows(flowHeight,
                    headerLayout != null ? headerLayout.getHeight() : 0,
                    rowLayout != null ? rowLayout.getHeight() : 0);
            report.setMaxRowsPerColumn(maxRowsPerColumn);
        }

        report.setRowAlignment(this.rowAlignment());


        // header
        if(this.headerData!=null) {
            if(headerLayout!=null ) {
                report.setHeaderBorderWidth(this.headerLayout.getBorderLeft(), this.headerLayout.getBorderRight(), this.headerLayout.getBorderTop(), this.headerLayout.getBorderBottom() );
            }
            report.setHeaderBorderColor(headerLayout==null ? null : (this.headerLayout.getBorderColor()==null ? null : ColorDefinition.getBaseColor(this.headerLayout.getBorderColor())) );

            /// header data
            ImageTextBoxData headerRowData = new ImageTextBoxData();

            // header padding
            headerRowData.setPadding(
                    headerLayout.getPaddingLeft(),
                    headerLayout.getPaddingRight(),
                    headerLayout.getPaddingTop(),
                    headerLayout.getPaddingBottom());

            report.setHeaderBorderWidth(headerLayout.getBorderLeft(), headerLayout.getBorderTop(),
                    headerLayout.getBorderRight(), headerLayout.getBorderBottom()
            );

            if (headerFormat.getSpacing() > 0) {
                headerRowData.setPadding(headerFormat.getSpacing());
            }
            if (headerFormat.getIndent() > 0) {
                headerRowData.setIndent(headerFormat.getIndent());
            }
            headerRowData.setAlignment(headerFormat.getAlignment());
            headerRowData.setVerticalAlignment(headerFormat.getVerticalAlignment());

            report.setHeaderData(headerRowData);
            report.setHeaderHeight(headerLayout.getHeight());
        }


        /// rows
        List<ListRowBase> rowDataItems = new ArrayList<>();
        for(ListRowBase it : this.rowsData) {

            if( RelativeRow.ID.compareTo(rowOption)==0 ) {
                RelativeRowData item = (RelativeRowData)it;

                RelativeRowData rowItemData =new RelativeRowData();

                rowItemData.setTitle(item.getTitle(), rowFormat.getFont());
                rowItemData.setSubtitle(item.getSubtitle());
                rowItemData.setHint(item.getHint());
                rowItemData.setValue(item.getValue());
                rowItemData.setImageUrl(item.getImageUrl());
                rowItemData.setNextImageUrl(item.getNextImageUrl());

                // row padding
                rowItemData.setPadding(rowLayout.getPaddingLeft(), rowLayout.getPaddingRight(), rowLayout.getPaddingTop(), rowLayout.getPaddingBottom());

                rowDataItems.add(rowItemData);

            }else if(TextBox.ID.compareTo(rowOption)==0) {
                ImageTextBoxData item = (ImageTextBoxData)it;

                TextBoxData rowItemData = new TextBoxData();
                rowItemData.setText(item.getTitle());

                // format
                rowItemData.setTitleFont(rowFormat.getFont());
                rowItemData.setSpacing(rowFormat.getSpacing());
                rowItemData.setIndent(rowFormat.getIndent());
                rowItemData.setAlignment(rowFormat.getAlignment());
                rowItemData.setVerticalAlignment(rowFormat.getVerticalAlignment());
                rowItemData.setPadding(rowLayout.getPaddingLeft(), rowLayout.getPaddingRight(), rowLayout.getPaddingTop(), rowLayout.getPaddingBottom());

                rowDataItems.add(rowItemData);
            }
            else if(ImageTextBox.ID.compareTo(rowOption)==0) {
                ImageTextBoxData item = (ImageTextBoxData)it;

                ImageTextBoxData rowItemData = new ImageTextBoxData();

                rowItemData.setImageUrl(item.getImageUrl());
                rowItemData.setTitle(item.getTitle());

                // format
                rowItemData.setTitleFont(rowFormat.getFont());
                rowItemData.setSpacing(rowFormat.getSpacing());
                rowItemData.setIndent(rowFormat.getIndent());
                rowItemData.setAlignment(rowFormat.getAlignment());
                rowItemData.setVerticalAlignment(rowFormat.getVerticalAlignment());
                rowItemData.setPadding(rowLayout.getPaddingLeft(), rowLayout.getPaddingRight(), rowLayout.getPaddingTop(), rowLayout.getPaddingBottom());

                rowDataItems.add(rowItemData);

            }else if(ImageBox.ID.compareTo(rowOption)==0) {
                ImageTextBoxData item = (ImageTextBoxData)it;

                ImageBoxData rowItemData = new ImageBoxData();

                rowItemData.setImageUrl(item.getImageUrl());
                rowItemData.setPadding(rowLayout.getPaddingLeft(), rowLayout.getPaddingRight(), rowLayout.getPaddingTop(), rowLayout.getPaddingBottom());

                rowDataItems.add(rowItemData);
            }
        }

        report.setRowBorderWidth(this.rowLayout.getBorderLeft(), this.rowLayout.getBorderRight(), this.rowLayout.getBorderTop(), this.rowLayout.getBorderBottom());
        report.setRowBorderColor(this.rowLayout.getBorderColor()==null ? null : ColorDefinition.getBaseColor(this.rowLayout.getBorderColor()));
        report.setRowBorderWidth(rowLayout.getBorderLeft(), rowLayout.getBorderTop(), rowLayout.getBorderRight(), rowLayout.getBorderBottom());
        report.setRowBorderColor(this.rowLayout.getBorderColor()==null? null : ColorDefinition.getBaseColor(this.rowLayout.getBorderColor()));
        report.setRowData(rowDataItems);

        return report;
    }

    public RowFormatRequest getGroupingFormat() {
        return groupingFormat;
    }

    public void setGroupingFormat(RowFormatRequest groupingFormat) {
        this.groupingFormat = groupingFormat;
    }

    public RowLayoutRequest getGroupingLayout() {
        return groupingLayout;
    }

    public void setGroupingLayout(RowLayoutRequest groupingLayout) {
        this.groupingLayout = groupingLayout;
    }

    public ListRowBase getGroupingData() {
        return groupingData;
    }

    public void setGroupingData(ListRowBase groupingData) {
        this.groupingData = groupingData;
    }
}
