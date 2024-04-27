package com.jfeat.am.module.cinema.services.domain.dao;

import com.jfeat.am.module.cinema.services.domain.model.CinemaRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.am.module.cinema.services.gen.persistence.model.Cinema;
import com.jfeat.am.module.cinema.services.gen.crud.model.CinemaModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2020-09-10
 */
public interface QueryCinemaDao extends QueryMasterDao<Cinema> {
    /*
     * Query entity list by page
     */
    List<CinemaRecord> findCinemaPage(Page<CinemaRecord> page, @Param("record") CinemaRecord record,
                                      @Param("search") String search, @Param("orderBy") String orderBy,
                                      @Param("startTime") Date startTime, @Param("endTime") Date endTime
            , @Param("citys") String[] citys
            , @Param("userType") Integer userType, @Param("userId") Long userId);

    /*
     * Query entity model for details
     */
    CinemaModel queryMasterModel(@Param("id") Long id);

    CinemaRecord findCinemaDetail(@Param("id") Long id);

    //获得影院 子订单 订单计划 关联记录
    Integer cinemaOrderRelation(@Param("id") Long id);


}