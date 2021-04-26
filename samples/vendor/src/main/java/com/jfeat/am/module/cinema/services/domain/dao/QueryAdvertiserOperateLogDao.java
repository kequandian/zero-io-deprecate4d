package com.jfeat.am.module.cinema.services.domain.dao;

import com.jfeat.am.module.cinema.services.domain.model.AdvertiserOperateLogRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.am.module.cinema.services.gen.persistence.model.AdvertiserOperateLog;
import com.jfeat.am.module.cinema.services.gen.crud.model.AdvertiserOperateLogModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2020-10-08
 */
public interface QueryAdvertiserOperateLogDao extends QueryMasterDao<AdvertiserOperateLog> {
   /*
    * Query entity list by page
    */
    List<AdvertiserOperateLogRecord> findAdvertiserOperateLogPage(Page<AdvertiserOperateLogRecord> page, @Param("record") AdvertiserOperateLogRecord record,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /*
     * Query entity model for details
     */
    AdvertiserOperateLogModel queryMasterModel(@Param("id") Long id);
}