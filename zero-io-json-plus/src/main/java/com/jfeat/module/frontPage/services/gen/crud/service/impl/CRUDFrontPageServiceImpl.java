package com.jfeat.module.frontPage.services.gen.crud.service.impl;
// ServiceImpl start

            
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.crud.service.CRUDFrontPageService;
import org.springframework.stereotype.Service;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import javax.annotation.Resource;
import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;

/**
 * <p>
 *  implementation
 * </p>
 *CRUDFrontPageService
 * @author Code generator
 * @since 2022-09-06
 */

@Service
public class CRUDFrontPageServiceImpl  extends CRUDServiceOnlyImpl<FrontPage> implements CRUDFrontPageService {





        @Resource
        protected FrontPageMapper frontPageMapper;

        @Override
        protected BaseMapper<FrontPage> getMasterMapper() {
                return frontPageMapper;
        }







}


