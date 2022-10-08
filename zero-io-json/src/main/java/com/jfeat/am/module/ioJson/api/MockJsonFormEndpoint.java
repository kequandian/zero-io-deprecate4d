package com.jfeat.am.module.ioJson.api;


import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.am.module.ioJson.services.domain.service.MockDataBaseService;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.module.frontPage.services.domain.dao.QueryFrontPageDao;
import com.jfeat.module.frontPage.services.domain.model.FrontPageRecord;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.apache.ibatis.annotations.Param;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Date;
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

@Api("表单用")
@RequestMapping("/form")
public class MockJsonFormEndpoint {

    @Resource
    MockJsonService mockJsonService;

    @Resource
    QueryFrontPageDao queryFrontPageDao;


    @Resource
    MockDataBaseService mockDataBaseService;

    @Resource
    FrontPageMapper frontPageMapper;


    @GetMapping("")
    @ApiOperation(value = "查看 Json")
    public Tip getJson(@Param(value = "id") Long id) {

        QueryWrapper<FrontPage> queryWrapper = new QueryWrapper<>();
        queryWrapper.eq(FrontPage.PAGE_ID,id);
        FrontPage frontPage =  frontPageMapper.selectOne(queryWrapper);
        String content = frontPage.getContent();
        JSONObject json = JSONObject.parseObject(content);
        return SuccessTip.create(json);
//        return SuccessTip.create(mockJsonService.readJsonFile(id));
    }

    @GetMapping("/byTag/{tag}")
    @ApiOperation(value = "查看 Json")
    public Tip getJson(@PathVariable(value = "tag") String tag) {
        return SuccessTip.create(mockJsonService.readJsonFile(null,tag));
    }

    @PostMapping("/{id}")
    @ApiOperation(value = "增加Json")
    public Tip addJson(@PathVariable Long id, @RequestBody JSONObject json, @RequestParam(value = "appid", required = false) String appid) {
        String originAppid = mockJsonService.getAppId();
        if (appid != null) {
            mockJsonService.setAppId(appid);
        }
        Integer integer = mockJsonService.saveJsonToFile(json, id);
        mockJsonService.setAppId(originAppid);
        return SuccessTip.create(integer);
    }

    @PostMapping("/{id}/{tag}")
    @ApiOperation(value = "增加Json 带tag")
    public Tip addJsonTag(@PathVariable String tag,@PathVariable Long id, @RequestBody JSONObject json) {
        Integer integer = mockJsonService.saveJsonToFile(json, id,tag);
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

//    @GetMapping("/setAppId/{id}")
//    @ApiOperation(value = "设置 appId")
//    public Tip setAppId(@PathVariable(name = "id") String id) {
//        mockJsonService.setAppId(id);
//        return SuccessTip.create(mockJsonService.getAppId());
//    }
//
//    @GetMapping("/getAppId")
//    @ApiOperation(value = "查看 当前appId")
//    public Tip getAppId() {
//        return SuccessTip.create(mockJsonService.getAppId());
//    }


    @PostMapping("/synchronizationToDataBase")
    public Tip synchronizationToDataBase() {
        return SuccessTip.create(mockDataBaseService.synchronizationToDataBase());
    }


    @GetMapping("/allPages")
    public Tip getAllPages(Page<FrontPageRecord> page,
                           @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                           @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                           // for tag feature query
                           @RequestParam(name = "tag", required = false) String tag,
                           // end tag
                           @RequestParam(name = "search", required = false) String search,

                           @RequestParam(name = "count", required = false) String pageId,

                           @RequestParam(name = "title", required = false) String title,

                           @RequestParam(name = "pageDescrip", required = false) String pageDescrip,

                           @RequestParam(name = "content", required = false) String content,

                           @RequestParam(name = "appid", required = false) String appid,

                           @RequestParam(name = "jsonName", required = false) String jsonName,

                           @RequestParam(name = "jsonPath", required = false) String jsonPath,

                           @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                           @RequestParam(name = "createTime", required = false) Date createTime,

                           @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                           @RequestParam(name = "updateTime", required = false) Date updateTime,
                           @RequestParam(name = "orderBy", required = false) String orderBy,
                           @RequestParam(name = "sort", required = false) String sort) {

        if (orderBy != null && orderBy.length() > 0) {
            if (sort != null && sort.length() > 0) {
                String sortPattern = "(ASC|DESC|asc|desc)";
                if (!sort.matches(sortPattern)) {
                    throw new BusinessException(BusinessCode.BadRequest.getCode(), "sort must be ASC or DESC");//此处异常类型根据实际情况而定
                }
            } else {
                sort = "ASC";
            }
            orderBy = "`" + orderBy + "`" + " " + sort;
        }
        page.setCurrent(pageNum);
        page.setSize(pageSize);

        FrontPageRecord record = new FrontPageRecord();
        record.setPageId(pageId);
        record.setTitle(title);
        record.setPageDescrip(pageDescrip);
        record.setContent(content);
        record.setAppid(appid);
        record.setJsonName(jsonName);
        record.setJsonPath(jsonPath);
        record.setCreateTime(createTime);
        record.setUpdateTime(updateTime);


        List<FrontPageRecord> frontPagePage = queryFrontPageDao.findFrontPagePage(page, record, tag, search, orderBy, null, null);


        page.setRecords(frontPagePage);

        return SuccessTip.create(page);
    }


}
