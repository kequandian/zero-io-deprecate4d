
package com.jfeat.module.icon.api.manage;


import com.jfeat.crud.plus.META;
import com.jfeat.am.core.jwt.JWTKit;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.GetMapping;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.dao.DuplicateKeyException;
import com.jfeat.module.icon.services.domain.dao.QueryZeroIoIconDao;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.request.Ids;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.annotation.BusinessLog;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.plus.CRUDObject;
import com.jfeat.crud.plus.DefaultFilterResult;
import com.jfeat.module.icon.api.permission.*;
import com.jfeat.am.common.annotation.Permission;

import java.math.BigDecimal;

import com.jfeat.module.icon.services.domain.service.*;
import com.jfeat.module.icon.services.domain.model.ZeroIoIconRecord;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;

import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

import com.alibaba.fastjson.JSONArray;

/**
 * <p>
 * api
 * </p>
 *
 * @author Code generator
 * @since 2022-11-11
 */
@RestController
@Api("ZeroIoIcon")
@RequestMapping("/api/crud/icon/zeroIoIcon/zeroIoIcons")
public class ZeroIoIconEndpoint {

    @Resource
    ZeroIoIconService zeroIoIconService;

    @Resource
    QueryZeroIoIconDao queryZeroIoIconDao;


    @BusinessLog(name = "ZeroIoIcon", value = "create ZeroIoIcon")
    @Permission(ZeroIoIconPermission.ZEROIOICON_NEW)
    @PostMapping
    @ApiOperation(value = "新建 ZeroIoIcon", response = ZeroIoIcon.class)
    public Tip createZeroIoIcon(@RequestBody ZeroIoIcon entity) {
        Integer affected = 0;
        try {
            affected = zeroIoIconService.createMaster(entity);
        } catch (DuplicateKeyException e) {
            throw new BusinessException(BusinessCode.DuplicateKey);
        }

        return SuccessTip.create(affected);
    }

    @Permission(ZeroIoIconPermission.ZEROIOICON_VIEW)
    @GetMapping("/{id}")
    @ApiOperation(value = "查看 ZeroIoIcon", response = ZeroIoIcon.class)
    public Tip getZeroIoIcon(@PathVariable Long id) {
        return SuccessTip.create(zeroIoIconService.queryMasterModel(queryZeroIoIconDao, id));
    }

    @BusinessLog(name = "ZeroIoIcon", value = "update ZeroIoIcon")
    @Permission(ZeroIoIconPermission.ZEROIOICON_EDIT)
    @PutMapping("/{id}")
    @ApiOperation(value = "修改 ZeroIoIcon", response = ZeroIoIcon.class)
    public Tip updateZeroIoIcon(@PathVariable Long id, @RequestBody ZeroIoIcon entity) {
        entity.setId(id);
        return SuccessTip.create(zeroIoIconService.updateMaster(entity));
    }

    @BusinessLog(name = "ZeroIoIcon", value = "delete ZeroIoIcon")
    @Permission(ZeroIoIconPermission.ZEROIOICON_DELETE)
    @DeleteMapping("/{id}")
    @ApiOperation("删除 ZeroIoIcon")
    public Tip deleteZeroIoIcon(@PathVariable Long id) {
        return SuccessTip.create(zeroIoIconService.deleteMaster(id));
    }

    @Permission(ZeroIoIconPermission.ZEROIOICON_VIEW)
    @ApiOperation(value = "ZeroIoIcon 列表信息", response = ZeroIoIconRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "name", dataType = "String"),
            @ApiImplicitParam(name = "title", dataType = "String"),
            @ApiImplicitParam(name = "note", dataType = "String"),
            @ApiImplicitParam(name = "path", dataType = "String"),
            @ApiImplicitParam(name = "checkSum", dataType = "String"),
            @ApiImplicitParam(name = "flag", dataType = "Integer"),
            @ApiImplicitParam(name = "createTime", dataType = "Date"),
            @ApiImplicitParam(name = "updateTime", dataType = "Date"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryZeroIoIconPage(Page<ZeroIoIconRecord> page,
                                   @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                   @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                                   // for tag feature query
                                   @RequestParam(name = "tag", required = false) String tag,
                                   // end tag
                                   @RequestParam(name = "search", required = false) String search,

                                   @RequestParam(name = "name", required = false) String name,

                                   @RequestParam(name = "title", required = false) String title,

                                   @RequestParam(name = "note", required = false) String note,

                                   @RequestParam(name = "path", required = false) String path,

                                   @RequestParam(name = "checkSum", required = false) String checkSum,

                                   @RequestParam(name = "flag", required = false) Integer flag,

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

        ZeroIoIconRecord record = new ZeroIoIconRecord();
        record.setName(name);
        record.setTitle(title);
        record.setNote(note);
        record.setPath(path);
        record.setCheckSum(checkSum);
        record.setFlag(flag);
        record.setCreateTime(createTime);
        record.setUpdateTime(updateTime);


        List<ZeroIoIconRecord> zeroIoIconPage = queryZeroIoIconDao.findZeroIoIconPage(page, record, tag, search, orderBy, null, null);


        page.setRecords(zeroIoIconPage);

        return SuccessTip.create(page);
    }
}

