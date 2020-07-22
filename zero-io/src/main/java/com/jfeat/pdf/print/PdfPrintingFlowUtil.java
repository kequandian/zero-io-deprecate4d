package com.jfeat.pdf.print;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.draw.DottedLineSeparator;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.element.FlowLayout;
import com.jfeat.pdf.print.flow.BarCodes;
import com.jfeat.pdf.print.flow.ContentFlowBuilder;
import com.jfeat.pdf.print.flow.TableFlow;
import com.jfeat.pdf.print.flow.TableFlowBuilder;
import com.jfeat.pdf.print.util.Fonts;
import com.jfeat.pdf.print.util.ImageUtil;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.jfeat.pdf.print.PdfFlowRequest.*;

// import sun.reflect.generics.reflectiveObjects.NotImplementedException;

/**
 * Created by vincent on 2018/10/8.
 */
public class PdfPrintingFlowUtil {

    /**
     * 测试
     * @param args
     */
    public static void main(String[] args) throws IOException, DocumentException {
        PdfFlowRequest data = new PdfFlowRequest();
        /// 设置页面
        data.setDefinitions(new Definitions(new HashMap<>(), new HashMap<>()));
        data.setPage(new Page("A4", 20));

        /// 设置定义
        Map<String,FontDefinition> fontDefs = data.getDefinitions().getFonts();
        Map<String,BorderDefinition> borderDefs = data.getDefinitions().getBorders();
        fontDefs.put("title", new FontDefinition(Fonts.Definition.BASE.toString(), 16, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("table-header", new FontDefinition(Fonts.Definition.SONG.toString(), 14, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-firstrow", new FontDefinition(Fonts.Definition.SONG.toString(), 12, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-row", new FontDefinition(Fonts.Definition.BASE.toString(), 10, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("default", new FontDefinition(Fonts.Definition.BASE.toString(), 9, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("qrcode", new FontDefinition(Fonts.Definition.HELVETICA.toString(), 9, FontDefinition.NORMAL, ColorDefinition.BLACK));
        // border
        borderDefs.put("table-border", new BorderDefinition(null, 2, ColorDefinition.BLACK));
        borderDefs.put("line", new BorderDefinition(BorderDefinition.TOP, 2, ColorDefinition.BLACK));
        borderDefs.put("right", new BorderDefinition(BorderDefinition.RIGHT, 10, ColorDefinition.BLACK));

        /**
         * 主要设置内容
         */
        data.setFlows(new ArrayList<>());
        List<Flow> flows = data.getFlows();

        /**
         * Title
         **/
        flows.add(new TitleFlowData("采购订单", "title", FlowElement.ALIGN_CENTER).flow());

        /**
         * New Line
         **/
        flows.add(new Flow(Flow.NEW_LINE));

        flows.add(new Flow(Flow.SEPARATOR_FLOW));

        /**
         * Content
         * */
        String[] title = {"甲方:", "乙方", "交货"};
        // String[] lines = {"择阿迪达斯官方网店", "择阿迪达斯官方网店", "择阿迪达斯官方网店"};
        String[] lines = {"择阿迪达斯官方网店", "择阿迪达斯官方网店", null};
        ContentFlowData contentFlowData = ContentFlowData.build()
                                            .setLayout(new float[]{1, 3})
                                            .setTitle(title)
                                            .setData(lines)
                                            .rowFormat("default", 25);

        /**
         * QRCode AND LinearFlowData
         **/
        LinearFlowData qrcodeStack = LinearFlowData.build()
                .setLayout(new float[]{1.0f})
                .add(new QRCodeFlowData("P13224242", "qrcode").flow())
                .add(new QRCodeFlowData("P13224242", "qrcode").flow());

        LinearFlowData wrapper = new LinearFlowData(new float[]{3, 2});
        wrapper.add(contentFlowData.flow());
        wrapper.add(qrcodeStack.flow());
        flows.add(wrapper.flow());

        // flows.add(contentFlowData.flow());
        // flows.add(qrcodeStack.flow());

        /**
         * Table
         **/
        String[] datas = {"行号", "物料编号", "物料名称", "材料及规格备注:", "单位", "单价", "数量", "金额", "交货日期", "备注",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "ss",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
                "10", "A456456456412", "【狂疯价】adidas 阿迪达斯 三叶草", "材质:", "件", "10", "10", "100.00", "2018-11-9", "",
        };
        TableFlowData tableFlowData = TableFlowData.build()
                                .headerFormat("table-header", 30, new BaseColor(219, 219, 219))
                                .rowFormat("default", 60)
                                .firstRowFormat("table-firstrow", 60, BaseColor.GRAY)
                                .data(datas)
                                .setHeader("Header Test")
                                .layout(new float[]{2, 4, 5, 4, 2, 2, 2, 3, 3, 3 });
        flows.add(tableFlowData.flow());

        TableFlowData sumTableFlowData = TableFlowData.build()
                .rowFormat("default", 30)
                .data(new String[]{"合计", "1125.00", "22.00"})
                .layout(new float[]{19, 2, 3, 3, 3 });
        flows.add(sumTableFlowData.flow());

        /**
         * new page
         **/
        flows.add(new Flow(Flow.NEW_PAGE));

        flows.add(new Flow(Flow.SEPARATOR_FLOW));
        flows.add(new TitleFlowData("分页测试", "title", FlowElement.ALIGN_CENTER).flow());
        // 插入图片
        flows.add(new ImageFlowData(ImageUtil.getBytes("test.png")).flow());

        // 打印
        PdfPrintingFlowUtil util = new PdfPrintingFlowUtil();
        util.data(data);
        util.export("out2.pdf");

        //  写入模板
        // TextFile.write("src/test/origin.json", JSONObject.toJSONString(data, SerializerFeature.DisableCircularReferenceDetect));
    }

    private Page page;
    private List<Flow> flows;

    private Map<String, Font> fonts;
    private Map<String, BorderDefinition> borders;

    public PdfPrintingFlowUtil(){}

    public PdfPrintingFlowUtil export(OutputStream io) throws DocumentException{
        PdfExporter exporter = new PdfExporter();

        PdfExporter export = exporter.export(io,
                page.getPageSize(),
                page.getMarginLeft(), page.getMarginRight(),
                page.getMarginTop(), page.getMarginBottom()
        );
        PdfContentByte canvas = export.canvas();

        String imageUrl = page.getImageUrl();
        if (imageUrl != null) {
            PdfContentByte backCanvas = export.backCanvas();
            Image image = null;
            try {
                image = Image.getInstance(imageUrl);
            } catch (IOException e) {
                e.printStackTrace();
            }
            image.scaleAbsolute(page.getPageSize());
            image.setAbsolutePosition(0, 0);
            backCanvas.addImage(image);
        }


        for(Flow flow : flows){
           if (flow.getName().equals(Flow.LINEAR_FLOW)) {
               LinearFlowData flowData = (LinearFlowData)flow.getElement();
                FlowLayout wrapLayout = new FlowLayout(flowData.getLayout().getColumnWidths());
                for(Flow element : flowData.getElements()) {

                    /**
                     * 流式布局中允许嵌套一层单列的流式布局, 且只允许嵌套一列的
                     **/
                    if (Flow.LINEAR_FLOW.equals(element.getName())) {
                        LinearFlowData columnDatas = (LinearFlowData) element.getElement();
                        if (columnDatas.getLayout().getColumnWidths().length == 1) {
                            FlowLayout columnWrapper = new FlowLayout(1);
                            for (Flow columnData : columnDatas.getElements()) {
                                columnWrapper.add((PdfPTable) getFlowElement(columnData, canvas));
                            }
                            wrapLayout.add(columnWrapper);
                            continue;
                        }
                        throw new UnsupportedOperationException();
                    }

                    Element innerElement = getFlowElement(element, canvas);
                    if (innerElement instanceof Image) {
                        wrapLayout.add((Image)innerElement);
                    } else {
                        wrapLayout.add((PdfPTable) innerElement);
                    }
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
        } else if(flow.getName().equals(Flow.QRCODE_FLOW)){
            QRCodeFlowData flowData = (QRCodeFlowData) flow.getElement();

            FlowLayout qrCodeLayout = new FlowLayout(1);
            qrCodeLayout.add(BarCodes.createBarCode39(canvas, flowData.getCode(), true));
            qrCodeLayout.add(new Phrase(flowData.getCode(), this.fonts.get(flowData.getFormatName())));
            element = qrCodeLayout;
        }else if(flow.getName().equals(Flow.TABLE_FLOW)) {

            TableFlowData flowData = (TableFlowData) flow.getElement();

            TableFlowBuilder builder = new TableFlowBuilder();

            if (flowData.getLayout().getNumColumns() > 0) {
                builder.numColumns(flowData.getLayout().getNumColumns());
            } else {
                builder.columnWidths(flowData.getLayout().getColumnWidths());
            }
            // set header
            if (flowData.getFormat() != null) {
                if (flowData.getFormat().getHeader() != null) {
                    RowFormat header = flowData.getFormat().getHeader();
                    if (header.getColor() != null) {
                        builder.header().headerColor(header.getColor());
                    }
                    if (header.getHeight() > 0) {
                        builder.header().headerHeight(header.getHeight());
                    }
                    builder.header().headerFormat(this.fonts.get(header.getFormatName()));
                    // header
                    builder.header().headerTitle(flowData.getHeader());
                }

                // set first row
                if (flowData.getFormat().getFirstRowFormat() != null) {
                    RowFormat firstRowFormat = flowData.getFormat().getFirstRowFormat();
                    if (firstRowFormat.getHeight() > 0) {
                        builder.firstRow().firstRowHeight(firstRowFormat.getHeight());
                    }
                    if (firstRowFormat.getColor() != null) {
                        builder.firstRow().firstRowColor(firstRowFormat.getColor());
                    }
                    builder.firstRow().firstRowFormat(this.fonts.get(firstRowFormat.getFormatName()));
                }
                // set row
                if (flowData.getFormat().getRowFormat() != null) {
                    RowFormat rowFormat = flowData.getFormat().getRowFormat();
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));
                    if (rowFormat.getHeight() > 0) {
                        builder.row().rowHeight(rowFormat.getHeight());
                    }
                    if (rowFormat.getColor() != null) {
                        builder.row().rowColor(rowFormat.getColor());
                    }
                    // rows()
                    builder.rows(flowData.getData());
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));

                }

                // set border
                if (flowData.getBorderFormat() != null) {
                    TableFlowData.TableBorderFormat borderFormat = flowData.getBorderFormat();
                    if (borderFormat.getStyle() != null) {
                        builder.borderStyle(borderFormat.getStyle());
                    }
                    if (borderFormat.getWidth() != null) {
                        builder.borderWidth(borderFormat.getWidth());
                    }
                }
            }

            TableFlow tableFlow = builder.build();
            tableFlow.draw(canvas);

            // append table to document
            element = tableFlow.getElement();
        } else if (flow.getName().equals(Flow.RECTANGLE_FLOW)) {
            RectangleFlowData flowData = (RectangleFlowData) flow.getElement();
            Float width = flowData.getWidth();
            Float height = flowData.getHeight();
            BaseColor baseColor = com.jfeat.pdf.print.simple.base.ColorDefinition.getBaseColor(flowData.getColor());

            PdfPTable rect = new PdfPTable(1);
            rect.setSpacingAfter(2);
            rect.setSpacingBefore(2);
            if (width != null) {
                rect.setLockedWidth(true);
                rect.setTotalWidth(width);
            }
            PdfPCell cell = new PdfPCell();
            cell.setFixedHeight(height);
            cell.setBorderWidth(0);
            cell.setBackgroundColor(baseColor);
            rect.addCell(cell);
            element = rect;
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
                builder.align(flowData.getAlign());
            }
            TableFlow tableFlow = builder.build();
            tableFlow.draw(canvas);

            // append table to document
            element = tableFlow.getElement();
        } else if (flow.getName().equals(Flow.LINEAR_FLOW)) {

        } else if(flow.getName().equals(Flow.NEW_LINE)) {
            element = Chunk.NEWLINE;
        } else if(flow.getName().equals(Flow.NEW_PAGE)) {
            element = Chunk.NEXTPAGE;
        } else if(flow.getName().equals(Flow.SEPARATOR_FLOW)){
            DottedLineSeparator dottedLineSeparator = new DottedLineSeparator();
            element = dottedLineSeparator;
        } else if(flow.getName().equals(Flow.IMAGE_FLOW)) {
            ImageFlowData imageFlowData = (ImageFlowData) flow.getElement();
            String url = imageFlowData.getUrl();
            byte[] data = imageFlowData.getData();
            float height = imageFlowData.getHeight();
            float width = imageFlowData.getWidth();
            Image image = null;
            try {
                if (url != null) {
                    image = Image.getInstance(url);
                    image.scaleAbsolute(width, height);
                } else if (data != null) {
                    image = Image.getInstance(data);
                    image.scaleAbsolute(width, height);
                }
            } catch (IOException | BadElementException e) {
                e.printStackTrace();
            }

            element = image;
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
