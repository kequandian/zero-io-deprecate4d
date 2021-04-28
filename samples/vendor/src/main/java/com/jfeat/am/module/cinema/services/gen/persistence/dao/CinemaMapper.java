package com.jfeat.am.module.cinema.services.gen.persistence.dao;

import com.jfeat.am.module.cinema.services.gen.persistence.model.Cinema;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author Code generator
 * @since 2020-09-10
 */
public interface CinemaMapper extends BaseMapper<Cinema> {
   List<Cinema> getImportCinema();

   Integer  setCinemaLineIdByLineName(@Param("cinemaIds")List<Long> cinemaIds);
}
