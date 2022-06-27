package com.jfeat.am.module.ioJson.services.domain.service;


import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.util.Map;

/**

 */
public interface MockJsonService {
    JSONObject readJsonFile(Long id);

    Integer saveJsonToFile(JSONObject json, Long id);

    Map<String, String> getIdMap();

    void writeProperties(String proKey, String proValue, File file);


    String getAppId();

    //获取AppId 的 配置列表
    Map<String,String> getAppIdMap();

    void setAppId(String appId);
}