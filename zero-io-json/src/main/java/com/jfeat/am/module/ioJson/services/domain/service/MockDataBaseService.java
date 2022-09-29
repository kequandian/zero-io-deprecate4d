package com.jfeat.am.module.ioJson.services.domain.service;


import com.alibaba.fastjson.JSONObject;

public interface MockDataBaseService {

    Integer saveJsonToDataBase(JSONObject json, Long id,String tag);

    Integer synchronizationToDataBase();
}
