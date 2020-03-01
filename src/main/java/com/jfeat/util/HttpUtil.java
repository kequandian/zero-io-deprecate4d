package com.jfeat.util;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.pdf.print.PdfTemplatePrinter;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

/**
 * Created on 2020/2/24.
 *
 * @author Wen Hao
 */
public class HttpUtil {

    public static HttpHeaders getHttpHeaders(String authorization){
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");
        headers.add("Accept", "*/*");
        //Basic YWRtaW46YWRtaW4=
        headers.add("Authorization", authorization);
        return headers;
    }

    public static JSONObject getResponse(String serverInstance, String authorization){
        RestTemplate rest = new RestTemplate();
        ResponseEntity<String> responseEntity = rest.exchange(serverInstance, HttpMethod.GET, new HttpEntity<>(getHttpHeaders(authorization)), String.class);
        String body = responseEntity.getBody();
        JSONObject jsonObject = JSON.parseObject(body);
        return jsonObject;
    }

    public static void main(String[] args) throws FileNotFoundException {
        String api = "http://47.112.34.149/api/crud/myVenderActivityies?_t=1582537541294&pageNum=1&pageSize=10";
        String authorization = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJvcmdJZCI6IjEwMDAwMDAwMDAwMDAwMDAwMSIsInVzZXJJZCI6Ijg3NjcwODA4MjQzNzE5NzgyNyIsImFjY291bnQiOiJhZG1pbiIsImlhdCI6MTU4MjM4NTk5NywianRpIjoiODc2NzA4MDgyNDM3MTk3ODI3Iiwic3ViIjoiYWRtaW4iLCJleHAiOjE1ODI2NDUxOTd9.1tu9FiabvtrXBjCj5nEs_0xAdGtmP_WNH0nO3oLlRbTM-JEIEQar5j43GYBW5fcXgt_TEA2qr7p09jiQK11vCQ";
        JSONObject response = getResponse(api, authorization);

        JSONArray rows = response.getJSONObject("data").getJSONArray("records");
        JSONObject request = new JSONObject();
        request.put("${rows}", rows);
        JSONObject template = PdfTemplatePrinter.readTemplateFile("test");
        JSONObject pdfRequest = PdfTemplatePrinter.processTemplate(template, request);
        PdfTemplatePrinter.print(new FileOutputStream("test.pdf"), pdfRequest);
    }
}
