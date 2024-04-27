package com.jfeat.module.frontPage.services.gen.persistence.dao;

import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Code generator
 * @since 2022-09-06
 */
public interface FrontPageMapper extends BaseMapper<FrontPage> {
    Integer batchUpdateTypeAndName(@Param("items") List<FrontPage> items);
}
