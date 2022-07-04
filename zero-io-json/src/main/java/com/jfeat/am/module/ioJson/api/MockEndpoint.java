package com.jfeat.am.module.ioJson.api;


import com.alibaba.fastjson.JSONObject;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.am.module.ioJson.services.domain.service.MockService;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.*;

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

@Api("mock测试用")
@RequestMapping("/mock")
public class MockEndpoint {

    @Resource
    MockService mockService;



    @GetMapping("/{dir}/{name}")
    @ApiOperation(value = "查看 指定文件夹下的mock数据")
    public Tip getMock(@PathVariable(value = "dir") String dir,@PathVariable(value = "name")String name) {
        JSONObject jsonObject = mockService.readJsonFile(name, dir);
        return SuccessTip.create(jsonObject);

    }

    @PostMapping("/{dir}/{name}")
    @ApiOperation(value = "新增mock数据")
    public Tip createMock(@RequestBody JSONObject json,@PathVariable(value = "dir") String dir,@PathVariable(value = "name")String name) {
        Integer integer = mockService.saveJsonToFile(json, name, dir);
        return SuccessTip.create(integer);

    }

    @GetMapping("/{dir}")
    @ApiOperation(value = "查看mock列表")
    public Tip getMockList(@PathVariable(value = "dir") String dir) {
        Map<String, String> nameMap = mockService.getNameMap(dir);
        return SuccessTip.create(nameMap);
    }

    @GetMapping("")
    @ApiOperation(value = "查看mock文件夹列表")
    public Tip getMockDirList() {
        Map<String, String> dirMap = mockService.getDirIdMap();
        return SuccessTip.create(dirMap);
    }
}
