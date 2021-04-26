package com.jfeat.am.module.cinema.services.domain.dao;

import com.jfeat.am.module.cinema.services.domain.model.CinemaLineRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.am.module.cinema.services.gen.persistence.model.CinemaLine;
import com.jfeat.am.module.cinema.services.gen.crud.model.CinemaLineModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2020-09-10
 */
public interface QueryCinemaLineDao extends QueryMasterDao<CinemaLine> {
   /*
    * Query entity list by page
    */
    List<CinemaLineRecord> findCinemaLinePage(Page<CinemaLineRecord> page, @Param("record") CinemaLineRecord record,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /*
     * Query entity model for details
     */
    CinemaLineModel queryMasterModel(@Param("id") Long id);
}