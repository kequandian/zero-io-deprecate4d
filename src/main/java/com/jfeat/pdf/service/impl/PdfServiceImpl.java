package com.jfeat.pdf.service.impl;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.jfeat.pdf.print.PdfFlowRequest;
import com.jfeat.pdf.print.PdfPrintingFlowUtil;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.util.Fonts;
import com.jfeat.pdf.service.PdfService;
import com.jfeat.pdf.service.PdfStatisticsMetaService;
import com.jfeat.pdf.util.PdfUtil;
import com.jfeat.poi.service.IOStatisticsMetaService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created on 2020/1/3.
 *
 * @author Wen Hao
 */
@Service
public class PdfServiceImpl implements PdfService {

    @Resource
    PdfStatisticsMetaService pdfStatisticsMetaService;

    @Resource
    IOStatisticsMetaService ioStatisticsMetaService;

    @Override
    public ByteArrayInputStream exportPdfFile(String field, Map<String, String[]> requestParameter) {

        PdfFlowRequest data = new PdfFlowRequest();
        /// 设置页面
        data.setDefinitions(new PdfFlowRequest.Definitions(new HashMap<>(), new HashMap<>()));
        data.setPage(new PdfFlowRequest.Page("A4", 20));

        /// 设置定义
        Map<String, FontDefinition> fontDefs = data.getDefinitions().getFonts();
        Map<String, BorderDefinition> borderDefs = data.getDefinitions().getBorders();
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
         * Table
         **/
        String sql = ioStatisticsMetaService.getSqlByField(field, requestParameter);

        List<String> tableColumns = pdfStatisticsMetaService.getTableColumns(sql);
        List<String> tableData = pdfStatisticsMetaService.getTableData(sql);

        List<String> dataList = new ArrayList<>();
        dataList.addAll(tableColumns);
        dataList.addAll(tableData);

        PdfFlowRequest.Layout layout = new PdfFlowRequest.Layout();
        layout.setNumColumns(tableColumns.size());

        PdfFlowRequest.TableFlowData tableFlowData = PdfFlowRequest.TableFlowData.build()
                .rowFormat("default", 60)
                .firstRowFormat("table-firstrow", 40/*, BaseColor.GRAY*/)
                .data(dataList.toArray(String[]::new))
                .layout(layout);

        // 打印
        PdfUtil util = new PdfUtil();
        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        try {
            util.request(data);
            util.flow(tableFlowData.flow());
            util.export(baos);
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        }

        return new ByteArrayInputStream(baos.toByteArray());
    }
}
