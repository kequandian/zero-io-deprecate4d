package com.jfeat.excel.util;

import cn.hutool.core.util.URLUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import java.io.FileNotFoundException;

/**
 * Created on 2020/4/27.
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

    public static String getQueryParam(String url, String param) {
        UriComponents uriComponents = UriComponentsBuilder.fromHttpUrl(url).build();
        MultiValueMap<String, String> queryParams = uriComponents.getQueryParams();
        return queryParams.getFirst(param);
    }

    public static String setQueryParam(String url, String key, String value) {
        return UriComponentsBuilder.fromHttpUrl(url).queryParam(key, value).build().toString();
    }

    public static String setQueryParams(String url, String queryString) {
        String decode = URLUtil.decode(queryString);
        System.out.println("decode --> " + decode);
        return UriComponentsBuilder.fromHttpUrl(url).query(decode).build().toString();
    }

    public static void main(String[] args) throws FileNotFoundException {
        /* String api = "http://cloud.biliya.cn/api/adm/stat/meta/teamReward?_t=1587977586112&pageNum=1&pageSize=20";
        String authorization = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJvcmdJZCI6IjEwMDAwMDAwMDAwMDAwMDAwMSIsInVzZXJJZCI6Ijg3NjcwODA4MjQzNzE5NzgyNyIsImFjY291bnQiOiJhZG1pbiIsImlhdCI6MTU4Nzk3NDgyNSwianRpIjoiODc2NzA4MDgyNDM3MTk3ODI3Iiwic3ViIjoiYWRtaW4iLCJleHAiOjE1ODgyMzQwMjV9.tBbLszOcRs-I15w-TFEvAEuNjqF7aw8xGVf46UYjdWRsBmtDMtflzXJvrDa4jH_FDHaUNXjwfG9uHxdytD6IKg";
        JSONObject data = HttpUtil.getResponse(api, authorization).getJSONObject("data");

        List<String> header = data.getJSONArray("header").toJavaList(String.class);

        JSONArray rows = data.getJSONArray("rows");
        List<Map<String, String>> rowsMapList = new ArrayList<>();

        for (int i = 0; i < rows.size(); i++) {
            JSONObject obj = rows.getJSONObject(i);
            Map<String, String> rowMap = new HashMap<>();
            // 循环转换
            Iterator it = obj.entrySet().iterator();
            while (it.hasNext()) {
                Map.Entry<String, String> entry = (Map.Entry<String, String>) it.next();
                rowMap.put(entry.getKey(), entry.getValue());
            }
            rowsMapList.add(rowMap);
        }

        PoiAgentExporter.exportExcel(rowsMapList, header, null, new FileOutputStream(new File("excel-test.xlsx")));

        System.out.println(data); */


        String api = "http://39.108.14.206:8070/api/adm/equipment/equipments?categoryId=&activeKey=list";
        String authorization = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzUxMiJ9.eyJ0ZW5hbnRJZCI6Ijg3NjcwODA4MjQzNzE5NzgyNCIsInVzZXJJZCI6Ijg3NjcwODA4MjQzNzE5NzgyNyIsImFjY291bnQiOiJhZG1pbiIsImlhdCI6MTU5NTIxMjUwMiwianRpIjoiODc2NzA4MDgyNDM3MTk3ODI3Iiwic3ViIjoiYWRtaW4iLCJleHAiOjE1OTU0NzE3MDJ9.9qEY1vAb20YCwQOcUoA3LUmculu2NPKFzHHDncGalHN0fRkssJIs2O8HF0-dTvTVrKsf_nFn7FgkeG0vaf-5NA";
        JSONObject data = HttpUtil.getResponse(api, authorization).getJSONObject("data");

        System.out.println(data);
    }
}
