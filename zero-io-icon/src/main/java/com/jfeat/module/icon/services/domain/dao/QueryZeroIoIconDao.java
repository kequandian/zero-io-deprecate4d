package com.jfeat.module.icon.services.domain.dao;

import com.jfeat.crud.plus.annotation.SQLTag;
import com.jfeat.module.icon.services.domain.model.ZeroIoIconRecord;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.plus.QueryMasterDao;
import org.apache.ibatis.annotations.Param;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;
import com.jfeat.module.icon.services.gen.crud.model.ZeroIoIconModel;

import java.util.Date;
import java.util.List;

/**
 * Created by Code generator on 2022-11-11
 */
public interface QueryZeroIoIconDao extends QueryMasterDao<ZeroIoIcon> {
   /*
    * Query entity list by page
    */
    @SQLTag("ZeroIoIcon")
    List<ZeroIoIconRecord> findZeroIoIconPage(Page<ZeroIoIconRecord> page, @Param("record") ZeroIoIconRecord record,
                                            @Param("tag") String tag,
                                            @Param("search") String search, @Param("orderBy") String orderBy,
                                            @Param("startTime") Date startTime, @Param("endTime") Date endTime);

    /*
     * Query entity model for details
     */
    ZeroIoIconModel queryMasterModel(@Param("id") Long id);


    /*
     * Query entity model list for slave items
     */
    List<ZeroIoIconModel> queryMasterModelList(@Param("masterId") Object masterId);

    Integer batchInsert(@Param("ioIcons") List<ZeroIoIcon> ioIcons);
}