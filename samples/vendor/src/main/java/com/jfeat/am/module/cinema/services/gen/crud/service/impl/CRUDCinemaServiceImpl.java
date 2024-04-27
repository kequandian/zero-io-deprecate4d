package com.jfeat.am.module.cinema.services.gen.crud.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.am.module.cinema.services.gen.persistence.model.Cinema;
import com.jfeat.am.module.cinema.services.gen.persistence.dao.CinemaMapper;
import com.jfeat.am.module.cinema.services.gen.crud.service.CRUDCinemaService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;

import javax.annotation.Resource;

import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;

/**
 * <p>
 * implementation
 * </p>
 * CRUDCinemaService
 *
 * @author Code generator
 * @since 2020-09-10
 */

@Service
public class CRUDCinemaServiceImpl extends CRUDServiceOnlyImpl<Cinema> implements CRUDCinemaService {


    @Resource
    protected CinemaMapper cinemaMapper;

    @Override
    protected BaseMapper<Cinema> getMasterMapper() {
        return cinemaMapper;
    }


}


