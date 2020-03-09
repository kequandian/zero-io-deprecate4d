package com.jfeat.pdf.print;

import cn.hutool.core.date.DateTime;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.util.JsonUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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

    protected final static Logger logger = LoggerFactory.getLogger(PdfTemplatePrinter.class);

    /** 用于匹配自定义字符数据的正则 */
    private static final String CONVERT_REGEX = "\\$\\{.*\\}";

    /** 用于匹配时间的标志*/
    private static final String DATE_REGEX = "${date}";

    /** 用于表示在表格中使用格式化转换的标志*/
    private static final String TABLE_FORMAT_CONVERT = "{}";

    public static void main(String[] args) throws FileNotFoundException {
        JSONObject template = readTemplateFile("test");
        String jsonString = "[\n" +
                "    {\n" +
                "        \"name\": \"a\",\n" +
                "        \"activityName\": \"b\",\n" +
                "        \"projectName\": \"c\",\n" +
                "        \"workTime\": \"d\",\n" +
                "        \"activityFree\": \"e\",\n" +
                "        \"kmCount\": \"f\",\n" +
                "        \"outOfKmFree\": \"g\",\n" +
                "        \"othersFree\": \"h\",\n" +
                "        \"allFree\": \"i\",\n" +
                "        \"createTime\": \"j\",\n" +
                "        \"note\": \"k\"\n" +
                "    }\n" +
                "]";
        JSONObject request = new JSONObject();
        request.put("${rows}", JSONObject.parseArray(jsonString));

        JSONObject pdfJsonRequest = processTemplate(template, request);
        print(new FileOutputStream("template-test.pdf"),pdfJsonRequest);
    }

    /**
     *  模版打印pdf
     * @param template json格式模版
     * @param request 自定义参数
     * @return 字节流
     */
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
                        // 获取当前时间
                        if (DATE_REGEX.equals(d)) {
                            return new DateTime().toString("yyyy-MM-dd HH:mm:ss");
                        }
                        // request 自定义值
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
        JSONObject convert = tableFlow.getJSONObject("convert");

        // headerFields
        List<String> headerFields = JsonUtil.toList(convert.getJSONArray("headerFields"));
        // converts
        JSONObject converts = convert.getJSONObject("converts");

        // header
        List<String> header = JsonUtil.toList(element.getJSONArray("header"));
        // columnWidths
        JSONArray columnWidths = layout.getJSONArray("columnWidths");
        // 设置等宽
        if (columnWidths == null) {
            layout.put("numColumns", header.size());
        }

        // rows
        String rowsKey = element.getString("rows");
        List<String> rowsList = new ArrayList<>();
        if (rowsKey != null && rowsKey.matches(CONVERT_REGEX)) {
            JSONArray rows = request.getJSONArray(rowsKey);
            rowsList = processRowsData(rows, headerFields, converts);
        }

        // 将 header 和 rows 合并为 data
        List<String> data = new ArrayList<>(header);
        data.addAll(rowsList);
        element.put("data", data);
    }

    private static List<String> processRowsData(JSONArray rows, List<String> headerFields, JSONObject converts) {
        List<String> rowList = new ArrayList<>();
        if (rows != null ) {
            for (int i = 0; i < rows.size(); i++) {
                JSONObject row = rows.getJSONObject(i);
                for (int j = 0; j < headerFields.size(); j++) {
                    String field = headerFields.get(j);
                    String value = row.getString(field);
                    // 转换
                    value = convertRowsValue(field, value, converts);
                    rowList.add(value);
                }
            }
        }
        return rowList;
    }

    /** 转换表格中的值 */
    private static String convertRowsValue(String field, String value, JSONObject converts) {
        if (converts != null) {
            JSONObject convert = converts.getJSONObject(field);
            if (convert != null) {
                String format = null;
                if ((format = convert.getString(TABLE_FORMAT_CONVERT)) != null && format.contains(TABLE_FORMAT_CONVERT)) {
                    value = String.format(format.replace(TABLE_FORMAT_CONVERT, "%s"), value);
                } else {
                    String target = convert.getString(value);
                    value = target == null ? value : target;
                }
            }
        }
        return value;
    }

    private static List<String> processRowsData(JSONArray rows, List<String> headerFields) {
        return rows
                .stream()
                .flatMap(row -> headerFields.stream().map(((JSONObject)row)::getString))
                .collect(Collectors.toList());
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
