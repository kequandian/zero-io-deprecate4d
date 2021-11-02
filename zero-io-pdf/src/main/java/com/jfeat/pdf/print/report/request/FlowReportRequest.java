package com.jfeat.pdf.print.report.request;

import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.report.builder.RowData;
import com.jfeat.pdf.print.report.builder.RowLayout;
import com.jfeat.pdf.print.report.row.FlowListRow;

import java.util.List;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class FlowReportRequest {

    public static final String LTR = "LTR";
    public static final String UTD = "UTD";

    private int columns;
    private String flowDirection;   // LTR, UTD
    private String rowOption = FlowListRow.ID;   /// select different row layout style {FlowListRow,StackFlowListRow}}
    // border
    private float borderWidth;
    private ColorDefinition borderColor;

    // rows margins
    private float rowsMarginLeft;
    private float rowsMarginTop;
    private float rowsMarginRight;
    private float rowsMarginBottom;

    public int getColumns() {
        return columns;
    }

    public void setColumns(int columns) {
        this.columns = columns;
    }

    public String getFlowDirection() {
        return flowDirection;
    }

    public void setFlowDirection(String flowDirection) {
        this.flowDirection = flowDirection;
    }

    public String getRowOption() {
        return rowOption;
    }

    public void setRowOption(String rowOption) {
        this.rowOption = rowOption;
    }

    public float getBorderWidth() {
        return borderWidth;
    }

    public void setBorderWidth(float borderWidth) {
        this.borderWidth = borderWidth;
    }

    public ColorDefinition getBorderColor() {
        return borderColor;
    }

    public void setBorderColor(int r, int g, int b) {
        this.borderColor = new ColorDefinition(r,g,b);
    }
    public void setBorderColor(ColorDefinition color) {
        this.borderColor = color;
    }

    public void setRowsMargin(float margin){
        this.rowsMarginLeft = margin;
        this.rowsMarginRight = margin;
        this.rowsMarginTop = margin;
        this.rowsMarginBottom = margin;
    }
    public void setRowsMargin(float left, float top, float right, float bottom){
        this.rowsMarginLeft = left;
        this.rowsMarginTop = top;
        this.rowsMarginRight = right;
        this.rowsMarginBottom = bottom;
    }
    public void setRowsMargin(String margin){
        try {
            if (margin != null && margin.contains(",")) {
                String[] margins = margin.split(",");
                if (margins.length == 4) {
                    float left = Float.parseFloat(margins[0]);
                    float top = Float.parseFloat(margins[1]);
                    float right = Float.parseFloat(margins[2]);
                    float bottom = Float.parseFloat(margins[3]);
                    setRowsMargin(left, top, right, bottom);
                }
            } else {
                float marginF = Float.parseFloat(margin);
                setRowsMargin(marginF);
            }
        }catch (NumberFormatException e){
        }
    }

    public String getRowsMargin(){
        return String.format("%f,%f,%f,%f",rowsMarginLeft,rowsMarginTop,rowsMarginRight,rowsMarginBottom);
    }

    public float getRowsMarginLeft() {
        return rowsMarginLeft;
    }
    public float getRowsMarginTop() {
        return rowsMarginTop;
    }
    public float getRowsMarginRight() {
        return rowsMarginRight;
    }
    public float getRowsMarginBottom() {
        return rowsMarginBottom;
    }

    /**
     * data
     */
    private RowData header;

    private List<RowData> rows;

    public RowData getHeader() {
        return header;
    }

    public void setHeader(RowData header) {
        this.header = header;
    }

    public List<RowData> getRows() {
        return rows;
    }

    public void setRows(List<RowData> rows) {
        if(flowDirection == LTR) {
            if (rows.size() % 2 == 1) {
                rows.add(RowData.EMPTY);
            }
        }
        this.rows = rows;
    }

    /**
     * format
     */
    private FormatRequest format;

    public FormatRequest getFormat() {
        return format;
    }

    public void setFormat(FormatRequest format) {
        this.format = format;
    }

    /**
     * layout
     */
    private LayoutRequest layout;

    public LayoutRequest getLayout() {
        return layout;
    }

    public void setLayout(LayoutRequest layout) {
        this.layout = layout;
    }



    /**
     * 数据定义，用于参考
     * @return
     */
    private Definitions definitions = new Definitions();

    public Definitions getDefinitions() {
        return definitions;
    }

    public static int getFlowDirection(String flowDirection){
        return flowDirection.equals(FlowReportRequest.LTR) ? 0 :
                ( flowDirection.equals(FlowReportRequest.UTD) ? 1 : -1 );
    }


    /**
     * format request
     */
    public static class FormatRequest{
        private RowFormatRequest header;
        private RowFormatRequest rows;
        private GroupFormatRequest groups;

        public RowFormatRequest getHeader() {
            return header;
        }

        public void setHeader(RowFormatRequest header) {
            this.header = header;
        }

        public RowFormatRequest getRows() {
            return rows;
        }

        public void setRows(RowFormatRequest rows) {
            this.rows = rows;
        }

        public GroupFormatRequest getGroups() {
            return groups;
        }

        public void setGroups(GroupFormatRequest groups) {
            this.groups = groups;
        }

        public void setGroups(FontDefinition font, ColorDefinition backgroundColor) {
            this.groups = new GroupFormatRequest(font, backgroundColor);
        }
    }


    /**
     * layout request
     */
    public static class LayoutRequest{

        private RowLayout header;
        private RowLayout rows;

        public RowLayout getHeader() {
            return header;
        }

        public void setHeader(RowLayout header) {
            this.header = header;
        }

        public RowLayout getRows() {
            return rows;
        }

        public void setRows(RowLayout rows) {
            this.rows = rows;
        }
    }

}
