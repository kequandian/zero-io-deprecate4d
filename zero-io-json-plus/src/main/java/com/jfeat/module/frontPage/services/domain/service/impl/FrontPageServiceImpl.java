package com.jfeat.module.frontPage.services.domain.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.module.frontPage.services.domain.service.FrontPageService;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.crud.service.impl.CRUDFrontPageServiceImpl;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author admin
 * @since 2017-10-16
 */

@Service("frontPageService")
public class FrontPageServiceImpl extends CRUDFrontPageServiceImpl implements FrontPageService {

    @Override
    protected String entityName() {
        return "FrontPage";
    }





}
