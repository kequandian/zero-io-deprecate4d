package com.jfeat.pdf.print;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.util.Fonts;
import org.springframework.core.io.ClassPathResource;

import java.io.*;
import java.util.*;

/**
 * Created on 2020/4/6.
 *
 * @author Wen Hao
 */
public class PdfSimpleTemplatePrinter {

    public static void main(String[] args) throws FileNotFoundException {
        JSONObject template = readTemplateFile("simple");

        List<String> rowsList = Arrays.asList("1", "2", "3", "0.5000", "5", "6", "7", "8", "9", "10", "11");
        JSONObject request = new JSONObject();
        request.put("${rows}", rowsList);

        PdfFlowRequest data = convertToPdfFlowRequest(template, request);
        print(new FileOutputStream("template-simple.pdf"), data);
    }

    /**
     *  模版打印pdf
     * @param template json格式模版
     * @param request 自定义参数
     * @return 字节流
     */
    public static ByteArrayOutputStream print(JSONObject template, JSONObject request) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PdfFlowRequest pdfFlowRequest = convertToPdfFlowRequest(template, request);
        print(baos, pdfFlowRequest);
        return baos;
    }

    /**
     * 最终打印方法
     * @param output 输出
     * @param data
     */
    public static void print(OutputStream output, PdfFlowRequest data) {
        try {
            com.jfeat.pdf.print.PdfPrintingFlowUtil util = new com.jfeat.pdf.print.PdfPrintingFlowUtil();
            util.data(data);
            util.export(output);
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        }
    }


    public static PdfFlowRequest convertToPdfFlowRequest(JSONObject template, JSONObject request) {
        PdfFlowRequest data = new PdfFlowRequest();
        // 设置定义
        data.setDefinitions(new PdfFlowRequest.Definitions(new HashMap<>(), new HashMap<>()));
        Map<String, FontDefinition> fontDefs = data.getDefinitions().getFonts();
        Map<String, BorderDefinition> borderDefs = data.getDefinitions().getBorders();
        // 默认字体定义
        fontDefs.put("title", new FontDefinition(Fonts.Definition.BASE.toString(), 16, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("table-header", new FontDefinition(Fonts.Definition.SONG.toString(), 14, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-firstrow", new FontDefinition(Fonts.Definition.SONG.toString(), 12, FontDefinition.BOLD, ColorDefinition.BLACK));
        fontDefs.put("table-row", new FontDefinition(Fonts.Definition.BASE.toString(), 9, FontDefinition.NORMAL, ColorDefinition.BLACK));
        fontDefs.put("default", new FontDefinition(Fonts.Definition.BASE.toString(), 10, FontDefinition.NORMAL, ColorDefinition.BLACK));

        // border
        borderDefs.put("table-border", new BorderDefinition(null, 2, ColorDefinition.BLACK));
        borderDefs.put("line", new BorderDefinition(BorderDefinition.TOP, 2, ColorDefinition.BLACK));
        borderDefs.put("right", new BorderDefinition(BorderDefinition.RIGHT, 10, ColorDefinition.BLACK));

        // 配置flows
        data.setFlows(new ArrayList<>());
        List<PdfFlowRequest.Flow> flows = data.getFlows();
        JSONArray flowsJson = template.getJSONArray("flows");
        for (int i = 0; i < flowsJson.size(); i++) {
            JSONObject flowJson = flowsJson.getJSONObject(i);
            if (flowJson == null) { continue; }
            String name = flowJson.getString("name");
            if (PdfFlowRequest.Flow.LINEAR_FLOW.equals(name)) {
                flows.add(processLinearFlow(flowJson, request));
            } else {
                flows.add(processFlow(flowJson, request));
            }
        }

        // 配置page
        JSONObject page = template.getJSONObject("page");
        String pageName = page.getString("pageName");
        float margin = Float.parseFloat(page.getString("margin"));
        data.setPage(new PdfFlowRequest.Page(pageName, margin));

        return data;
    }

    public static PdfFlowRequest.Flow processFlow(JSONObject flow, JSONObject request) {
        String name = flow.getString("name");
        switch (name) {
            case "table":
                return processTableFlow(flow, request);
            case "text":
                return processTextFlow(flow, request);
            case "content":
                return processContentFlow(flow, request);
            default:
                throw new RuntimeException("错误的flow name");
        }
    }

    public static PdfFlowRequest.Flow processLinearFlow(JSONObject flow, JSONObject request) {

        // layout
        List<Float> columnWidths = flow.getJSONArray("columnWidths").toJavaList(Float.class);
        int size = columnWidths.size();
        float[] layout = new float[size];
        for (int i = 0; i < size; i++) { layout[i] = columnWidths.get(i); }

        PdfFlowRequest.LinearFlowData wrapper = new PdfFlowRequest.LinearFlowData(layout);

        // elements
        JSONArray elements = flow.getJSONArray("elements");
        for (int i = 0; i < elements.size(); i++) {
            JSONObject element = elements.getJSONObject(i);
            if (element == null) { continue; }
            String name = element.getString("name");
            if (PdfFlowRequest.Flow.LINEAR_FLOW.equals(name)) {
                if (element.getJSONArray("columnWidths").size() == 1) {
                    // 递归
                    wrapper.add(processLinearFlow(element, request));
                }
            } else {
                wrapper.add(processFlow(element, request));
            }
        }

        return wrapper.flow();
    }

    public static PdfFlowRequest.Flow processTextFlow(JSONObject flow, JSONObject request) {
        String data = flow.getString("data");
        Float height = flow.getFloat("height");

        PdfFlowRequest.ContentFlowData contentFlowData = PdfFlowRequest.ContentFlowData.build()
                .setLayout(new float[]{1})
                .setTitle(new String[]{data})
                .setData(new String[]{""})
                .rowFormat("default", height);

        return contentFlowData.flow();
    }

    public static PdfFlowRequest.Flow processContentFlow(JSONObject flow, JSONObject request) {

        // layout
        List<Float> columnWidths = flow.getJSONArray("columnWidths").toJavaList(Float.class);
        int size = columnWidths.size();
        float[] layout = new float[size];
        for (int i = 0; i < size; i++) { layout[i] = columnWidths.get(i); }
        // height
        float height = flow.getFloat("height");
        // title
        List<String> title = flow.getJSONArray("title").toJavaList(String.class);
        // data
        List<String> data = flow.getJSONArray("data").toJavaList(String.class);
        PdfFlowRequest.ContentFlowData contentFlowData = PdfFlowRequest.ContentFlowData.build()
                .rowFormat("default", height)
                .setTitle(title.toArray(String[]::new))
                .setData(data.toArray(String[]::new))
                .setLayout(layout);

        return contentFlowData.flow();
    }

    public static PdfFlowRequest.Flow processTableFlow(JSONObject flow, JSONObject request) {
        // row height
        float rowHeight = flow.getFloat("rowHeight");
        // header height
        float headerHeight = flow.getFloat("headerHeight");
        // header
        List<String> header = new ArrayList<>();
        JSONArray columnKeyBindings = flow.getJSONArray("columnKeyBindings");
        for (int i = 0; i < columnKeyBindings.size(); i++) {
            header.add(columnKeyBindings.getJSONObject(i).getString("column"));
        }
        // rows
        List<String> rowsList = new ArrayList<>();
        rowsList = request.getJSONArray("${rows}").toJavaList(String.class);
        // data
        List<String> dataList = new ArrayList<>(header);
        dataList.addAll(rowsList);

        // layout
        List<Float> columnWidths = flow.getJSONArray("columnWidths").toJavaList(Float.class);
        int size = columnWidths.size();
        float[] layout = new float[size];
        for (int i = 0; i < size; i++) { layout[i] = columnWidths.get(i); }

        PdfFlowRequest.TableFlowData tableFlowData = PdfFlowRequest.TableFlowData.build()
                .rowFormat("table-row", rowHeight)
                .firstRowFormat("table-firstrow", headerHeight)
                .data(dataList.toArray(String[]::new))
                .layout(layout);

        return tableFlowData.flow();
    }

    /** 获取测试模版文件 */
    public static JSONObject readTemplateFile(String fileName) {
        String path = String.format("templates/%s.json", fileName);
        StringBuilder sb = new StringBuilder();
        try {
            InputStream inputStream = new ClassPathResource(path).getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(inputStream));
            String s;
            try {
                while ((s = in.readLine()) != null) {
                    sb.append(s);
                    sb.append("\n");
                }
            } finally {
                in.close();
            }
        } catch (IOException var8) {
            throw new RuntimeException(var8);
        }

        return JSONObject.parseObject(sb.toString());
    }
}
