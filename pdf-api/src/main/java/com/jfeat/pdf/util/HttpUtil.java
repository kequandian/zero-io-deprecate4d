package com.jfeat.pdf.util;

import cn.hutool.core.util.URLUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;

/**
 * Created on 2020/3/13.
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

    public static String getHttpAuthorization() {
        // Authorization
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        HttpServletRequest httpRequest = ((ServletRequestAttributes) requestAttributes).getRequest();
        return httpRequest.getHeader("Authorization");
    }

    public static void main(String[] args) {
        String api = "http://cloud.smallsaas.cn/api/crud/tenants?pageNum=1&pageSize=10";
        String auth = "";

        JSONObject response = getResponse(api, auth);

        System.out.println(response);
    }
}
