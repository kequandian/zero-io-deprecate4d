package com.jfeat.pdf.print.report.request;

import com.baomidou.mybatisplus.extension.api.R;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.report.builder.RowData;
import com.jfeat.pdf.print.report.builder.RowLayout;
import com.jfeat.pdf.print.report.row.FlowListRow;
import org.apache.commons.io.FilenameUtils;
import org.springframework.util.Assert;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;
import java.io.StreamCorruptedException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Stream;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class FlowReportRequest {

    public static final String LTR = "LTR";
    public static final String UTD = "UTD";

    private int columns;
    private String flowDirection = LTR;   // LTR, UTD
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

    public FlowReportRequest setColumns(int columns) {
        this.columns = columns;
        return this;
    }

    public String getFlowDirection() {
        return flowDirection;
    }

    public FlowReportRequest setFlowDirection(String flowDirection) {
        this.flowDirection = flowDirection;
        return this;
    }

    public String getRowOption() {
        return rowOption;
    }

    public FlowReportRequest setRowOption(String rowOption) {
        this.rowOption = rowOption;
        return this;
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
    private RowData headerData;

    private List<RowData> rowsData;

    public RowData getHeaderData() {
        return headerData;
    }

    public FlowReportRequest setHeaderData(RowData headerData) {
        this.headerData = headerData;
        return this;
    }

    public List<RowData> getRowsData() {
        return rowsData;
    }

    public FlowReportRequest setRowsData(List<RowData> rows) {
        if(flowDirection == LTR) {
            if (rows.size() % 2 == 1) {
                rows.add(RowData.EMPTY);
            }
        }
        this.rowsData = rowsData;
        return this;
    }

    public FlowReportRequest initRowsData(String imageDir){
        this.rowsData = new ArrayList<>();
        File dirRoot = new File(imageDir);
        Assert.isTrue(dirRoot.exists() && dirRoot.isDirectory(), dirRoot + " not exists!");

        String[] imageUrls = dirRoot.list(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String name) {
                return name.endsWith(".png") ||
                        name.endsWith(".jpeg") ||
                        name.endsWith(".jpg");
            }
        });

        for(String url : imageUrls){
            RowData row = new RowData();
            row.setIconUrl(url);
            row.setTitle(FilenameUtils.getName(url));

            this.rowsData.add(row);
        }

        return this;
    }

    /**
     * 定义表头与行打印格式
     * format
     */
    private FormatRequest format;

    public FormatRequest getFormat() {
        return format;
    }

    public FlowReportRequest setFormat(FormatRequest format) {
        this.format = format;
        return this;
    }

    /**
     * 定义表头与行的打印布局
     * layout
     */
    private LayoutRequest layout;

    public LayoutRequest getLayout() {
        return layout;
    }

    public FlowReportRequest setLayout(LayoutRequest layout) {
        this.layout = layout;
        return this;
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
        private RowFormatRequest header = new RowFormatRequest();
        private RowFormatRequest rows = new RowFormatRequest();
        private GroupFormatRequest groups = new GroupFormatRequest();

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
     * 定义表头与行布局
     * layout request
     */
    public static class LayoutRequest{

        private RowLayout header = new RowLayout();
        private RowLayout rows = new RowLayout();

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
