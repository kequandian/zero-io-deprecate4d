package com.jfeat.pdf.util;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Font;
import com.itextpdf.text.pdf.PdfContentByte;
import com.jfeat.pdf.print.PdfExporter;
import com.jfeat.pdf.print.PdfFlowRequest;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.flow.TableFlow;
import com.jfeat.pdf.print.flow.TableFlowBuilder;

import java.io.FileNotFoundException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * Created on 2020/1/13.
 *
 * @author Wen Hao
 */
public class PdfUtil {

    private PdfFlowRequest.Page page;
    private PdfFlowRequest.Flow flow;
    private Map<String, Font> fonts;
    private Map<String, BorderDefinition> borders;

    public PdfUtil(){}

    public PdfUtil export(OutputStream io) throws DocumentException {
        PdfExporter exporter = new PdfExporter();

        PdfContentByte canvas = exporter.export(io,
                page.getPageSize(),
                page.getMarginLeft(), page.getMarginRight(),
                page.getMarginTop(), page.getMarginBottom()
        ).canvas();


        if (flow.getName().equals(PdfFlowRequest.Flow.TABLE_FLOW)) {

            PdfFlowRequest.TableFlowData flowData = (PdfFlowRequest.TableFlowData)flow.getElement();

            TableFlowBuilder builder = new TableFlowBuilder();

            if(flowData.getLayout().getNumColumns()>0) {
                builder.numColumns(flowData.getLayout().getNumColumns());
            }else{
                builder.columnWidths(flowData.getLayout().getColumnWidths());
            }
            // set header
            if(flowData.getFormat() != null) {
                if(flowData.getFormat().getHeader()!=null) {
                    PdfFlowRequest.RowFormat header =flowData.getFormat().getHeader();
                    if(header.getColor() != null) {
                        builder.header().headerColor(header.getColor());
                    }
                    if(header.getHeight()> 0) {
                        builder.header().headerHeight(header.getHeight());
                    }
                    builder.header().headerFormat(this.fonts.get(header.getFormatName()));
                    // header
                    builder.header().headerTitle(flowData.getHeader());
                }

                // set first row
                if(flowData.getFormat().getFirstRowFormat()!=null) {
                    PdfFlowRequest.RowFormat firstRowFormat =flowData.getFormat().getFirstRowFormat();
                    if(firstRowFormat.getHeight()>0) {
                        builder.firstRow().firstRowHeight(firstRowFormat.getHeight());
                    }
                    if(firstRowFormat.getColor() != null) {
                        builder.firstRow().firstRowColor(firstRowFormat.getColor());
                    }
                    builder.firstRow().firstRowFormat(this.fonts.get(firstRowFormat.getFormatName()));
                }
                // set row
                if(flowData.getFormat().getRowFormat()!=null) {
                    PdfFlowRequest.RowFormat rowFormat =flowData.getFormat().getRowFormat();
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));
                    if(rowFormat.getHeight()>0) {
                        builder.row().rowHeight(rowFormat.getHeight());
                    }
                    if(rowFormat.getColor() != null) {
                        builder.row().rowColor(rowFormat.getColor());
                    }
                    // rows()
                    builder.rows(flowData.getData());
                    builder.row().rowFormat(this.fonts.get(rowFormat.getFormatName()));

                }

                // set border
                if(flowData.getBorderFormat() != null) {
                    PdfFlowRequest.TableFlowData.TableBorderFormat borderFormat = flowData.getBorderFormat();
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
            exporter.addElement(tableFlow.getElement());
        }

        exporter.close();
        return this;
    }

    public PdfUtil request(PdfFlowRequest request) throws FileNotFoundException, DocumentException{
        this.page = request.getPage();

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

    public void flow(PdfFlowRequest.Flow flow) {
        this.flow = flow;
    }
}
