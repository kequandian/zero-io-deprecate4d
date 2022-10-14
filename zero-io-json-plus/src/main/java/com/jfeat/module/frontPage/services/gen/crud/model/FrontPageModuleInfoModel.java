package com.jfeat.module.frontPage.services.gen.crud.model;
// this is serviceModel.java.vm


import com.baomidou.mybatisplus.annotation.TableField;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;

import java.util.Map;

/**
 * Created by Code generator on 2022-09-28
 *  * slaves.size() : 0
 *  * modelpack : $modelpack
 */
public class FrontPageModuleInfoModel extends FrontPageModuleInfo {

    private String moduleJson;

    private String itemModuleNameJson;

    private Map<String,String> nameTypeMap;

    public Map<String, String> getNameTypeMap() {
        return nameTypeMap;
    }

    public void setNameTypeMap(Map<String, String> nameTypeMap) {
        this.nameTypeMap = nameTypeMap;
    }

    public String getItemModuleNameJson() {
        return itemModuleNameJson;
    }

    public void setItemModuleNameJson(String itemModuleNameJson) {
        this.itemModuleNameJson = itemModuleNameJson;
    }

    public String getModuleJson() {
        return moduleJson;
    }

    public void setModuleJson(String moduleJson) {
        this.moduleJson = moduleJson;
    }
}
