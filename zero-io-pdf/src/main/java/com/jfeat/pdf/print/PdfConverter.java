package com.jfeat.pdf.print;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

import java.util.ArrayList;

/**
 * Created by zy on 2018/11/15.
 */
public class PdfConverter {
    public static PdfFlowRequest.FlowElement handlerConvertToFlowData(JSONObject flow) {
        PdfFlowRequest.FlowElement flowData = null;
        String name = flow.getString("name");
        switch (name) {
            case PdfFlowRequest.Flow.TITLE_FLOW :
                flowData = flow.getJSONObject("element").toJavaObject(PdfFlowRequest.TitleFlowData.class);
                break;
            case PdfFlowRequest.Flow.LINEAR_FLOW:
                flowData = convertToLinearFlowData(flow.getJSONObject("element"));
                break;
            case PdfFlowRequest.Flow.CONTENT_FLOW:
                flowData = flow.getJSONObject("element").toJavaObject(PdfFlowRequest.ContentFlowData.class);
                break;
            case PdfFlowRequest.Flow.TABLE_FLOW:
                flowData = flow.getJSONObject("element").toJavaObject(PdfFlowRequest.TableFlowData.class);
                break;
            default:
                ;
        }
        return flowData;
    }

    private static PdfFlowRequest.FlowElement convertToLinearFlowData(JSONObject linearFlow) {
        PdfFlowRequest.LinearFlowData linearFlowData = linearFlow.toJavaObject(PdfFlowRequest.LinearFlowData.class);
        linearFlowData.setElements(new ArrayList<>());
        JSONArray elements = linearFlow.getJSONArray("elements");
        for(int i = 0; i < elements.size(); i++) {
            JSONObject element = elements.getJSONObject(i);
            PdfFlowRequest.FlowElement flowData = handlerConvertToFlowData(element);
            linearFlowData.getElements().add(new PdfFlowRequest.Flow(element.getString("name"), flowData));
        }
        return linearFlowData;
    }

}
