package com.jfeat.pdf.print;

import com.itextpdf.text.Element;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.flow.TableFlow;
import javafx.scene.control.Tab;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

/**
 * Created by vincent on 2018/10/8.
 */
public class PdfFlowRequest {

    private Page page;
    private List<Flow> flows;

    /// 定义
    private Definitions definitions;

    public Page getPage() {
        return page;
    }

    public void setPage(Page page) {
        this.page = page;
    }

    public List<Flow> getFlows() {
        return flows;
    }

    public void setFlows(List<Flow> flows) {
        this.flows = flows;
    }

    public Definitions getDefinitions() {
        return definitions;
    }

    public void setDefinitions(Definitions definitions) {
        this.definitions = definitions;
    }

    /**
     * Pdf导出页面设置，大小，边框
     */
    public static class Page{
        private String pageName;
        private Rectangle pageSize;

        private float marginLeft;
        private float marginTop;
        private float marginRight;
        private float marginBottom;

        public Page(){}

        public Page(String pageName, float margin){
            this.pageName = pageName;
            this.pageSize = getPageSize(pageName);
            setMargin(margin);
        }

        public Page(String pageName, float marginLeft, float marginTop, float marginRight, float marginBottom){
            this.pageName = pageName;
            this.pageSize = getPageSize(pageName);
            setMargin(marginLeft, marginTop, marginRight, marginBottom);
        }

        public Page(float pageWidth, float pageHeight, float margin){
            this.pageSize = new Rectangle(0,0,pageWidth, pageHeight);
            setMargin(margin);
        }

        public Page(float pageWidth, float pageHeight, float marginLeft, float marginTop, float marginRight, float marginBottom){
            this.pageSize = new Rectangle(0,0,pageWidth, pageHeight);
            setMargin(marginLeft, marginTop, marginRight, marginBottom);
        }

        public Rectangle getPageSize(String pageName){
            if("A4".equals(pageName)){
                return PageSize.A4;
            }else{
                throw new RuntimeException("not implement, provide the page if required.");
            }
        }

        public String getPageName() {
            return pageName;
        }

        public void setPageName(String pageName) {
            if(pageName==null || pageName.length()==0){
                throw new RuntimeException("empty page name is not allowed");
            }
            this.pageName = pageName;

            // update page size
            this.pageSize = getPageSize(pageName);
        }

        public void setPageSize(Rectangle size){
            this.pageSize = size;
        }

        public Rectangle getPageSize(){
            return this.pageSize;
        }

        public float getPageWidth() {
            return pageSize.getWidth();
        }

        public float getPageHeight() {
            return pageSize.getHeight();
        }

        public float getMarginLeft() {
            return marginLeft;
        }

        public void setMarginLeft(float marginLeft) {
            this.marginLeft = marginLeft;
        }

        public float getMarginTop() {
            return marginTop;
        }

        public void setMarginTop(float marginTop) {
            this.marginTop = marginTop;
        }

        public float getMarginRight() {
            return marginRight;
        }

        public void setMarginRight(float marginRight) {
            this.marginRight = marginRight;
        }

        public float getMarginBottom() {
            return marginBottom;
        }

        public void setMarginBottom(float marginBottom) {
            this.marginBottom = marginBottom;
        }

        public void setMargin(float margin){
            this.marginLeft = margin;
            this.marginBottom = margin;
            this.marginRight = margin;
            this.marginTop = margin;
        }
        public void setMargin(float marginLeft, float marginTop, float marginRight, float marginBottom){
            this.marginLeft = marginLeft;
            this.marginBottom = marginTop;
            this.marginRight = marginRight;
            this.marginTop = marginBottom;
        }

    }

    /**
     * 命名的流数据
     */
    public static class Flow{
        public static final String TITLE_FLOW = "title";
        public static final String SEPARATOR_FLOW = "line";
        public static final String QRCODE_FLOW = "qrcode";
        public static final String TABLE_FLOW = "table";
        public static final String LAYOUT_FLOW = "layout";
        public static final String CONTENT_FLOW = "content";
        public static final String LINEAR_FLOW = "linear";
        public static final String NEW_LINE = "newLine";

        public Flow() {}
        public Flow(String name, FlowElement element){
            this.name = name;
            this.element = element;
        }

        /**
         * 自定义 Pdf 流名称，用于指定什么参数集
         */
        private String name;

        /**
         * 参数集引用
         */
        private FlowElement element;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public FlowElement getElement() {
            return element;
        }

        public void setElement(FlowElement element) {
            this.element = element;
        }
    }

    public interface FlowElement{
        String ALIGN_LEFT = "ALIGN_LEFT";
        String ALIGN_CENTER = "ALIGN_CENTER";
        String ALIGN_RIGHT = "ALIGN_RIGHT";
        String ALIGN_JUSTIFIED = "ALIGN_JUSTIFIED";
        String ALIGN_TOP = "ALIGN_TOP";
        String ALIGN_MIDDLE = "ALIGN_MIDDLE";
        String ALIGN_BOTTOM = "ALIGN_BOTTOM";
        String ALIGN_BASELINE = "ALIGN_BASELINE";
        String ALIGN_JUSTIFIED_ALL = "ALIGN_JUSTIFIED_ALL";

        static int getAlignment(String align){
            if(align==null || align.length()==0){
                return Element.ALIGN_CENTER;
            }
            if(ALIGN_LEFT.equals(align)){
                return Element.ALIGN_LEFT;
            }
            if(ALIGN_CENTER.equals(align)){
                return Element.ALIGN_CENTER;
            }
            if(ALIGN_RIGHT.equals(align)){
                return Element.ALIGN_RIGHT;
            }
            if(ALIGN_JUSTIFIED.equals(align)){
                return Element.ALIGN_JUSTIFIED;
            }
            if(ALIGN_TOP.equals(align)){
                return Element.ALIGN_TOP;
            }
            if(ALIGN_MIDDLE.equals(align)){
                return Element.ALIGN_MIDDLE;
            }
            if(ALIGN_BOTTOM.equals(align)){
                return Element.ALIGN_BOTTOM;
            }
            if(ALIGN_BASELINE.equals(align)){
                return Element.ALIGN_BASELINE;
            }
            if(ALIGN_JUSTIFIED_ALL.equals(align)){
                return Element.ALIGN_JUSTIFIED_ALL;
            }

            return Element.ALIGN_UNDEFINED;
        }
    }


    /**
     * 分隔线流实体定义
     */
    public static class SeparatorFlowData implements FlowElement{
        private String formatName;

        public String getFormatName() {
            return formatName;
        }

        public void setFormatName(String formatName) {
            this.formatName = formatName;
        }
    }

    /**
     * 标题（文字）流实体定义，字体格式 及 对齐参数
     */
    public static class TitleFlowData implements FlowElement{
        private String content;
        private String formatName;
        private String alignment;
        public TitleFlowData() { }
        public TitleFlowData(String content, String formatName, String alignment){
            this.content = content;
            this.formatName = formatName;
            this.alignment = alignment;
        }

        public String getContent() {
            return content;
        }

        public void setContent(String content) {
            this.content = content;
        }

        public String getFormatName() {
            return formatName;
        }

        public void setFormatName(String formatName) {
            this.formatName = formatName;
        }

        public String getAlignment() {
            return alignment;
        }

        public void setAlignment(String alignment) {
            this.alignment = alignment;
        }
    }


    /**
     * 二维码流实体定义（未实现）
     */
    public static class QRCodeFlowData implements FlowElement{
        private String code;
        private String formatName;

        public QRCodeFlowData() {}

        public QRCodeFlowData(String code, String formatName) {
            this.code = code;
            this.formatName = formatName;
        }
        public String getFormatName() {
            return formatName;
        }

        public void setFormatName(String formatName) {
            this.formatName = formatName;
        }

        public String getCode() {
            return code;
        }

        public void setCode(String code) {
            this.code = code;
        }
    }

    /**
     * 流实体定义
     * */
    public static class ContentFlowData implements FlowElement {
        private Layout layout;
        private RowFormat format;
        private String[] title;
        private String[] data;

        public Layout getLayout() {
            return layout;
        }

        public void setLayout(Layout layout) {
            this.layout = layout;
        }

        public static ContentFlowData build() {
            return new ContentFlowData();
        }
        public ContentFlowData setLayout(float[] columnsWith) {
            layout = new Layout(columnsWith);
            return this;
        }
        public ContentFlowData rowFormat(String formatName, float height) {
            format = new RowFormat(formatName, height);
            return this;
        }

        public RowFormat getFormat() {
            return format;
        }

        public ContentFlowData setFormat(RowFormat format) {
            this.format = format;
            return this;
        }

        public String[] getTitle() {
            return title;
        }

        public ContentFlowData setTitle(String[] title) {
            this.title = title;
            return this;
        }

        public String[] getData() {
            return data;
        }

        public ContentFlowData setData(String[] data) {
            this.data = data;
            return this;
        }
    }
    /**
     * 表格流实体定义：包括，布局，格式以及表数据
     */
    public static class TableFlowData implements FlowElement{
        private Layout layout;
        private TableRowFormat format;
        private String header;
        private TableBorderFormat borderFormat;
        private String[] data;

        public static TableFlowData build() {
            return new TableFlowData();
        }
        public TableFlowData layout(float[] columnsWith) {
            layout = new Layout(columnsWith);
            return this;
        }
        public TableFlowData borderFormat(Integer style, Integer width) {
            this.setBorderFormat(new TableBorderFormat(style, width));
            return this;
        }
        public TableFlowData data(String[] data) {
            this.data = data;
            return this;
        }
        public TableFlowData headerFormat(String formatName, float height) {
            if(format == null) {
                format = new TableRowFormat();
            }
            RowFormat header = new RowFormat();
            format.setHeader(new RowFormat(formatName, height));
            return this;
        }
        public TableFlowData firstRowFormat(String formatName, float height) {
            if(format == null) {
                format = new TableRowFormat();
            }
            format.setFirstRowFormat(new RowFormat(formatName, height));
            return this;
        }

        public TableFlowData rowFormat(String formatName, float height) {
            if(format == null) {
                format = new TableRowFormat();
            }
            format.setRowFormat(new RowFormat(formatName, height));
            return this;
        }


        public TableBorderFormat getBorderFormat() {
            return borderFormat;
        }

        public void setBorderFormat(TableBorderFormat borderFormat) {
            this.borderFormat = borderFormat;
        }

        public Layout getLayout() {
            return layout;
        }

        public void setLayout(Layout layout) {
            this.layout = layout;
        }

        public TableRowFormat getFormat() {
            return format;
        }

        public void setFormat(TableRowFormat format) {
            this.format = format;
        }

        public String[] getData() {
            return data;
        }

        public TableFlowData setData(String[] data) {
            this.data = data;
            return this;
        }

        public String getHeader() {
            return header;
        }

        public TableFlowData setHeader(String header) {
            this.header = header;
            return this;
        }

        public static class TableBorderFormat {
            private Integer style;
            private Integer width;

            public TableBorderFormat() {}
            public TableBorderFormat(Integer style, Integer width) {
                this.style = style;
                this.width = width;
            }

            public Integer getStyle() {
                return style;
            }

            public void setStyle(Integer style) {
                this.style = style;
            }

            public Integer getWidth() {
                return width;
            }

            public void setWidth(Integer width) {
                this.width = width;
            }
        }
        /**
         * 表格格式, 包括(表头格式，第一行格式，其他行格式)三部分格式
         * 第一行 格式包括： 行高 + 字体
         */
        public static class TableRowFormat {
            private RowFormat header;
            private RowFormat firstRowFormat;
            private RowFormat rowFormat;

            public RowFormat getHeader() {
                return header;
            }

            public void setHeader(RowFormat header) {
                this.header = header;
            }

            public RowFormat getFirstRowFormat() {
                return firstRowFormat;
            }

            public void setFirstRowFormat(RowFormat firstRowFormat) {
                this.firstRowFormat = firstRowFormat;
            }

            public RowFormat getRowFormat() {
                return rowFormat;
            }

            public void setRowFormat(RowFormat rowFormat) {
                this.rowFormat = rowFormat;
            }
        }
    }


    /**
     * 流布局，至上而下(定义列数为1时)
     * 横向布局 使布局横向分配
     *
     */
    public static class LinearFlowData implements FlowElement{
        private List<Flow> elements = new ArrayList<>();
        private Layout layout;
        public LinearFlowData() {}
        public LinearFlowData(float[] columnsWith) {
            layout = new Layout();
            layout.setColumnWidths(columnsWith);
        }

        public static LinearFlowData build() {
            return new LinearFlowData();
        }

        public LinearFlowData add(Flow element) {
            elements.add(element);
            return this;
        }
        public List<Flow> getElements() {
            return elements;
        }

        public void setElements(List<Flow> elements) {
            this.elements = elements;
        }

        public Layout getLayout() {
            return layout;
        }
        public LinearFlowData setLayout(float[] columnsWiths) {
            this.layout = new Layout(columnsWiths);
            return this;
        }
        public void setLayout(Layout layout) {
            this.layout = layout;
        }
    }


    /**
     * 布局,可台定义列数（宽度平分），也可以定义不同的列宽
     */
    public static class Layout{
        private int numColumns;
        private float[] columnWidths;
        @Deprecated
        public int getNumColumns() {
            return numColumns;
        }
        @Deprecated
        public void setNumColumns(int numColumns) {
            this.numColumns = numColumns;
        }
        public Layout() {}
        public Layout(float[] columnWidths) {
            this.columnWidths = columnWidths;
        }
        public float[] getColumnWidths() {
            return columnWidths;
        }

        public void setColumnWidths(float[] columnWidths) {
            this.columnWidths = columnWidths;
        }
    }

    /**
     * Table Row format
     * 包括行高，Definitions中定义的格式名称
     */
    public static class RowFormat {
        private float height;
        private String formatName;
        public RowFormat() {}
        public RowFormat(String formatName, float height) {
            this.height = height;
            this.formatName = formatName;
        }
        public float getHeight() {
            return height;
        }

        public void setHeight(float height) {
            this.height = height;
        }

        public String getFormatName() {
            return formatName;
        }

        public void setFormatName(String formatName) {
            this.formatName = formatName;
        }
    }


    /**
     * 预定义格式，如字体，边界
     * 通过名称，获取具体格式参数
     */
    public static class Definitions{

        public Definitions(){}

        public Definitions(java.util.Map<String, FontDefinition> fonts, java.util.Map<String, BorderDefinition> borders){
            this.fonts = fonts;
            this.borders = borders;
        }

        /**
         * 字体定义
         */
        private java.util.Map<String, FontDefinition> fonts;

        private java.util.Map<String, BorderDefinition> borders;

        public Map<String, FontDefinition> getFonts() {
            return fonts;
        }

        public void setFonts(Map<String, FontDefinition> fonts) {
            this.fonts = fonts;
        }

        public Map<String, BorderDefinition> getBorders() {
            return borders;
        }

        public void setBorders(Map<String, BorderDefinition> borders) {
            this.borders = borders;
        }
    }
}
