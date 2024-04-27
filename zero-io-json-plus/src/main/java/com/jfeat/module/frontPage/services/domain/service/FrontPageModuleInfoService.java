package com.jfeat.module.frontPage.services.domain.service;


import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.jfeat.module.frontPage.services.domain.model.FrontPageModuleInfoRecord;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.crud.service.CRUDFrontPageModuleInfoService;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by vincent on 2017/10/19.
 */
public interface FrontPageModuleInfoService extends CRUDFrontPageModuleInfoService {
    List<FrontPageModuleInfoModel> getPageModules(String module);

    Integer updatePageModule(String moduleName);

    @Transactional
    void frontPageModuleSetting(FrontPageModuleInfoModel info);

    //解析json 转换成 modulInfo对象
    FrontPageModuleInfoModel pareJsonToPageModuleInfo(JSONObject json);

    //更新库中已有的全部动态页面的type和name
    Integer batchUpdateAllType();

    void setTypeAndModuleName(FrontPage record, JSONObject json);
}