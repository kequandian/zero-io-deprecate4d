package com.jfeat.am.module.ioJson.services.domain.service;


import com.alibaba.fastjson.JSONObject;

import java.util.Map;

public interface MockService {

    JSONObject readJsonFile(String name, String customDir);

    Integer saveJsonToFile(JSONObject json, String name, String customDir);

    Map<String, String> getNameMap(String dir);

    //获取所有mock的目录配置信息
    Map<String,String> getDirIdMap();
}
