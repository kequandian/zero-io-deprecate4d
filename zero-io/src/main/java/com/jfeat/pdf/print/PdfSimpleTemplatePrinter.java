package com.jfeat.pdf.print;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.pdf.print.base.BorderDefinition;
import com.jfeat.pdf.print.base.ColorDefinition;
import com.jfeat.pdf.print.base.FontDefinition;
import com.jfeat.pdf.print.util.Fonts;
import com.jfeat.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.ByteArrayOutputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.*;
import java.util.stream.Collectors;

/**
 * Created on 2020/4/6.
 *
 * @author Wen Hao
 */
public class PdfSimpleTemplatePrinter {

    protected final static Logger logger = LoggerFactory.getLogger(PdfSimpleTemplatePrinter.class);

    /** 用于匹配自定义字符数据的正则 */
    private static final String CONVERT_REGEX = "\\$\\{.*\\}";


    public static void main(String[] args) throws FileNotFoundException {
        JSONObject template = JsonUtil.readTemplateFile("simple");

        List<String> rowsList = Arrays.asList("1", "2", "3", "0.5000", "5", "6", "7", "8", "9", "10", "11");

        JSONArray rowsJSONArray = new JSONArray();
        JSONObject rowJSONObject = new JSONObject();
        rowJSONObject.put("id", "1");
        rowJSONObject.put("name", "no name");
        rowsJSONArray.add(rowJSONObject);

        JSONArray rowsArray = JSONArray.parseArray(JSON.toJSONString(rowsList));
        JSONObject request = getRequest();
        request.put("${rows}", rowsJSONArray);

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

    public static JSONObject getRequest() {
        JSONObject request = new JSONObject();
        // 设置 默认变量
        request.put("${createDate}", new DateTime().toString());
        return request;
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
                flows.add(processLinearFlow(flowJson, data, request));
            } else {
                flows.add(processFlow(flowJson, data, request));
            }
        }

        // 配置page
        JSONObject page = template.getJSONObject("page");
        String pageName = page.getString("pageName");
        float margin = Float.parseFloat(page.getString("margin"));
        data.setPage(new PdfFlowRequest.Page(pageName, margin));

        return data;
    }

    public static PdfFlowRequest.Flow processFlow(JSONObject flow, PdfFlowRequest pdfFlowRequest, JSONObject request) {
        String name = flow.getString("name");
        switch (name) {
            case "table":
                return processTableFlow(flow, pdfFlowRequest, request);
            case "text":
                return processTextFlow(flow, request);
            case "content":
                return processContentFlow(flow, request);
            default:
                throw new RuntimeException("错误的flow name");
        }
    }

    public static PdfFlowRequest.Flow processLinearFlow(JSONObject flow, PdfFlowRequest pdfFlowRequest, JSONObject request) {

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
                    wrapper.add(processLinearFlow(element, pdfFlowRequest, request));
                }
            } else {
                wrapper.add(processFlow(element, pdfFlowRequest, request));
            }
        }

        return wrapper.flow();
    }

    public static PdfFlowRequest.Flow processTextFlow(JSONObject flow, JSONObject request) {
        String data = flow.getString("data");
        Float height = flow.getFloat("height");

        if (data != null && data.matches(CONVERT_REGEX)) {
            Object o = request.get("data");
            if (o instanceof String) {
                data = (String) o;
            } else {
                data = "";
            }
        }

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

        // handle request in data
        data = data.stream().map(item -> {
            if (item != null && item.matches(CONVERT_REGEX)) {
                return request.getString(item);
            }
            return item;
        }).collect(Collectors.toList());

        PdfFlowRequest.ContentFlowData contentFlowData = PdfFlowRequest.ContentFlowData.build()
                .rowFormat("default", height)
                .setTitle(title.toArray(String[]::new))
                .setData(data.toArray(String[]::new))
                .setLayout(layout);

        return contentFlowData.flow();
    }

    public static PdfFlowRequest.Flow processTableFlow(JSONObject flow, PdfFlowRequest pdfFlowRequest, JSONObject request) {
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
        // header keys
        List<String> keys = new ArrayList<>();
        for (int i = 0; i < columnKeyBindings.size(); i++) {
            keys.add(columnKeyBindings.getJSONObject(i).getString("key"));
        }
        // rows
        List<String> rowsList = new ArrayList<>();
        // converts
        JSONObject converts = flow.getJSONObject("converts");

        JSONArray rows = null;
        String data = flow.getString("data");
        if (data != null && data.matches(CONVERT_REGEX)) {
            Object o = request.get(data);
            if (o instanceof JSONArray) {
                rows = (JSONArray) o;
                // handle key bindings
                rowsList = processRowsList(rows, keys, converts);
            }
        }

        // data
        List<String> dataList = new ArrayList<>(header);
        dataList.addAll(rowsList);

        // layout
        List<Float> columnWidths = flow.getJSONArray("columnWidths").toJavaList(Float.class);
        int size = columnWidths.size();
        float[] layout = new float[size];
        for (int i = 0; i < size; i++) { layout[i] = columnWidths.get(i); }

        // font format
        String rowsFormatName = "table-row";
        String headerFormatName = "table-firstrow";
        JSONObject rowsFormat = flow.getJSONObject("rowsFormat");
        JSONObject headerFormat = flow.getJSONObject("headerFormat");
        Map<String, FontDefinition> fonts = pdfFlowRequest.getDefinitions().getFonts();
        if (rowsFormat != null) {
            rowsFormatName = "rowsFormat";
            Float formatSize = rowsFormat.getFloat("size");
            fonts.put(rowsFormatName, new FontDefinition(Fonts.Definition.SONG.toString(), formatSize, FontDefinition.BOLD, ColorDefinition.BLACK));
        }
        if (headerFormat != null) {
            headerFormatName = "headerFormat";
            Float formatSize = headerFormat.getFloat("size");
            fonts.put(headerFormatName, new FontDefinition(Fonts.Definition.SONG.toString(), formatSize, FontDefinition.BOLD, ColorDefinition.BLACK));
        }

        PdfFlowRequest.TableFlowData tableFlowData = PdfFlowRequest.TableFlowData.build()
                .rowFormat(rowsFormatName, rowHeight)
                .firstRowFormat(headerFormatName, headerHeight)
                .data(dataList.toArray(String[]::new))
                .layout(layout);

        return tableFlowData.flow();
    }

    private static List<String> processRowsList(JSONArray rows, List<String> keys, JSONObject converts) {
        List<String> rowsList = new ArrayList<>();
        if (rows != null) {
            // process key binding
            for (int i = 0; i < rows.size(); i++) {
                Object o = rows.get(i);
                if (o instanceof  JSONObject) {
                    JSONObject row = rows.getJSONObject(i);
                    for (String key : keys) {
                        // process convert
                        String value = processConverts(key, row.getString(key), converts);
                        rowsList.add(value);
                    }
                } else {
                    rowsList.add(o.toString());
                }
            }
        }
        return rowsList;
    }

    public static String CONVERT_FORMAT = "{}";

    public static String MULTIPLE = "{multiplication}";

    private static String processConverts(String key, String value,  JSONObject converts) {
        if (converts != null) {
            JSONObject convertsJSONObject = converts.getJSONObject(key);
            if (convertsJSONObject == null) { return value; }
            // Float 乘法
            Float multiple = convertsJSONObject.getFloat(MULTIPLE);
            if (multiple != null) {
                float floatValue = Float.parseFloat(value);
                value = String.valueOf(floatValue * multiple);
            }
            String convertString = convertsJSONObject.getString(value);
            if (convertString != null) { return convertString; }
            String convertFormat = convertsJSONObject.getString(CONVERT_FORMAT);
            if (convertFormat != null)  { return String.format(convertFormat.replace(CONVERT_FORMAT, "%s"), value); }
        }
        return value;
    }
}
