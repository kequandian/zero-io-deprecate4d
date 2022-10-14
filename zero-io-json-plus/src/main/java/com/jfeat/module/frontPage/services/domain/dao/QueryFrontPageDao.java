package com.jfeat.module.frontPage.services.domain.dao;

import com.jfeat.crud.plus.annotation.SQLTag;
import com.jfeat.module.frontPage.services.domain.model.FrontPageRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2022-09-06
 */

public interface QueryFrontPageDao extends QueryMasterDao<FrontPage> {
   /*
    * Query entity list by page
    */
   @SQLTag("FrontPage")
    List<FrontPageRecord> findFrontPagePage(Page<FrontPageRecord> page, @Param("record") FrontPageRecord record,
                                            @Param("tag") String tag,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime);


    @SQLTag("FrontPage")
    List<FrontPageRecord> findFrontPagePageByType(Page<FrontPageRecord> page, @Param("record") FrontPageRecord record,
                                            @Param("type") String type,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /*
     * Query entity model for details
     */
    FrontPageModel queryMasterModel(@Param("id") Long id);


    /*
     * Query entity model list for slave items
     */
    List<FrontPageModel> queryMasterModelList(@Param("masterId") Object masterId);



}