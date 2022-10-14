package com.jfeat.module.frontPage.services.domain.dao;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import com.jfeat.module.frontPage.services.domain.model.FrontPageModuleInfoRecord;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import org.apache.ibatis.annotations.Param;


import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2022-09-28
 */
public interface QueryFrontPageModuleInfoDao extends QueryMasterDao<FrontPageModuleInfo> {
   /*
    * Query entity list by page
    */
    List<FrontPageModuleInfoRecord> findFrontPageModuleInfoPage(Page<FrontPageModuleInfoRecord> page, @Param("record") FrontPageModuleInfoRecord record,
                                                                @Param("search") String search, @Param("orderBy") String orderBy,
                                                                @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /*
     * Query entity model for details
     */
    FrontPageModuleInfoModel queryMasterModel(@Param("id") Long id);
}