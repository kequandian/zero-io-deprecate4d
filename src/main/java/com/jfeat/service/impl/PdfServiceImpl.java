package com.jfeat.service.impl;

import com.itextpdf.text.BaseColor;
import com.itextpdf.text.DocumentException;
import com.jfeat.model.PdfData;
import com.jfeat.pdf.print.PdfFlowRequest;
import com.jfeat.pdf.print.PdfPrintingFlowUtil;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.util.Fonts;
import com.jfeat.service.PdfService;
import org.springframework.stereotype.Service;

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


    @Override
    public ByteArrayInputStream exportPdfFile(PdfData pdfData) throws FileNotFoundException, DocumentException {

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
         * 主要设置内容
         */
        data.setFlows(new ArrayList<>());
        List<PdfFlowRequest.Flow> flows = data.getFlows();

        /**
         * Title
         **/
        flows.add(new PdfFlowRequest.TitleFlowData("采购订单", "title", PdfFlowRequest.FlowElement.ALIGN_CENTER).flow());

        /**
         * New Line
         **/
        flows.add(new PdfFlowRequest.Flow(PdfFlowRequest.Flow.NEW_LINE));

        /**
         * Content
         * */
        String[] title = {"甲方:", "乙方", "交货"};
        String[] lines = {"择阿迪达斯官方网店", "择阿迪达斯官方网店", "择阿迪达斯官方网店"};
        PdfFlowRequest.ContentFlowData contentFlowData = PdfFlowRequest.ContentFlowData.build()
                .setLayout(new float[]{1, 4})
                .setTitle(title)
                .setData(lines)
                .rowFormat("default", 25);

        /**
         * QRCode AND LinearFlowData
         **/
        PdfFlowRequest.LinearFlowData qrcodeStack = PdfFlowRequest.LinearFlowData.build()
                .setLayout(new float[]{1.0f})
                .add(new PdfFlowRequest.QRCodeFlowData("P13224242", "qrcode").flow())
                .add(new PdfFlowRequest.QRCodeFlowData("P13224242", "qrcode").flow());

        PdfFlowRequest.LinearFlowData wrapper = new PdfFlowRequest.LinearFlowData(new float[]{3, 2});
        wrapper.add(contentFlowData.flow());
        wrapper.add(qrcodeStack.flow());
        flows.add(wrapper.flow());

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
        PdfFlowRequest.TableFlowData tableFlowData = PdfFlowRequest.TableFlowData.build()
                .headerFormat("table-header", 30, new BaseColor(219, 219, 219))
                .rowFormat("default", 60)
                .firstRowFormat("table-firstrow", 60, BaseColor.GRAY)
                .data(datas)
                .setHeader("Header Test")
                .layout(new float[]{2, 4, 5, 4, 2, 2, 2, 3, 3, 3 });
        flows.add(tableFlowData.flow());

        PdfFlowRequest.TableFlowData sumTableFlowData = PdfFlowRequest.TableFlowData.build()
                .rowFormat("default", 30)
                .data(new String[]{"合计", "1125.00", "22.00"})
                .layout(new float[]{19, 2, 3, 3, 3 });
        flows.add(sumTableFlowData.flow());

        // 打印
        PdfPrintingFlowUtil util = new PdfPrintingFlowUtil();
        util.data(data);

        ByteArrayOutputStream baos = new ByteArrayOutputStream();

        util.export(baos);

        return new ByteArrayInputStream(baos.toByteArray());
    }
}
