package com.jfeat.am.module.ioJson.services.domain.service;


import com.alibaba.fastjson.JSONObject;

import java.util.Map;

/**

 */
public interface MockJsonService {
    JSONObject readJsonFile(Long id);

    Integer saveJsonToFile(JSONObject json, Long id);

    Map<String, String> getIdMap();

    void writeProperties(Long id, String fileName);
}