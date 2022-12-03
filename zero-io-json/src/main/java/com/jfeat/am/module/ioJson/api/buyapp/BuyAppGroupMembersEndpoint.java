package com.jfeat.am.module.ioJson.api.buyapp;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.am.module.ioJson.services.domain.service.MockDataBaseService;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.module.frontPage.services.domain.dao.QueryFrontPageDao;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController

@Api("mock data测试用")
@RequestMapping("/api/u/v1/suppliers")
public class BuyAppGroupMembersEndpoint {



    @Resource
    MockJsonService mockJsonService;

    @Resource
    QueryFrontPageDao queryFrontPageDao;


    @Resource
    MockDataBaseService mockDataBaseService;

    @Resource
    FrontPageMapper frontPageMapper;


}
