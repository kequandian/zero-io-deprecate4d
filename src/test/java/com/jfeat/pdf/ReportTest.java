package com.jfeat.pdf;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.report.FlowReportUtil;
import com.jfeat.pdf.print.report.builder.RowData;
import com.jfeat.pdf.print.report.builder.RowLayout;
import com.jfeat.pdf.print.report.request.FlowReportRequest;
import com.jfeat.pdf.print.report.request.RowFormatRequest;
import com.jfeat.pdf.print.report.row.StackFlowListRow;
import org.junit.Test;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincenthuang on 25/03/2018.
 */
public class ReportTest {
  /*  @Test
    public void testFlowReportRequest()throws Exception{
        String content = new String(Files.readAllBytes(Paths.get("src/main/resources/json/report.json")));
        "".toString();
    }

    @Test
    public void testFlowListReport() throws DocumentException, FileNotFoundException {

        FlowReportRequest request = new FlowReportRequest();
        request.setColumns(2);
        request.setFlowDirection(FlowReportRequest.UTD);
        request.setBorderWidth(2);
        request.setBorderColor(239,239,239);

        /// set format
        FlowReportRequest.FormatRequest format = new FlowReportRequest.FormatRequest();
        format.setHeader(new RowFormatRequest(
                new FontDefinition("宋体", 24, FontDefinition.BOLD, new ColorDefinition(12,30,37)),
                new FontDefinition("宋体", 18, FontDefinition.BOLD, new ColorDefinition(188,188,188)),
                new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(12,30,37)),
                new FontDefinition("宋体", 18, FontDefinition.BOLD, new ColorDefinition(230,8,14))
                )
                .spacing(6)
                .indent(4)
                .alignment("ALIGN_LEFT")
        );
        format.setRows(new RowFormatRequest(
                new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(188,188,188)),
                new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(12,30,37)),
                null,
                new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(230,8,14))
                )
                .spacing(6)
                .indent(4)
        );
        format.setGroups(new FontDefinition("宋体", 20, FontDefinition.BOLD, new ColorDefinition(223,222,230)),
                         new ColorDefinition(98, 96,100));
        request.setFormat(format);

        // set layout
        FlowReportRequest.LayoutRequest layout = new FlowReportRequest.LayoutRequest();
        layout.setHeader(new RowLayout(100, 8));
        layout.setRows(new RowLayout(48, 8));
        request.setLayout(layout);


        /// provide data
        request.setHeader(new RowData("http://icon.url", "追風丸", "沖縄県那覇市久茂の3-15-1工業区", "大楼1F", null,"http://next.url"));
        List<RowData> rows = new ArrayList<>();
        rows.add(new RowData("面条"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        rows.add(new RowData("牛肉拉面", "牛肉ラーメン", null, "44元/743円"));
        request.setRows(rows);

        String jsonString = JSON.toJSONString(request);

        // from json
        JSONObject jsonObject = JSON.parseObject(jsonString);
        FlowReportRequest data = JSON.toJavaObject(jsonObject, FlowReportRequest.class);

        new FlowReportUtil()
                .data(data)
                .export("test.pdf");
    }

    @Test
    public void testStackFlowListReport() throws DocumentException, FileNotFoundException{
        FlowReportRequest request = new FlowReportRequest();
        request.setColumns(5);
        request.setFlowDirection(FlowReportRequest.LTR);
        request.setRowOption(StackFlowListRow.ID);
        request.setRowsMargin(24,24,24,0);

        /// set format
        FlowReportRequest.FormatRequest format = new FlowReportRequest.FormatRequest();
        format.setHeader(new RowFormatRequest(
                        new FontDefinition("宋体", 24, FontDefinition.BOLD, new ColorDefinition(12,30,37)),
                        new FontDefinition("宋体", 18, FontDefinition.BOLD, new ColorDefinition(10,30,37)),
                        new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(10,30,37)),
                        new FontDefinition("宋体", 18, FontDefinition.BOLD, new ColorDefinition(230,8,14))
                )
                .spacing(10)
                .indent(4)
                .alignment("ALIGN_LEFT")
        );
        format.setRows(new RowFormatRequest(
                        new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(188,188,188)),
                        new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(12,30,37)),
                        null,
                        new FontDefinition("宋体", 12, FontDefinition.BOLD, new ColorDefinition(230,8,14))
                )
                        .spacing(6)
                        .indent(4)
        );
        request.setFormat(format);

        // set layout
        FlowReportRequest.LayoutRequest layout = new FlowReportRequest.LayoutRequest();
        layout.setHeader(new RowLayout(120, 8)
                //.setBorderWidth(0,0,0,2)
                .setBorderWidth("0,0,0,2")
                //.setBorderColor(136,166,70)
                .setBorderColor("136,166,70")
        );
        layout.setRows(new RowLayout(140, 8));
        request.setLayout(layout);

        /// provide data
        request.setHeader(new RowData("http://icon.url", "追風丸", "沖縄県那覇市久茂の3-15-1工業区", null, null,"http://next.url"));
        List<RowData> rows = new ArrayList<>();
        rows.add(new RowData("http://icon.url.special","牛肉拉面牛肉拉面牛肉拉面牛肉拉面", null, null, "44元/743円", null));
        rows.add(new RowData("http://icon.url","牛肉拉面", null, null, "44元/743円",null));
        rows.add(new RowData("http://icon.url","牛肉拉面", null, null, "44元/743円",null));
        rows.add(new RowData("http://icon.url","牛肉拉面", null, null, "44元/743円",null));
        rows.add(new RowData("http://icon.url","牛肉拉面", null, null, "44元/743円",null));
        rows.add(new RowData("http://icon.url","牛肉拉面", null, null, "44元/743円",null));
        request.setRows(rows);

        String jsonString = JSON.toJSONString(request);


        *//**
         *   Below's FlowReportUtil sample lines
         *//*

        JSONObject jsonObject = JSON.parseObject(jsonString);
        FlowReportRequest data = JSON.toJavaObject(jsonObject, FlowReportRequest.class);

        new FlowReportUtil()
                .data(data)
                .export( new FileOutputStream("test.pdf"));
    }*/

}
