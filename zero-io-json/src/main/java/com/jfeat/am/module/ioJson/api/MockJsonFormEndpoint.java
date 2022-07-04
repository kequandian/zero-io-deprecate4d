package com.jfeat.am.module.ioJson.api;


import com.alibaba.fastjson.JSONObject;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;

import com.jfeat.am.module.ioJson.services.domain.service.*;

import javax.annotation.Resource;
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

@Api("表单用")
@RequestMapping("/form")
public class MockJsonFormEndpoint {

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
    @ApiOperation(value = "查看 当前appId下的idmap")
    public Tip getMap() {
        Map<String, String> idMap = mockJsonService.getIdMap();
        return SuccessTip.create(idMap);
    }

    @GetMapping("/appMap")
    @ApiOperation(value = "查看 当前appId下的idmap")
    public Tip getAppIdMap() {
        Map<String, String> idMap = mockJsonService.getAppIdMap();
        return SuccessTip.create(idMap);
    }

    @GetMapping("/setAppId/{id}")
    @ApiOperation(value = "设置 appId")
    public Tip setAppId(@PathVariable (name = "id") String id) {
         mockJsonService.setAppId(id);
        return SuccessTip.create(mockJsonService.getAppId());
    }

    @GetMapping("/getAppId")
    @ApiOperation(value = "查看 当前appId")
    public Tip getAppId() {
        return SuccessTip.create(mockJsonService.getAppId());
    }

}
