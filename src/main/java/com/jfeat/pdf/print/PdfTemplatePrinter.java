package com.jfeat.pdf.print;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.util.JsonUtil;
import org.springframework.core.io.ClassPathResource;

import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

/**
 * Created on 2020/2/23.
 *
 * @author Wen Hao
 */
public class PdfTemplatePrinter {

    /** 用于匹配自定义字符数据的正则 */
    private static final String CONVERT_REGEX = "\\$\\{.*\\}";

    public static ByteArrayOutputStream print(JSONObject template, JSONObject request) {
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        JSONObject pdfJsonRequest = processTemplate(template, request);
        print(baos, pdfJsonRequest);
        return baos;
    }

    /** 根据模版打印PDF */
    public static void print(OutputStream output, JSONObject pdfJsonRequest){
        // 转换 json 为 PdfFlowRequest
        PdfFlowRequest data = convertPdfJsonRequest(pdfJsonRequest);
        // 打印
        try {
            com.jfeat.pdf.print.PdfPrintingFlowUtil util = new com.jfeat.pdf.print.PdfPrintingFlowUtil();
            util.data(data);
            util.export(output);
        } catch (FileNotFoundException | DocumentException e) {
            e.printStackTrace();
        }
    }

    /** 合并模版与数据 处理流布局 */
    public static JSONObject processTemplate(JSONObject template, JSONObject request) {
        // 流布局
        JSONArray flows = template.getJSONArray("flows");
        // 处理流布局
        for (int i = 0; i < flows.size(); i++) {
            JSONObject flow = flows.getJSONObject(i);
            if (flow == null) { continue; }
            String name = flow.getString("name");
            // linear flow 嵌套特殊处理
            if (PdfFlowRequest.Flow.LINEAR_FLOW.equals(name)) {
                processLinearFlow(flow, request);
            } else {
                processFlow(flow, request);
            }
        }
        return template;
    }

    /** 处理 flow*/
    public static void processFlow(JSONObject flow, JSONObject request) {
        String name = flow.getString("name");
        switch (name) {
            case PdfFlowRequest.Flow.TITLE_FLOW:
                processTitleFlow(flow, request);
                break;
            case PdfFlowRequest.Flow.TABLE_FLOW:
                processTableFlow(flow, request);
                break;
            case PdfFlowRequest.Flow.LINEAR_FLOW:
                // 嵌套处理
                // processLinearFlow(flow, request);
                break;
            case PdfFlowRequest.Flow.CONTENT_FLOW:
                processContentFlow(flow, request);
                break;
            case PdfFlowRequest.Flow.QRCODE_FLOW:
                processQRCodeFLow(flow, request);
                break;
            case PdfFlowRequest.Flow.NEW_LINE:
                //
                break;
            case PdfFlowRequest.Flow.SEPARATOR_FLOW:
                //
                break;
            default:
                throw new RuntimeException("错误的flow name");
        }
    }

    /** 处理TitleFlow */
    public static void processTitleFlow(JSONObject titleFlow, JSONObject request) {
        JSONObject element = titleFlow.getJSONObject("element");
        String title = element.getString("content");
        // 匹配自定义字符数据
        if (title != null && title.matches(CONVERT_REGEX)) {
            element.put("content", request.getString(title));
        }
    }

    /** 处理QRCodeFlow */
    public static void processQRCodeFLow(JSONObject qrCodeFlow, JSONObject request) {
        JSONObject element = qrCodeFlow.getJSONObject("element");
        String code = element.getString("code");
        // 匹配
        if (code != null && code.matches(CONVERT_REGEX)) {
            element.put("code", request.getString(code));
        }
    }
    /** 处理ContentFlow */
    public static void processContentFlow(JSONObject contentFlow, JSONObject request) {
        JSONObject element = contentFlow.getJSONObject("element");
        JSONObject layout = element.getJSONObject("layout");

        // title
        JSONArray title = element.getJSONArray("title");

        // columnWidths
        JSONArray columnWidths = layout.getJSONArray("columnWidths");
        // 设置等宽
        if (columnWidths == null && title != null && title.size() != 0) {
            Float[] columnWidthsArray = new Float[title.size()];
            Arrays.fill(columnWidthsArray, 1.0f);
            layout.put("columnWidths", Arrays.asList(columnWidthsArray));
        }

        // data
        JSONArray data = element.getJSONArray("data");
        if (data != null) {
            List<String> dataList = JsonUtil.toList(data)
                    .stream()
                    .map(d -> {
                        if (d != null && d.matches(CONVERT_REGEX)) {
                            return request.getString(d);
                        }
                        return d;
                    })
                    .collect(Collectors.toList());

            element.put("data", dataList);
        }
//        String dataKey = element.getString("dataKey");
//        JSONArray dataValue = request.getJSONArray(dataKey);
//        if (dataValue != null) {
//            element.put("data", new ArrayList<>(JsonUtil.toList(dataValue)).subList(0, title.size()));
//        }
    }

    /** 处理TableFlow */
    public static void processTableFlow(JSONObject tableFlow, JSONObject request) {
        JSONObject element = tableFlow.getJSONObject("element");
        JSONObject layout = element.getJSONObject("layout");

        // header
        JSONArray header = element.getJSONArray("header");
        List<String> headerList = JsonUtil.toList(header);

        // columnWidths
        JSONArray columnWidths = layout.getJSONArray("columnWidths");
        // 设置等宽
        if (columnWidths == null) {
            layout.put("numColumns", header.size());
        }

        // rows
        String rows = element.getString("rows");
        List<String> rowList = new ArrayList<>();
        if (rows != null && rows.matches(CONVERT_REGEX)) {
            JSONArray rowsValue = request.getJSONArray(rows);
            if (rowsValue != null) {
                rowList.addAll(JsonUtil.toList(rowsValue));
            }
        }

        // 将 header 和 rows 合并为 data
        List<String> data = new ArrayList<>(headerList);
        data.addAll(rowList);
        element.put("data", data);
    }

    /** 处理LinearFlow */
    public static void processLinearFlow(JSONObject linearFlow, JSONObject request) {
        JSONObject element = linearFlow.getJSONObject("element");
        JSONObject layout = element.getJSONObject("layout");

        // columnWidth
        JSONArray columnWidths = layout.getJSONArray("columnWidths");

        // elements
        JSONArray elements = element.getJSONArray("elements");
        for (int i = 0; i < elements.size(); i++) {
            JSONObject flow = elements.getJSONObject(i);
            if (flow == null) { continue; }
            String name = flow.getString("name");
            if (PdfFlowRequest.Flow.LINEAR_FLOW.equals(name)) {
                if (flow.getJSONObject("layout").getJSONArray("columnWidths").size() == 1) {
                    // 递归
                    processLinearFlow(flow, request);
                }
            } else {
                processFlow(flow, request);
            }
        }
    }

    /** JSON转换成PdfFlowRequest类 */
    public static PdfFlowRequest convertPdfJsonRequest(JSONObject pdfJsonRequest) {
        JSONArray flows = pdfJsonRequest.getJSONArray("flows");
        PdfFlowRequest data = JSONObject.parseObject(pdfJsonRequest.toJSONString(), PdfFlowRequest.class);
        for(int i = 0; i < flows.size(); i++) {
            data.getFlows().get(i).setElement(PdfConverter.handlerConvertToFlowData(flows.getJSONObject(i)));
        }
        return data;
    }

    /** 获取测试模版文件 */
    private static JSONObject readTemplateFile(String fileName) {
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
