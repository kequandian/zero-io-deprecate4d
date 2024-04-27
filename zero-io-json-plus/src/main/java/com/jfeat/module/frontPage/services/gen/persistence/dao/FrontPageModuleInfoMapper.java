package com.jfeat.module.frontPage.services.gen.persistence.dao;


import com.alibaba.fastjson.JSONArray;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.module.frontPage.services.domain.model.FrontPageModuleInfoRecord;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Code generator
 * @since 2022-09-28
 */
public interface FrontPageModuleInfoMapper extends BaseMapper<FrontPageModuleInfo> {
   List<FrontPageModuleInfoModel> getPageModules(@Param("type") String type);
   Integer batchInsert(@Param("items") List<FrontPageModuleInfoModel> items);
   Integer cleanModule(@Param("type") String type);
}
