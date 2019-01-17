package com.jfeat.pdf.print;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.draw.DottedLineSeparator;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.element.FlowLayout;
import com.jfeat.pdf.print.flow.ContentFlowBuilder;
import com.jfeat.pdf.print.flow.TableFlow;
import com.jfeat.pdf.print.flow.TableFlowBuilder;
import com.jfeat.pdf.print.util.TextFile;
import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.jfeat.pdf.print.PdfFlowRequest.*;

/**
 * Created by vincent on 2018/10/8.
 */
public class PdfPrintingFlowUtil {

    /**
     * 测试
     * @param args
     */
    public static void main(String[] args) throws FileNotFoundException, DocumentException {
        PdfFlowRequest data = new PdfFlowRequest();
        /// 设置页面
        data.setDefinitions(new Definitions(new HashMap<>(), new HashMap<>()));
        data.setPage(new Page("A4", 20));

        /// 设置定义
        Map<String,FontDefinition> fontDefs = data.getDefinitions().getFonts();
        Map<String,BorderDefinition> borderDefs = data.getDefinitions().getBorders();
        fontDefs.put("title", new FontDefinition("宋体", 16, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("table-header", new FontDefinition("宋体", 14, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-firstrow", new FontDefinition("宋体", 12, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-row", new FontDefinition("宋体", 10, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("default", new FontDefinition("宋体", 9, FontDefinition.NORMAL, ColorDefinition.BLACK));
        // border
        borderDefs.put("table-border", new BorderDefinition(null, 2, ColorDefinition.BLACK));
        borderDefs.put("line", new BorderDefinition(BorderDefinition.TOP, 2, ColorDefinition.BLACK));
        borderDefs.put("right", new BorderDefinition(BorderDefinition.RIGHT, 10, ColorDefinition.BLACK));


        /**
         * 主要设置内容
         */
        data.setFlows(new ArrayList<>());
        List<Flow> flows = data.getFlows();

        flows.add(new Flow(Flow.TITLE_FLOW, new TitleFlowData(
                "采购订单", "title", FlowElement.ALIGN_CENTER
        )));



        RowFormat rowFormat = new RowFormat();
        rowFormat.setFormatName("default");
        rowFormat.setHeight(20);
        /**
         * content
         * */
        String[] title = {"甲方:", "乙方", "交货"};
        String[] lines = {"择阿迪达斯官方网店", "择阿迪达斯官方网店", "择阿迪达斯官方网店"};
        ContentFlowData contentFlowData = new ContentFlowData();
        contentFlowData.setFormat(rowFormat);
        Layout contentLayout = new Layout();
        contentLayout.setColumnWidths(new float[]{1, 4});
        contentFlowData.setLayout(contentLayout);
        contentFlowData.setTitle(title);
        contentFlowData.setData(lines);

        // content2
        String[] title2 = {"订单编号", "订单日期", "申购单号"};
        String[] lines2 = {"P12848-85", "2018-11-10", "P12848-85"};
        ContentFlowData contentFlowData2 = new ContentFlowData();
        contentFlowData2.setFormat(rowFormat);
        Layout contentLayout2 = new Layout();
        contentLayout2.setColumnWidths(new float[]{1, 3});
        contentFlowData2.setLayout(contentLayout2);
        contentFlowData2.setTitle(title2);
        contentFlowData2.setData(lines2);

        LinearFlowData wrapper = new LinearFlowData();
        Layout wrapperLayout = new Layout();
        wrapperLayout.setColumnWidths(new float[]{3, 2});
        wrapper.setLayout(wrapperLayout);
        wrapper.add(new Flow(Flow.CONTENT_FLOW, contentFlowData));
        wrapper.add(new Flow(Flow.CONTENT_FLOW, contentFlowData2));
        flows.add(new Flow(Flow.LINEAR_FLOW, wrapper));

        // table
        String[] titles2 = {"行号", "物料编号", "物料名称", "材料及规格备注:", "单位", "单价", "数量", "金额", "交货日期", "备注"};
        String[] datas2 = {"行号", "物料编号", "物料名称", "材料及规格备注:", "单位", "单价", "数量", "金额", "交货日期", "备注",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
        };
        Layout layout = new Layout();
        layout.setColumnWidths(new float[]{2, 4, 5,  4, 2, 2, 2, 3, 3, 3 });

        RowFormat rowFormat2 = new RowFormat();
        rowFormat2.setFormatName("default");
        rowFormat2.setHeight(60);

        TableFlowData.TableRowFormat tableRowFormat = new TableFlowData.TableRowFormat();
        tableRowFormat.setRowFormat(rowFormat2);

        TableFlowData tableFlowData = new TableFlowData();
        tableFlowData.setLayout(layout);
        tableFlowData.setData(datas2);
        tableFlowData.setFormat(tableRowFormat);
        flows.add(new Flow(Flow.TABLE_FLOW, tableFlowData));

        Layout layout3 = new Layout();
        layout3.setColumnWidths(new float[]{19, 2, 3, 3, 3 });

        RowFormat rowFormat3 = new RowFormat();
        rowFormat3.setFormatName("default");
        rowFormat3.setHeight(30);

        TableFlowData.TableRowFormat tableRowFormat3 = new TableFlowData.TableRowFormat();
        tableRowFormat3.setRowFormat(rowFormat3);

        TableFlowData tableFlowData3 = new TableFlowData();
        tableFlowData3.setLayout(layout3);
        tableFlowData3.setFormat(tableRowFormat3);
        tableFlowData3.setData(new String[]{"合计", "1125.00", "22.00"});
        flows.add(new Flow(Flow.TABLE_FLOW, tableFlowData3));

        flows.add(new Flow(Flow.LINEAR_FLOW, wrapper));

        // 打印
        PdfPrintingFlowUtil util = new PdfPrintingFlowUtil();
        util.data(data);
        util.export("out.pdf");

        //  写入模板
//        TextFile.write("src/test/origin.json", JSONObject.toJSONString(data, SerializerFeature.DisableCircularReferenceDetect));

    }


    private Page page;
    private List<Flow> flows;

    private Map<String, Font> fonts;
    private Map<String, BorderDefinition> borders;

    public PdfPrintingFlowUtil(){}

    public PdfPrintingFlowUtil export(OutputStream io) throws DocumentException{
        PdfExporter exporter = new PdfExporter();

        PdfContentByte canvas = exporter.export(io,
                page.getPageSize(),
                page.getMarginLeft(), page.getMarginRight(),
                page.getMarginTop(), page.getMarginBottom()
                ).canvas();

        for(Flow flow : flows){
           if (flow.getName().equals(Flow.LINEAR_FLOW)) {
               LinearFlowData flowData = (LinearFlowData)flow.getElement();
                FlowLayout qrCodeStack = new FlowLayout(1);
                FlowLayout wrapLayout = new FlowLayout(flowData.getLayout().getColumnWidths());
                for(Flow element : flowData.getElements()) {
                    wrapLayout.add((PdfPTable) getFlowElement(element, canvas));
                }
                exporter.addElement(wrapLayout);
            }  else {
               exporter.addElement(getFlowElement(flow, canvas));
           }
        }
        exporter.close();

        return this;
    }


    public Element getFlowElement(Flow flow, PdfContentByte canvas) {
        Element element = null;
        if(flow.getName().equals(Flow.TITLE_FLOW)){
            TitleFlowData titleFlowData = (TitleFlowData)flow.getElement();

            /// get font from definition
            Font titleFont = fonts.get(titleFlowData.getFormatName());

            Paragraph pageHint = new Paragraph(titleFlowData.getContent(), titleFont);
            int alignment = FlowElement.getAlignment(titleFlowData.getAlignment());
            pageHint.setAlignment(alignment);

            element = pageHint;
        }else if(flow.getName().equals(Flow.SEPARATOR_FLOW)){
            SeparatorFlowData separatorFlowData = (SeparatorFlowData) flow.getElement();

            BorderDefinition borderDefinition = borders.get(separatorFlowData.getFormatName());
            DottedLineSeparator dottedLineSeparator = new DottedLineSeparator();
            if(borderDefinition.getWidth()>0) {
                dottedLineSeparator.setLineWidth(borderDefinition.getWidth());
            }
            if(borderDefinition.getColor()!=null){
                dottedLineSeparator.setLineColor(BorderDefinition.getColor(borderDefinition.getColor()));
            }

            element = dottedLineSeparator;

        }else if(flow.getName().equals(Flow.QRCODE_FLOW)){
            //TODO,
            throw new NotImplementedException();

        }else if(flow.getName().equals(Flow.TABLE_FLOW)){

            TableFlowData flowData = (TableFlowData)flow.getElement();

            TableFlowBuilder builder = new TableFlowBuilder();

            if(flowData.getLayout().getNumColumns()>0) {
                builder.numColumns(flowData.getLayout().getNumColumns());
            }else{
                builder.columnWidths(flowData.getLayout().getColumnWidths());
            }
            // set header
            if(flowData.getFormat() != null) {
                if(flowData.getFormat().getHeader()!=null) {
                    RowFormat header =flowData.getFormat().getHeader();
                    if(header.getHeight()>0) {
                        builder.header().headerHeight(header.getHeight());
                    }
                    builder.header().headerFormat(this.fonts.get(header.getFormatName()));
                    // header
                    builder.header().headerTitle(flowData.getHeader());
                }
                // set first row
                if(flowData.getFormat().getFirstRowFormat()!=null) {
                    RowFormat firstRowFormat =flowData.getFormat().getFirstRowFormat();
                    if(firstRowFormat.getHeight()>0) {
                        builder.firstRow().firstRowHeight(firstRowFormat.getHeight());
                    }
                    builder.firstRow().firstRowFormat(this.fonts.get(firstRowFormat.getFormatName()));
                }
                // set row
                if(flowData.getFormat().getRowFormat()!=null) {
                    RowFormat rowFormat =flowData.getFormat().getRowFormat();
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));
                    if(rowFormat.getHeight()>0) {
                        builder.row().rowHeight(rowFormat.getHeight());
                    }
                    // rows()
                    builder.rows(flowData.getData());
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));

                }

                // set border
                if(flowData.getBorderFormat() != null) {
                    TableFlowData.TableBorderFormat borderFormat = flowData.getBorderFormat();
                    if(borderFormat.getStyle() != null) {
                        builder.borderStyle(borderFormat.getStyle());
                    }
                    if(borderFormat.getWidth() != null) {
                        builder.borderWidth(borderFormat.getWidth());
                    }
                }

            }

            TableFlow tableFlow = builder.build();
            tableFlow.draw(canvas);

            // append table to document
            element = tableFlow.getElement();

        }else if(flow.getName().equals(Flow.LAYOUT_FLOW)){

        } else if(flow.getName().equals(Flow.CONTENT_FLOW)) {

            ContentFlowData flowData = (ContentFlowData)flow.getElement();

            ContentFlowBuilder builder = new ContentFlowBuilder();
            builder.title();
            builder.columnWidths(flowData.getLayout().getColumnWidths());

            // set format
            if(flowData.getFormat() != null) {
                // set row
                RowFormat rowFormat =flowData.getFormat();
                builder.contentFormat(this.fonts.get(rowFormat.getFormatName()));
                if(rowFormat.getHeight()>0) {
                    builder.contentHeight(rowFormat.getHeight());
                }
                // rows()
                builder.titles(flowData.getTitle());
                builder.lines(flowData.getData());
            }
            TableFlow tableFlow = builder.build();
            tableFlow.draw(canvas);

            // append table to document
            element = tableFlow.getElement();
        } else if (flow.getName().equals(Flow.LINEAR_FLOW)) {

        } else if(flow.getName().equals("newLine")) {
            element = Chunk.NEWLINE;
        }
        return element;
    }


    /**
     * only for debug
     * @param io
     * @return
     */
    @Deprecated
    public PdfPrintingFlowUtil export(String io) throws FileNotFoundException, DocumentException{
        export(new FileOutputStream(io));
        return this;
    }

    public PdfPrintingFlowUtil data(PdfFlowRequest request) throws FileNotFoundException, DocumentException{
        this.page = request.getPage();
        this.flows = request.getFlows();

        // init fonts definitions
        if(request.getDefinitions()!=null){

            /// init font definitions
            if(request.getDefinitions().getFonts()!=null) {
                if (fonts == null) {
                    fonts = new HashMap<>();
                }

                for (Map.Entry<String, FontDefinition> entry : request.getDefinitions().getFonts().entrySet()) {
                    FontDefinition fontDefinition = entry.getValue();
                    fonts.put(entry.getKey(), FontDefinition.getFont(fontDefinition));
                }
            }

            // init border definitions
            if(request.getDefinitions().getBorders()!=null) {
                if (borders == null) {
                    borders = new HashMap<>();
                }
                borders = request.getDefinitions().getBorders();
            }
        }
        return this;
    }
}
