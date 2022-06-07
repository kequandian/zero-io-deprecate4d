package com.jfeat.pdf.print.report;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.jfeat.pdf.print.base.FlowReport;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.base.RowLayout;
import com.jfeat.pdf.print.report.reports.HeaderFlowReport;
import com.jfeat.pdf.print.report.reports.HeaderFlowReportBuilder;
import com.jfeat.pdf.print.report.request.*;
import com.jfeat.pdf.print.util.PageUtil;
import com.jfeat.pdf.print.util.PdfDocumentUtil;

import java.io.*;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class FlowReportUtil{

    /**
     * PDF模板文件, 输出内容合并到模板上面
     */
    String template;
    public FlowReportUtil template(String templateFile){
        this.template = templateFile;
        return this;
    }

    /**
     * 通过 FlowReportRequest 构建导出数据
     */
    FlowReport flowReport;

    /**
     * 通过请求数据转换为打印数据类
     * @param request
     * @return
     */
    public FlowReportUtil data(FlowReportRequest request){

        RowLayout headerLayout = request.getLayout().getHeader();
        RelativeRowFormatRequest headerFormat = request.getRowFormat().getHeader();

        RowLayout rowsLayout = request.getLayout().getRows();
        RowFormatRequest rowsFormat = request.getRowFormat().getRows();


        /// get alignment
        int headerTitleAlignment = Element.ALIGN_BASELINE;
        int rowsTitleAlignment = Element.ALIGN_BASELINE;
        {
            String LEFT = new Definitions().getTitleAlignments()[1];

            if(headerFormat==null || LEFT.compareTo(headerFormat.getTitleAlignment())==0){
                headerTitleAlignment = Element.ALIGN_LEFT;
            }

            if (rowsFormat==null || LEFT.compareTo(rowsFormat.getTitleAlignment()) == 0) {
                rowsTitleAlignment = Element.ALIGN_LEFT;
            }
        }

        HeaderFlowReportBuilder builder = new HeaderFlowReportBuilder()
                // report
                .columns(request.getColumns())
                .flowDirection(FlowReportRequest.getFlowDirection(request.getFlowDirection()))
                .rowOption(request.getRowOption())
                .rowsMargin(request.getRowsMarginLeft(),request.getRowsMarginTop(),request.getRowsMarginRight(),request.getRowsMarginBottom())
                .borderWidth(request.getBorderWidth())
                .borderColor(FontDefinition.getBaseColor(request.getBorderColor()))
                .headerHeight(headerLayout.getHeight())
                .rowHeight(rowsLayout.getHeight())
                .headerPadding(headerLayout.getPaddingLeft(),headerLayout.getPaddingRight(),headerLayout.getPaddingTop(),headerLayout.getPaddingBottom())
                .headerBorderWidth(headerLayout.getBorderLeft(),headerLayout.getBorderRight(),headerLayout.getBorderTop(),headerLayout.getBorderBottom())
                .headerBorderColor(headerLayout.getBorderColorRed(),headerLayout.getBorderColorGreen(),headerLayout.getBorderColorBlue())
                .rowPadding(rowsLayout.getPaddingLeft(),rowsLayout.getPaddingRight(),rowsLayout.getPaddingTop(),rowsLayout.getPaddingBottom())
                .rowBorderWidth(rowsLayout.getBorderLeft(),rowsLayout.getBorderRight(),rowsLayout.getBorderTop(),rowsLayout.getBorderBottom())
                .rowBorderColor(rowsLayout.getBorderColorRed(),rowsLayout.getBorderColorGreen(),rowsLayout.getBorderColorBlue())
                // fonts
                .headerFonts(
                                FontDefinition.getFont(headerFormat.getTitle()),
                                FontDefinition.getFont(headerFormat.getSubtitle()),
                                FontDefinition.getFont(headerFormat.getHint()),
                                FontDefinition.getFont(headerFormat.getValue()))
                .rowFonts(
                                FontDefinition.getFont(rowsFormat.getTitle()),
                                FontDefinition.getFont(rowsFormat.getSubtitle()),
                                FontDefinition.getFont(rowsFormat.getHint()),
                                FontDefinition.getFont(rowsFormat.getValue()))
                .groupFormat(FontDefinition.getFont(groupFormat!=null?groupFormat.getGroup():null),
                             FontDefinition.getBaseColor(request.getFormat().getGroups()!=null?request.getFormat().getGroups().getBackgroundColor():null))
                .headerSpacing(headerFormat.getTitleSpacing(),
                        headerFormat.getTitleIndent(),
                        headerTitleAlignment
                        )
                .rowSpacing(rowsFormat.getTitleSpacing(),
                        rowsFormat.getTitleIndent(),
                        rowsTitleAlignment
                        )

                // data
                .headerData(request.getHeaderData())
                .rowData(request.getRowsData())
        ;


        return this;
    }


    public void export(OutputStream outputStream, float marginLeft, float marginRight, float marginTop, float marginBottom) throws IOException, DocumentException {

        /// offset border
        if (flowReport.getBorderWidth() > 0) {
            float offset = flowReport.getBorderWidth() * 0.5f;
            marginLeft += offset;
            marginRight += offset;
        }

        try {
            if (this.template == null || !new File(template).exists()) {

                PdfDocumentUtil.writeDocument(new PdfDocumentUtil.PdfWriteListener() {
                    @Override
                    public void onDraw(PdfContentByte canvas) {
                        /// calc rows
                        {
                            Rectangle pageSize = document.getPageSize();
                            Rectangle contentSize = PageUtil.getContentSize(pageSize, marginLeft, marginRight, marginTop, marginBottom);

                            flowReport.flowDirection(flowReport.getFlowDirection());
                            flowReport.flowHeight(contentSize.getHeight());
                        }

                        HeaderFlowReport reporter = flowReport.build();
                        reporter.draw(canvas);

                    }
                }, outputStream, marginLeft, marginRight, marginTop, marginBottom);

            } else {

                PdfDocumentUtil.writeDocument(new PdfDocumentUtil.PdfWriteListener() {
                    @Override
                    public void onDraw(PdfContentByte canvas) {
                        HeaderFlowReport reporter = flowReport.build();
                        reporter.draw(canvas);
                    }
                }, outputStream, template);

            }

        } catch (IOException e) {
            throw new RuntimeException(e.getMessage());
        }
    }

    public void export(OutputStream outputStream) throws IOException, DocumentException{
        this.export(outputStream, 0);
    }

    public void export(OutputStream outputStream, float margin) throws IOException, DocumentException{
        this.export(outputStream, margin, margin, margin, margin);
    }

    @Deprecated
    public void export(String pdfFilePath) throws IOException, DocumentException{
        this.export(pdfFilePath, 0);
    }

    @Deprecated
    public void export(String pdfFilePath, float margin) throws IOException, DocumentException{
        this.export(pdfFilePath, margin, margin, margin, margin);
    }

    @Deprecated
    public void export(String filePath, float marginLeft, float marginRight, float marginTop, float marginBottom) throws IOException, DocumentException {
        export(new FileOutputStream(filePath), marginLeft, marginRight, marginTop, marginBottom);
    }

    public static void main(String[] args) throws Exception{
        FlowReportRequest request = new FlowReportRequest()
                .setColumns(3)
                .setRowOption(ImageBox.ID)
                .setLayout(new FlowReportRequest.LayoutRequest());

        request.initRowsData("./images");

         new FlowReportUtil()
                .data(request)
                .export(new FileOutputStream("test.pdf"), 0,0,0,0);
    }
}
