package com.jfeat.am.module.cinema.services.domain.dao;

import com.jfeat.am.module.cinema.services.domain.model.AdvertiserRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.am.module.cinema.services.gen.persistence.model.Advertiser;
import com.jfeat.am.module.cinema.services.gen.crud.model.AdvertiserModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2020-09-10
 */
public interface QueryAdvertiserDao extends QueryMasterDao<Advertiser> {
   /*
    * Query entity list by page
    */
    List<AdvertiserRecord> findAdvertiserPage(Page<AdvertiserRecord> page, @Param("record") AdvertiserRecord record,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime
                                            ,@Param("userType")Integer userType,@Param("userId")Long userId);

    /*
     * Query entity model for details
     */
    AdvertiserModel queryMasterModel(@Param("id") Long id);


    AdvertiserRecord findDetail(@Param("id") Long id);

}