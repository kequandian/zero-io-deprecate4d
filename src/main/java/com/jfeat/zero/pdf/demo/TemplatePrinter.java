package com.jfeat.zero.pdf.demo;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.itextpdf.text.DocumentException;
import com.jfeat.zero.pdf.print.PdfConverter;
import com.jfeat.zero.pdf.print.PdfExporter;
import com.jfeat.zero.pdf.print.PdfFlowRequest;
import com.jfeat.zero.pdf.print.util.TextFile;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * Created by zy on 2018/11/16.
 */
public class TemplatePrinter {
    /**
     * for test
     **/
    public static void main(String[] args) throws IOException {
        JSONObject request = JSONObject.parseObject("{\"${sum}\":[{\"${price}\":24240.00,\"${quantity}\":200}],\"${originatorName}\":\"admin\",\"${transactionTime}\":\"2018-11-21 15:56:46\",\"${item}\":[{\"${totalPrice}\":24240.00,\"${barcode}\":\"FDI1238HXI891K1\",\"${code}\":\"00010312\",\"${price}\":121.20,\"${rowSeq}\":1,\"${unit}\":\"Ping\",\"${name}\":\"Test ItemTEST\",\"${quantity}\":200}],\"${code}\":\"SAL2018211100015mzo\",\"${transactionBy}\":\"\",\"${traderName}\":\"陈力公司\",\"${traderContactPhone}\":\"020-90909090\",\"${salesNote}\":\"\",\"${deliveredAddress}\":\"广东广州天河区天河大夏\"}");
        try {
            JSONObject obj = TemplateConverter.convert("distributor-order", request);
            print(new FileOutputStream("template-out.pdf"), obj);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
    }

    static void print(OutputStream output, JSONObject pdfFlowRequest) throws FileNotFoundException, DocumentException {
        JSONArray flows = pdfFlowRequest.getJSONArray("flows");

        PdfFlowRequest data = JSONObject.parseObject(pdfFlowRequest.toJSONString(), PdfFlowRequest.class);


        for(int i = 0; i < flows.size(); i++) {
            data.getFlows().get(i).setElement(PdfConverter.handlerConvertToFlowData(flows.getJSONObject(i)));
        }
        PdfExporter exporter = new PdfExporter();
        exporter.setTemplate(pdfFlowRequest.getString("configTemplate"));

        com.jfeat.zero.pdf.print.PdfPrintingFlowUtil util = new com.jfeat.zero.pdf.print.PdfPrintingFlowUtil();
        util.data(data);
        util.export(output);
    }

    /**
     * 将template输入参数与template整合为打印所需json对象
     **/
    static class TemplateConverter {
        private static final String TEMPLATE_DIR = "src/main/java/com/jfeat/pdf/demo/";
        private static final String TEMPLATE_EXT = ".json";

        public static JSONObject convert(String templateName, JSONObject request) throws IOException {
            String path = TEMPLATE_DIR + templateName + TEMPLATE_EXT;
            JSONObject template = JSONObject.parseObject(TextFile.read(path));
            JSONArray flows = template.getJSONArray("flows");
            for(int i = 0; i < flows.size(); i++) {
                JSONObject flow = flows.getJSONObject(i);
                switch (flow.getString("name")) {
                    case PdfFlowRequest.Flow.TITLE_FLOW :
                        convertTitleFlow(flow, request);
                        break;
                    case PdfFlowRequest.Flow.LINEAR_FLOW:
                        converLinearFlow(flow, request);
                        break;
                    case PdfFlowRequest.Flow.TABLE_FLOW:
                        convertTableFlow(flow, request);
                        break;
                    default: ;
                }
            }
            return template;
        }

        private static void convertTableFlow(JSONObject flow, JSONObject request) {
            JSONObject element = flow.getJSONObject("element");
            String itemName = flow.getString("itemName");
            JSONArray datas = element.getJSONArray("header");   // data -> header
            int len = element.getJSONObject("layout").getInteger("numColumns");
            if(len == 0) {
                len = element.getJSONObject("layout").getJSONArray("columnWidths").size();
            }

            List<String> newDatas = new ArrayList<>();
            // add table title
            if(datas != null) {
                newDatas.addAll(Arrays.asList(datas.toArray(new String[0])));
            }

            // add table data
            JSONArray items = request.getJSONArray(itemName);
            // title -> rows
            JSONArray title = element.getJSONArray("rows") == null ? new JSONArray() : element.getJSONArray("rows");
            element.put("title", JSONArray.parse(JSONArray.toJSONString(title)));
            if(items != null) {
                int index = len;
                for(int i = 0; i < items.size(); i ++) {
                    JSONObject item = items.getJSONObject(i);
                    for(int j = 0; j < title.size(); j++) {
                        String titleKey = title.getString(j);
                        String value = item.getString(titleKey);
                        if(newDatas.size() > index) {
                            if("".equals(newDatas.get(index))) {
                                newDatas.set(index, value == null ? "" : value);
                            }
                        } else {
                            newDatas.add(value == null ? "" : value);
                        }
                        index ++;
                    }
                }
            }
            element.put("data", newDatas);
        }


        private static void convertTitleFlow(JSONObject flow, JSONObject request) {
            JSONObject element = flow.getJSONObject("element");
            String title = element.getString("content") == null ? "" : element.getString("content");
            if(title.matches("\\$\\{.*\\}   ")) {
                String titleVlue = request.getString(title);
                element.put("content", titleVlue == null ? "" : titleVlue);
            }
        }

        protected static void converLinearFlow(JSONObject flow, JSONObject request) {
            JSONArray elements = flow.getJSONObject("element").getJSONArray("elements");
            for(int i = 0; i < elements.size(); i++) {
                if("content".equals(elements.getJSONObject(i).getString("name"))) {
                    JSONObject element = elements.getJSONObject(i).getJSONObject("element");
                    JSONArray datas = element.getJSONArray("data");
                    JSONArray title = element.getJSONArray("title");
                    List<String> newData = new ArrayList<>();
                    if(datas != null) {
                        for(int j = 0; j < title.size(); j++) {
                            if(datas.size() > j) {
                                String dataValue = null;
                                String data = datas.getString(j);
                                if(data.matches("\\$\\{.*\\}")) {
                                    dataValue = request.getString(data) == null ? "" : request.getString(data);
                                }
                                newData.add(dataValue == null ? data : dataValue);
                            } else {
                                newData.add("");
                            }
                        }
                    } else {
                        while (newData.size() < title.size()) {
                            newData.add("");
                        }
                    }
                    element.put("data", newData.toArray(new String[0]));
                }

            }
        }
    }

}
