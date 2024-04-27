package com.jfeat.module.frontPage.services.gen.crud.service.impl;
// ServiceImpl start

            
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.module.frontPage.services.gen.crud.service.CRUDFrontPageModuleInfoService;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageModuleInfoMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import org.springframework.stereotype.Service;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import javax.annotation.Resource;
import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;

/**
 * <p>
 *  implementation
 * </p>
 *CRUDFrontPageModuleInfoService
 * @author Code generator
 * @since 2022-09-28
 */

@Service
public class CRUDFrontPageModuleInfoServiceImpl  extends CRUDServiceOnlyImpl<FrontPageModuleInfo> implements CRUDFrontPageModuleInfoService {





        @Resource
        protected FrontPageModuleInfoMapper frontPageModuleInfoMapper;

        @Override
        protected BaseMapper<FrontPageModuleInfo> getMasterMapper() {
                return frontPageModuleInfoMapper;
        }







}


