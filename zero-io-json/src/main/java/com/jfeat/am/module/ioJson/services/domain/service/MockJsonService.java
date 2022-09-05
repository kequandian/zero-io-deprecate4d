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

    Integer saveJsonToFile(JSONObject json, Long id);

    Map<String, String> getIdMap();


    String getAppId();

    //获取AppId 的 配置列表
    Map<String, String> getAppIdMap();

    void setAppId(String appId);

    /**
     * 将josn文件保存到数据库中
     * @return
     */
    int saveJsonFileToDataBase();

}