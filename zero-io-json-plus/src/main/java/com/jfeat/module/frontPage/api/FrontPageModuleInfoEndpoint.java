package com.jfeat.module.frontPage.api;


import com.jfeat.module.frontPage.services.domain.dao.QueryFrontPageModuleInfoDao;
import com.jfeat.module.frontPage.services.domain.model.FrontPageModuleInfoRecord;
import com.jfeat.module.frontPage.services.domain.service.FrontPageModuleInfoService;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPageModuleInfo;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;


import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.List;

/**
 * <p>
 * api
 * </p>
 *
 * @author Code generator
 * @since 2022-09-28
 */
@RestController

@Api("页面模块")
@RequestMapping("/api/crud/frontPageModuleInfo")
public class FrontPageModuleInfoEndpoint {

    @Resource
    FrontPageModuleInfoService frontPageModuleInfoService;


    @Resource
    QueryFrontPageModuleInfoDao queryFrontPageModuleInfoDao;



    @ApiOperation(value = "FrontPageModuleInfo 列表信息", response = FrontPageModuleInfoRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "pageId", dataType = "Long"),
            @ApiImplicitParam(name = "moduleName", dataType = "String"),
            @ApiImplicitParam(name = "moduleJson", dataType = "String"),
            @ApiImplicitParam(name = "frontPageId", dataType = "Long"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryFrontPageModuleInfos(Page<FrontPageModuleInfoRecord> page,
                                         @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                         @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                                         @RequestParam(name = "search", required = false) String search,
                                         @RequestParam(name = "id", required = false) Long id,

                                         @RequestParam(name = "pageId", required = false) Long pageId,

                                         @RequestParam(name = "moduleName", required = false) String moduleName,
                                         @RequestParam(name = "moduleType", required = false) String moduleType,
                                         @RequestParam(name = "moduleJson", required = false) String moduleJson,
                                         @RequestParam(name = "title", required = false) String title,
                                         @RequestParam(name = "frontPageId", required = false) Long frontPageId,
                                         @RequestParam(name = "orderBy", required = false) String orderBy,
                                         @RequestParam(name = "sort", required = false) String sort,
                                         @RequestParam(name = "synchronization" ,defaultValue = "true")Boolean synchronization) {

        if (orderBy != null && orderBy.length() > 0) {
            if (sort != null && sort.length() > 0) {
                String pattern = "(ASC|DESC|asc|desc)";
                if (!sort.matches(pattern)) {
                    throw new BusinessException(BusinessCode.BadRequest.getCode(), "sort must be ASC or DESC");//此处异常类型根据实际情况而定
                }
            } else {
                sort = "ASC";
            }
            orderBy = "`" + orderBy + "`" + " " + sort;
        }
        page.setCurrent(pageNum);
        page.setSize(pageSize);

        FrontPageModuleInfoRecord record = new FrontPageModuleInfoRecord();
        record.setId(id);
        record.setPageId(pageId);
        record.setItemModuleName(moduleName);
        record.setFrontPageId(frontPageId);
        record.setTitle(title);
        record.setModuleType(moduleType);

        if(synchronization){
            Integer integer = frontPageModuleInfoService.updatePageModule(moduleType);
        }

        List<FrontPageModuleInfoRecord> frontPageModuleInfoPage = queryFrontPageModuleInfoDao.findFrontPageModuleInfoPage(page, record, search, orderBy, null, null);

        page.setRecords(frontPageModuleInfoPage);

        return SuccessTip.create(page);
    }


    @GetMapping("/pageList")
    public Tip getPageModule(@RequestParam(name = "moduleType", required = false) String moduleType){
        List<FrontPageModuleInfoModel> pageModules = frontPageModuleInfoService.getPageModules(moduleType);
        return SuccessTip.create(pageModules);
    }

    @PutMapping("/synchronizationData")
    public Tip synchronizationData(@RequestParam(name = "moduleType", required = false) String moduleType){
        Integer integer = frontPageModuleInfoService.updatePageModule(moduleType);
        return SuccessTip.create(integer);
    }




}
