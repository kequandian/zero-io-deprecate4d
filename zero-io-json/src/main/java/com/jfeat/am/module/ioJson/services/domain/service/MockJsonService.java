package com.jfeat.am.module.ioJson.services.domain.service;


import com.alibaba.fastjson.JSONObject;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 *
 */
public interface MockJsonService {
    JSONObject readJsonFile(Long id);

    JSONObject readJsonFile(Long id, String tag);

    Integer saveJsonToFile(JSONObject json, Long id);

    Integer saveJsonToFile(JSONObject json,String appid, Long id);

    Map<String, String> getIdMap();


    Integer saveJsonToFile(JSONObject json, Long id, String tag);

    String getAppId();

    //获取AppId 的 配置列表
    Map<String, String> getAppIdMap();

    void setAppId(String appId);



}