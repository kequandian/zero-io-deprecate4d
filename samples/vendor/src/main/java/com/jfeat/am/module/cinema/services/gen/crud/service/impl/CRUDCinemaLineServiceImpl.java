package com.jfeat.am.module.cinema.services.gen.crud.service.impl;
            
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.jfeat.crud.plus.FIELD;
import com.jfeat.am.module.cinema.services.gen.persistence.model.CinemaLine;
import com.jfeat.am.module.cinema.services.gen.persistence.dao.CinemaLineMapper;
import com.jfeat.am.module.cinema.services.gen.crud.service.CRUDCinemaLineService;
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
 *CRUDCinemaLineService
 * @author Code generator
 * @since 2020-09-10
 */

@Service
public class CRUDCinemaLineServiceImpl  extends CRUDServiceOnlyImpl<CinemaLine> implements CRUDCinemaLineService {





        @Resource
        protected CinemaLineMapper cinemaLineMapper;

        @Override
        protected BaseMapper<CinemaLine> getMasterMapper() {
                return cinemaLineMapper;
        }







}


