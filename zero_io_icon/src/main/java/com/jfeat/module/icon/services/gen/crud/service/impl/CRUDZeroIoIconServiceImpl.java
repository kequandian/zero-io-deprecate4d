package com.jfeat.module.icon.services.gen.crud.service.impl;
// ServiceImpl start

            
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;
import com.jfeat.module.icon.services.gen.persistence.dao.ZeroIoIconMapper;
import com.jfeat.module.icon.services.gen.crud.service.CRUDZeroIoIconService;
import org.springframework.stereotype.Service;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import javax.annotation.Resource;
import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;

/**
 * <p>
 *  implementation
 * </p>
 *CRUDZeroIoIconService
 * @author Code generator
 * @since 2022-11-11
 */

@Service
public class CRUDZeroIoIconServiceImpl  extends CRUDServiceOnlyImpl<ZeroIoIcon> implements CRUDZeroIoIconService {





        @Resource
        protected ZeroIoIconMapper zeroIoIconMapper;

        @Override
        protected BaseMapper<ZeroIoIcon> getMasterMapper() {
                return zeroIoIconMapper;
        }







}


