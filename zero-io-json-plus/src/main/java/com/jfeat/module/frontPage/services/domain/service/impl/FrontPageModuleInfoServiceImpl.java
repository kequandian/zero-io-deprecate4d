package com.jfeat.module.frontPage.services.domain.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.module.frontPage.services.domain.model.FrontPageModuleInfoRecord;
import com.jfeat.module.frontPage.services.domain.model.ModuleModel;
import com.jfeat.module.frontPage.services.domain.service.FrontPageModuleInfoService;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.crud.service.impl.CRUDFrontPageModuleInfoServiceImpl;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageModuleInfoMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author admin
 * @since 2017-10-16
 */

@Service("frontPageModuleInfoService")
public class FrontPageModuleInfoServiceImpl extends CRUDFrontPageModuleInfoServiceImpl implements FrontPageModuleInfoService {

    @Resource
    FrontPageModuleInfoMapper frontPageModuleInfoMapper;

    @Resource
    FrontPageMapper frontPageMapper;

    @Override
    public  List<FrontPageModuleInfoModel> getPageModules(String module){
        List<FrontPageModuleInfoModel> pageModules = frontPageModuleInfoMapper.getPageModules(module);
        return pageModules;
    }


    @Override
    @Transactional
    public Integer updatePageModule(String moduleName){
        List<FrontPageModuleInfoModel> pageModules = frontPageModuleInfoMapper.getPageModules(moduleName);
        Integer integer = frontPageModuleInfoMapper.cleanModule(moduleName);
        List<FrontPageModuleInfoModel> newModules = new ArrayList<>();

        for(FrontPageModuleInfoModel info:pageModules){
            frontPageModuleSetting(info);
        }
        for(FrontPageModuleInfoModel info:pageModules){
            for(String key:info.getNameTypeMap().keySet()){
                String name = info.getNameTypeMap().get(key);
                info.setModuleType(key);
                info.setItemModuleName(name);
                newModules.add(info);
            }

        }

        integer += frontPageModuleInfoMapper.batchInsert(newModules);
        return integer;
    }

    @Override
    @Transactional
    public void frontPageModuleSetting(FrontPageModuleInfoModel info){
        Map<String, String> nameTypeMap = new HashMap<>();
        String moduleJson = info.getModuleJson();
        if(moduleJson != null && !moduleJson.equals("")){
            List<ModuleModel> modules = JSONArray.parseArray(moduleJson, ModuleModel.class);
            for(ModuleModel module:modules){
               // info.setModuleType(module.getType());
                //nameTypeMap.put(module.getType(),null);

                Map<String,JSONObject> itemMap = new HashMap();
                String moduleString = info.getItemModuleNameJson();
                if(moduleString != null && !moduleString.equals("")){
                    JSONObject jsonObject = JSONObject.parseObject(moduleString);
                    for(String key:jsonObject.keySet()){
                        itemMap.put(key,jsonObject.getJSONObject(key));
                    }
                }

                JSONObject item = itemMap.get(module.getKey());
                if(item != null){
                    JSONObject newItemModule = item.getJSONObject("itemModule");
                    if(newItemModule != null){
                        String name = newItemModule.getString("name");
                        //  info.setItemModuleName(name);
                        nameTypeMap.put(module.getType(),name);
                    }
                }


            }
        }

        info.setNameTypeMap(nameTypeMap);
    }

    //解析json 转换成 modulInfo对象
    @Override
    public FrontPageModuleInfoModel pareJsonToPageModuleInfo(JSONObject json){
        FrontPageModuleInfoModel frontPageModuleInfoModel = new FrontPageModuleInfoModel();
        frontPageModuleInfoModel.setModuleJson(json.getString("modules"));
        frontPageModuleInfoModel.setItemModuleNameJson(json.getString("moduleData"));
        return frontPageModuleInfoModel;
    }

    //更新库中已有的全部动态页面的type和name
    @Override
    @Transactional
    public Integer batchUpdateAllType(){
        Integer i = 0;
        List<FrontPage> frontPages = frontPageMapper.selectList(new QueryWrapper<>());
        for(FrontPage frontPage:frontPages){
            setTypeAndModuleName(frontPage, JSONObject.parseObject(frontPage.getContent()));
        };
        i += frontPageMapper.batchUpdateTypeAndName(frontPages);
        return i;
    }


    @Override
    @Transactional
    public void setTypeAndModuleName(FrontPage record, JSONObject json){
        //解析json 多个modules时优先设置autolist为页面类型
        FrontPageModuleInfoModel info = pareJsonToPageModuleInfo(json);
        frontPageModuleSetting(info);
        for(String key:info.getNameTypeMap().keySet()){
            String name = info.getNameTypeMap().get(key);
            record.setType(key);
            record.setModuleName(name);
            if("autolist".equals(key)){
                break;
            }
        }
    }

}
