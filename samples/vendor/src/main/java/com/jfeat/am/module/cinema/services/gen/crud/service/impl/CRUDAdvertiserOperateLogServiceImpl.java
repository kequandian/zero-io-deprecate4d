package com.jfeat.am.module.cinema.services.gen.crud.service.impl;
// ServiceImpl start

            
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.am.module.cinema.services.gen.persistence.model.AdvertiserOperateLog;
import com.jfeat.am.module.cinema.services.gen.persistence.dao.AdvertiserOperateLogMapper;
import com.jfeat.am.module.cinema.services.gen.crud.service.CRUDAdvertiserOperateLogService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import javax.annotation.Resource;
import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;

/**
 * <p>
 *  implementation
 * </p>
 *CRUDAdvertiserOperateLogService
 * @author Code generator
 * @since 2020-10-08
 */

@Service
public class CRUDAdvertiserOperateLogServiceImpl  extends CRUDServiceOnlyImpl<AdvertiserOperateLog> implements CRUDAdvertiserOperateLogService {





        @Resource
        protected AdvertiserOperateLogMapper advertiserOperateLogMapper;

        @Override
        protected BaseMapper<AdvertiserOperateLog> getMasterMapper() {
                return advertiserOperateLogMapper;
        }







}


