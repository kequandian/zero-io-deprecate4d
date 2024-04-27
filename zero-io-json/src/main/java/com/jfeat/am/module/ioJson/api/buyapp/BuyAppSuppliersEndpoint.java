package com.jfeat.am.module.ioJson.api.buyapp;

import com.alibaba.fastjson.JSONArray;
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
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;


@RestController

@Api("mock data测试用")
@RequestMapping("/api/u/v1/suppliers")
public class BuyAppSuppliersEndpoint {

    @Resource
    MockJsonService mockJsonService;

    @Resource
    QueryFrontPageDao queryFrontPageDao;


    @Resource
    MockDataBaseService mockDataBaseService;

    @Resource
    FrontPageMapper frontPageMapper;

    @GetMapping("/{id}/products")
    @ApiOperation(value = "查看 Json")
    public Tip getJson(@PathVariable(value = "id") Long id) {

        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID, id);
        FrontPage frontPage = frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        return SuccessTip.create(json);
//        return SuccessTip.create(mockJsonService.readJsonFile(id));
    }


    @PostMapping("/{id}/products")
    @ApiOperation(value = "增加Json")
    public Tip addJson(@PathVariable("id") Long id, @RequestParam(value = "index",required = false) Integer index, @RequestBody JSONObject entity) {
        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID, id);
        FrontPage frontPage = frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        if (json != null) {
            if (json.containsKey("data")&&json.get("data") instanceof JSONArray) {
                JSONArray jsonArray = json.getJSONArray("data");
                if (index!=null){
                    jsonArray.add(index.intValue(),entity);
                }else {
                    jsonArray.add(entity);
                }
            }else {
                JSONArray jsonArray = new JSONArray();
                jsonArray.add(entity);
                json.put("data",jsonArray);
            }
            mockJsonService.saveJsonToFile(json,id);
            return SuccessTip.create(1);
        }
        return SuccessTip.create();
    }


    @GetMapping("/{id}/products/{index}")
    public Tip getListDetails(@PathVariable("id") Long id, @PathVariable("index") Integer index) {
        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID, id);
        FrontPage frontPage = frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        if (json != null && json.containsKey("data")) {
            if (json.get("data") instanceof JSONArray) {
                JSONArray jsonArray = json.getJSONArray("data");
                return SuccessTip.create(jsonArray.get(index));
            }
        }
        return SuccessTip.create();
    }

    @PutMapping("/{id}/products/{index}")
    public Tip updateJsonData(@PathVariable("id") Long id, @PathVariable("index") Integer index,@RequestBody JSONObject entity) {
        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID, id);
        FrontPage frontPage = frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        if (json != null && json.containsKey("data")) {
            if (json.get("data") instanceof JSONArray) {
                JSONArray jsonArray = json.getJSONArray("data");
                jsonArray.set(index.intValue(),entity);
                mockJsonService.saveJsonToFile(json,id);
                return SuccessTip.create(1);
            }
        }
        return SuccessTip.create();
    }

    //    删除详情
    @DeleteMapping("/{id}/products/{index}")
    public Tip deleteJsonData(@PathVariable("id") Long id, @PathVariable("index") Integer index) {
        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID, id);
        FrontPage frontPage = frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        if (json != null && json.containsKey("data")) {
            if (json.get("data") instanceof JSONArray) {
                JSONArray jsonArray = json.getJSONArray("data");
                jsonArray.remove(index.intValue());
                mockJsonService.saveJsonToFile(json,id);
                return SuccessTip.create(1);
            }
        }
        return SuccessTip.create();
    }
}
