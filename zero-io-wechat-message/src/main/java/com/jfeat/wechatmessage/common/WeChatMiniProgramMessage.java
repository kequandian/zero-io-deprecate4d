package com.jfeat.wechatmessage.common;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.wechatmessage.util.HttpClientUtil;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Component;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.concurrent.TimeUnit;

/**
 * @description: 微信小程序消息类
 * @project: zero-io-wechat-message
 * @version: 1.0
 * @date: 2023/4/24 10:22
 * @author: hhhhhtao
 */
@Component
public class WeChatMiniProgramMessage {

    private static final Logger logger = LoggerFactory.getLogger(WeChatMiniProgramMessage.class);

    // 微信小程序凭证key
    private static final String ACCESS_TOKEN_KEY = "access_token";

    // 微信小程序获取接口调用凭证api url,方法：GET
    @Value("${wechat.getAccessToken.url:}")
    private String WECHAT_GET_ACCESS_TOKEN_URL;

    // 微信小程序发送订阅信息api url,方法：POST
    @Value("${wechat.sendMessage.url:}")
    private String WECHAT_SEND_MESSAGE_URL;

    @Resource
    StringRedisTemplate stringRedisTemplate; // spring-boot字符串类型redis操作类

    /**
     * 获取接口调用凭据
     * 请求的是微信官方域名，不做证书验证
     *
     * @param appAppid 小程序appid
     * @param appSecret 小程序appSecret
     * @return "{"access_token": 获取到的凭证，"expires_in": 有效时间}"
     */
    public String getAccessToken(String appAppid,String appSecret) {

        // 必要参数判断
        if (StringUtils.isBlank(WECHAT_GET_ACCESS_TOKEN_URL)) {
            logger.error("application.properties中缺少微信小程序获取接口调用凭证api url");
            new BusinessException(BusinessCode.EmptyNotAllowed,"application.properties中缺少微信小程序获取接口调用凭证api url");
        }
        if (StringUtils.isBlank(appAppid)) {
            logger.error("appid cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appid cannot null");
        }
        if (StringUtils.isBlank(appSecret)) {
            logger.error("appSecret cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appSecret cannot null");
        }

        // 定义返回值
        String accessToken = null;

        // 查看redis缓存中是否拥有access_token
        accessToken = stringRedisTemplate.opsForValue().get(ACCESS_TOKEN_KEY);
        if (accessToken == null) {
            // 替换url中的占位符
            String url = WECHAT_GET_ACCESS_TOKEN_URL.replace("{appid}",appAppid).replace("{secret}",appSecret);
            // 执行get请求,获取返回值
            String requestResult = HttpClientUtil.get(url);
            if (requestResult == null) throw new BusinessException(BusinessCode.CodeBase,"凭证获取失败");
            // 将字符串转为json以便获取凭证
            accessToken = JSON.parseObject(requestResult).getString(ACCESS_TOKEN_KEY);
            if (accessToken == null) throw new BusinessException(BusinessCode.CodeBase,"凭证获取失败,请求返回信息：" + requestResult);
            // 获取凭证，并存入redis缓存中，凭证有效期为7200s，我们设为7000s
            stringRedisTemplate.opsForValue().set(ACCESS_TOKEN_KEY,accessToken,7000, TimeUnit.SECONDS);
        }

        return accessToken;
    }

    /**
     * 给指定用户发送一次性订阅消息
     * 微信指定格式：
     * {
     *     access_token: "", // 接口调用凭证
     *     template_id: "", // 所需下发的订阅模板id
     *     page: "", // 跳转页面，默认为空
     *     touser: "", // 接收者（用户）的 openid
     *     data: "", // 模板内容，格式形如 { "key1": { "value": any }, "key2": { "value": any } }的object
     *     miniprogram_state: "", 跳转小程序类型：developer为开发版；trial为体验版；formal为正式版；默认为正式版
     *     lang: "" // 进入小程序查看”的语言类型，支持zh_CN(简体中文)、en_US(英文)、zh_HK(繁体中文)、zh_TW(繁体中文)，默认为zh_CN
     * }
     * @param appAppid 小程序appid
     * @param appSecret 小程序appSecret
     * @param openid 用户openid
     * @param templateId 订阅模版id
     * @param data 模版内容
     * @param page 跳转页面
     * @param miniProgramState 跳转小程序类型
     * @param lang 进入小程序查看的语言类型
     */
    public void sendMessage(String appAppid,String appSecret,String openid,String templateId,JSON data,
                            String page,String miniProgramState,String lang) {

        // 必要参数判断
        if (StringUtils.isBlank(appAppid)) {
            logger.error("appAppid cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appAppid cannot null");
        }
        if (StringUtils.isBlank(appSecret)) {
            logger.error("appSecret cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appSecret cannot null");
        }
        if (StringUtils.isBlank(openid)) {
            logger.error("openid cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"openid cannot null");
        }
        if (StringUtils.isBlank(templateId)) {
            logger.error("templateId cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"templateId cannot null");
        }
        if (data == null) {
            logger.error("data cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"data cannot null");
        }

        // 获取access_token
        String accessToken = this.getAccessToken(appAppid,appSecret);
        if (accessToken == null) throw new BusinessException(BusinessCode.EmptyNotAllowed,"access_token为空");

        // 替换url中的占位符
        String url = WECHAT_SEND_MESSAGE_URL.replace("{access_token}",accessToken);

        // 封装请求参数
        JSONObject params = new JSONObject();
        params.put("template_id", templateId);
        params.put("page",page);
        params.put("touser",openid);
        params.put("data",data);
        params.put("miniprogram_state",miniProgramState);
        params.put("lang",lang);

        // 向微信发送post请求
        String result = HttpClientUtil.postByBodyOfJson(url,params.toString());
        if (JSON.parseObject(result).getInteger("errcode") != 0) logger.error("微信小程序订阅消息发送失败，" +
                "返回结果：" + result + ", " +
                "发送的用户openid：" + openid );
    }

    /**
     * 给指定用户发送一次性订阅消息
     * page,miniprogram_state,lang均使用默认参数
     * @param appAppid
     * @param appSecret
     * @param openid
     * @param templateId
     * @param data
     */
    public void sendMessage(String appAppid,String appSecret,String openid,String templateId,JSON data) {

        // 必要参数判断
        if (StringUtils.isBlank(appAppid)) {
            logger.error("appAppid cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appAppid cannot null");
        }
        if (StringUtils.isBlank(appSecret)) {
            logger.error("appSecret cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"appSecret cannot null");
        }
        if (StringUtils.isBlank(openid)) {
            logger.error("openid cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"openid cannot null");
        }
        if (StringUtils.isBlank(templateId)) {
            logger.error("templateId cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"templateId cannot null");
        }
        if (data == null) {
            logger.error("data cannot null");
            new BusinessException(BusinessCode.EmptyNotAllowed,"data cannot null");
        }

        // 获取access_token
        String accessToken = this.getAccessToken(appAppid,appSecret);
        if (accessToken == null) throw new BusinessException(BusinessCode.EmptyNotAllowed,"access_token为空");

        // 替换url中的占位符
        String url = WECHAT_SEND_MESSAGE_URL.replace("{access_token}",accessToken);

        // 封装请求参数
        JSONObject params = new JSONObject();
        params.put("template_id", templateId);
        params.put("touser",openid);
        params.put("data",data);

        // 向微信发送post请求
        String result = HttpClientUtil.postByBodyOfJson(url,params.toString());
        if (JSON.parseObject(result).getInteger("errcode") != 0) logger.error("微信小程序订阅消息发送失败，" +
                "返回结果：" + result + ", " +
                "发送的用户openid：" + openid );
    }

}
