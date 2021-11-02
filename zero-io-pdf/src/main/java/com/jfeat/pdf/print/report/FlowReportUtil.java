package com.jfeat.pdf.print.report;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.report.builder.FlowReportBuilder;
import com.jfeat.pdf.print.report.builder.RowLayout;
import com.jfeat.pdf.print.report.reports.HeaderFlowReport;
import com.jfeat.pdf.print.report.request.Definitions;
import com.jfeat.pdf.print.report.request.FlowReportRequest;
import com.jfeat.pdf.print.report.request.GroupFormatRequest;
import com.jfeat.pdf.print.report.request.RowFormatRequest;
import com.jfeat.pdf.print.util.PageUtil;

import java.io.*;

/**
 * Created by vincenthuang on 22/03/2018.
 */
public class FlowReportUtil{

    FlowReportBuilder builder;

    /**
     * 输出模板文件
     */
    String template;

    public FlowReportUtil data(FlowReportRequest request){

        RowLayout headerLayout = request.getLayout().getHeader();
        RowFormatRequest headerFormat = request.getFormat().getHeader();

        RowLayout rowsLayout = request.getLayout().getRows();
        RowFormatRequest rowsFormat = request.getFormat().getRows();

        GroupFormatRequest groupFormat = request.getFormat().getGroups();


        /// get alignment
        int headerTitleAlignment = Element.ALIGN_BASELINE;
        int rowsTitleAlignment = Element.ALIGN_BASELINE;
        {
            String LEFT = new Definitions().getTitleAlignments()[1];

            if(LEFT.compareTo(headerFormat.getTitleAlignment())==0){
                headerTitleAlignment = Element.ALIGN_LEFT;
            }

            if (LEFT.compareTo(rowsFormat.getTitleAlignment()) == 0) {
                rowsTitleAlignment = Element.ALIGN_LEFT;
            }
        }

        builder = new FlowReportBuilder()
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
                .headerData(request.getHeader())
                .rowData(request.getRows())
        ;


        return this;
    }

    public FlowReportUtil template(String templateFile){
        this.template = templateFile;
        return this;
    }

    public void export(OutputStream outputStream) throws DocumentException{
        this.export(outputStream, 0);
    }

    public void export(OutputStream outputStream, float margin) throws  DocumentException{
        this.export(outputStream, margin, margin, margin, margin);
    }

    public void export(OutputStream outputStream, float marginLeft, float marginRight, float marginTop, float marginBottom) throws DocumentException{

        /// offset border
        if(builder.getBorderWidth()>0){
            float offset = builder.getBorderWidth() * 0.5f;
            marginLeft += offset;
            marginRight += offset;
        }

        if(this.template==null) {
            /// 没有模板，新建文档

            Document document = new Document(PageSize.A4);
            document.setMargins(marginLeft, marginRight, marginTop, marginBottom);

            /// calc rows
            {
                Rectangle pageSize = document.getPageSize();
                Rectangle contentSize = PageUtil.getContentSize(pageSize, marginLeft, marginRight, marginTop, marginBottom);

                builder.flowDirection(builder.getFlowDirection());
                builder.flowHeight(contentSize.getHeight());
            }

            PdfWriter writer = PdfWriter.getInstance(document, outputStream);
            document.open();

            PdfContentByte canvas = writer.getDirectContent();

            HeaderFlowReport reporter = builder.build();
            reporter.draw(canvas);

            document.close();

        }else{

            if(new File(template).exists()) {
                try {

                    PdfReader pdfReader = new PdfReader(this.template);

                    // 修改pdf
                    PdfStamper pdfStamper = new PdfStamper(pdfReader, outputStream);

                    /// draw
                    PdfContentByte canvas = pdfStamper.getOverContent(1);
                    HeaderFlowReport reporter = builder.build();
                    reporter.draw(canvas);
                    // end draw

                    // 如果为false那么生成的PDF文件还能编辑，一定要设为true
                    pdfStamper.setFormFlattening(true);

                    pdfStamper.close();
                    pdfReader.close();

                }catch (IOException e){
                    throw new RuntimeException(e.getMessage());
                }

            }else{
                throw new RuntimeException("BadRequest: invalid template ! file not exits:" + this.template);
            }
        }
    }

    @Deprecated
    public void export(String pdfFilePath) throws FileNotFoundException, DocumentException{
        this.export(pdfFilePath, 0);
    }

    @Deprecated
    public void export(String pdfFilePath, float margin) throws FileNotFoundException, DocumentException{
        this.export(pdfFilePath, margin, margin, margin, margin);
    }

    @Deprecated
    public void export(String filePath, float marginLeft, float marginRight, float marginTop, float marginBottom) throws FileNotFoundException, DocumentException {
        export(new FileOutputStream(filePath), marginLeft, marginRight, marginTop, marginBottom);
    }

    public static void main(String[] args) throws Exception{

        FlowReportRequest request = new FlowReportRequest();

         new FlowReportUtil()
                .data(request)
                .export(new FileOutputStream("test.pdf"), 0,0,0,0);
    }
}
