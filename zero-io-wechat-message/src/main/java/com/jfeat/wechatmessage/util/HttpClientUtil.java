package com.jfeat.wechatmessage.util;

import org.apache.hc.client5.http.classic.methods.HttpGet;
import org.apache.hc.client5.http.classic.methods.HttpPost;
import org.apache.hc.client5.http.impl.classic.CloseableHttpClient;
import org.apache.hc.client5.http.impl.classic.CloseableHttpResponse;
import org.apache.hc.client5.http.impl.classic.HttpClients;
import org.apache.hc.core5.http.ContentType;
import org.apache.hc.core5.http.HttpEntity;
import org.apache.hc.core5.http.ParseException;
import org.apache.hc.core5.http.io.entity.EntityUtils;
import org.apache.hc.core5.http.io.entity.StringEntity;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

/**
 * @description: http/https请求工具，该工具类均没有验证证书，依赖于apache httpclient5
 * @project: zero-io-wechat-message
 * @version: 1.0
 * @date: 2023/4/24 09:54
 * @author: hhhhhtao
 */
public class HttpClientUtil {

    private static final Logger logger = LoggerFactory.getLogger(HttpClientUtil.class);

    /**
     * GET请求
     * @param url 请求路径
     * @return
     */
    public static String get(String url) {

        String result = null;
        // 创建get请求
        HttpGet httpGet = new HttpGet(url);
        // 创建http客户端
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // http客户端执行get请求
            CloseableHttpResponse httpResponse = httpClient.execute(httpGet);
            // 判断访问是否成功
            if (httpResponse.getCode() == 200) {
                // 在response中获取实体
                HttpEntity responseEntity = httpResponse.getEntity();
                result = EntityUtils.toString(responseEntity);
            } else {
                logger.error("api请求失败，method:GET，url:" + url);
            }
        } catch (IOException e ) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return result;
    }

    /**
     * post请求，body为json格式
     * @param url 请求路径
     * @param jsonBody 请求body为Json字符串
     * @return
     */
    public static String postByBodyOfJson(String url, String jsonBody) {

        String result = null;
        // 创建post请求
        HttpPost httpPost = new HttpPost(url);
        // 创建请求body
        HttpEntity httpEntity = new StringEntity(jsonBody, ContentType.APPLICATION_JSON);
        // 设定到post请求中
        httpPost.setEntity(httpEntity);
        // 创建http客户端
        try (CloseableHttpClient httpClient = HttpClients.createDefault()) {
            // http客户端执行post请求
            CloseableHttpResponse httpResponse = httpClient.execute(httpPost);
            if (httpResponse.getCode() == 200) {
                // 获取返回结果
                HttpEntity responseEntity = httpResponse.getEntity();
                result = EntityUtils.toString(responseEntity);
            } else {
                logger.error("api请求失败，method:POST，url:" + url + "，请求body：" + jsonBody);
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }

        return result;
    }
}
