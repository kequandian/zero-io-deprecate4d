package com.jfeat.am.module.cinema.services.gen.persistence.dao;

import com.jfeat.am.module.cinema.services.gen.persistence.model.AdvertiserOperateLog;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Code generator
 * @since 2020-10-08
 */
public interface AdvertiserOperateLogMapper extends BaseMapper<AdvertiserOperateLog> {
    List<AdvertiserOperateLog> selectLogList(@Param("id")Long id);
}
