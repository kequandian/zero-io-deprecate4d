package com.jfeat.am.module.cinema.services.gen.crud.service.impl;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.am.module.cinema.services.gen.persistence.model.Advertiser;
import com.jfeat.am.module.cinema.services.gen.persistence.dao.AdvertiserMapper;
import com.jfeat.am.module.cinema.services.gen.crud.service.CRUDAdvertiserService;
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
 * CRUDAdvertiserService
 *
 * @author Code generator
 * @since 2020-09-10
 */

@Service
public class CRUDAdvertiserServiceImpl extends CRUDServiceOnlyImpl<Advertiser> implements CRUDAdvertiserService {


    @Resource
    protected AdvertiserMapper advertiserMapper;

    @Override
    protected BaseMapper<Advertiser> getMasterMapper() {
        return advertiserMapper;
    }


}


