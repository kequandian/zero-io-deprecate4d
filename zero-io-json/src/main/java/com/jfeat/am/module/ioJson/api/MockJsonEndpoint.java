package com.jfeat.am.module.ioJson.api;


import com.alibaba.fastjson.JSONObject;
import com.jfeat.crud.plus.META;
import com.jfeat.am.core.jwt.JWTKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.exception.BusinessCode;

import com.jfeat.am.module.ioJson.services.domain.service.*;
import com.jfeat.am.module.ioJson.services.domain.model.MockJson;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * api
 * </p>
 *
 * @author Code generator
 * @since 2022-05-19
 */
@RestController

@Api("Supplier")
@RequestMapping("/form")
public class MockJsonEndpoint {

    @Resource
    MockJsonService mockJsonService;



    @GetMapping("")
    @ApiOperation(value = "查看 Json")
    public Tip getJson(@Param(value = "id") Long id) {
        return SuccessTip.create(mockJsonService.readJsonFile(id));
    }

    @PostMapping("/{id}")
    @ApiOperation(value = "增加Json")
    public Tip addJson(@PathVariable Long id, @RequestBody JSONObject json) {
        Integer integer = mockJsonService.saveJsonToFile(json,id );
        return SuccessTip.create(integer);
    }

    @GetMapping("/map")
    @ApiOperation(value = "查看 map")
    public Tip getMap() {
        Map<String, String> idMap = mockJsonService.getIdMap();
        return SuccessTip.create(idMap);
    }



}
