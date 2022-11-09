
package com.jfeat.module.frontPage.api;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.am.common.annotation.Permission;
import com.jfeat.crud.base.annotation.BusinessLog;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.module.frontPage.api.permission.FrontPagePermission;
import com.jfeat.module.frontPage.services.domain.dao.QueryFrontPageDao;
import com.jfeat.module.frontPage.services.domain.model.FrontPageRecord;
import com.jfeat.module.frontPage.services.domain.service.FrontPageService;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.net.URLDecoder;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * api
 * </p>
 *
 * @author Code generator
 * @since 2022-09-06
 */
@RestController
@Api("FrontPage")
@RequestMapping("/api/crud/frontPage/frontPage/frontPages")
public class FrontPageEndpoint {

    @Resource
    FrontPageService frontPageService;



    @Resource
    QueryFrontPageDao queryFrontPageDao;


    @BusinessLog(name = "FrontPage", value = "create FrontPage")
    @Permission(FrontPagePermission.FRONTPAGE_NEW)
    @PostMapping
    @ApiOperation(value = "新建 FrontPage", response = FrontPage.class)
    public Tip createFrontPage(@RequestBody FrontPage entity) {
        Integer affected = 0;
        try {
            affected = frontPageService.createMaster(entity);
        } catch (DuplicateKeyException e) {
            throw new BusinessException(BusinessCode.DuplicateKey);
        }

        return SuccessTip.create(affected);
    }

    @Permission(FrontPagePermission.FRONTPAGE_VIEW)
    @GetMapping("/{id}")
    @ApiOperation(value = "查看 FrontPage", response = FrontPage.class)
    public Tip getFrontPage(@PathVariable Long id) {
        return SuccessTip.create(frontPageService.queryMasterModel(queryFrontPageDao, id));
    }

    @BusinessLog(name = "FrontPage", value = "update FrontPage")
    @Permission(FrontPagePermission.FRONTPAGE_EDIT)
    @PutMapping("/{id}")
    @ApiOperation(value = "修改 FrontPage", response = FrontPage.class)
    public Tip updateFrontPage(@PathVariable Long id, @RequestBody FrontPage entity) {
        entity.setId(id);
        return SuccessTip.create(frontPageService.updateMaster(entity));
    }

    @BusinessLog(name = "FrontPage", value = "delete FrontPage")
    @Permission(FrontPagePermission.FRONTPAGE_DELETE)
    @DeleteMapping("/{id}")
    @ApiOperation("删除 FrontPage")
    public Tip deleteFrontPage(@PathVariable Long id) {
        return SuccessTip.create(frontPageService.deleteMaster(id));
    }

    @Permission(FrontPagePermission.FRONTPAGE_VIEW)
    @ApiOperation(value = "FrontPage 列表信息", response = FrontPageRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "count", dataType = "String"),
            @ApiImplicitParam(name = "title", dataType = "String"),
            @ApiImplicitParam(name = "pageDescrip", dataType = "String"),
            @ApiImplicitParam(name = "content", dataType = "String"),
            @ApiImplicitParam(name = "appid", dataType = "String"),
            @ApiImplicitParam(name = "jsonName", dataType = "String"),
            @ApiImplicitParam(name = "jsonPath", dataType = "String"),
            @ApiImplicitParam(name = "createTime", dataType = "Date"),
            @ApiImplicitParam(name = "updateTime", dataType = "Date"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryFrontPagePage(Page<FrontPageRecord> page,
                                  @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                  @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                                  // for tag feature query
                                  @RequestParam(name = "tag", required = false) String tag,
                                  @RequestParam(name = "tagName", required = false) String tagName,
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

        if (tagName!=null){
            tagName = URLDecoder.decode(tagName);
        }
        System.out.println("================");
        System.out.println(tagName);
        if (tagName.equals("全部")){
            tagName = "";
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

