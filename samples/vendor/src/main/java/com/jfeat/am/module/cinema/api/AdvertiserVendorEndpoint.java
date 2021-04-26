package com.jfeat.am.module.cinema.api;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.am.common.annotation.Permission;
import com.jfeat.am.core.jwt.JWTKit;
import com.jfeat.am.module.cinema.api.permission.AdvertiserVendorPermission;
import com.jfeat.am.module.cinema.services.domain.dao.QueryAdvertiserDao;
import com.jfeat.am.module.cinema.services.domain.model.AdvertiserRecord;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.plus.META;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.math.BigDecimal;
import java.util.Date;


/**
 * <p>
 * api
 * </p>
 *
 * @author Code generator
 * @since 2020-09-10
 */
@RestController

@Api("Advertiser")
@RequestMapping("/api/crud/advertiser/advertisers")
public class AdvertiserVendorEndpoint {

    @Resource
    QueryAdvertiserDao queryAdvertiserDao;

/*    @Permission(AdvertiserVendorPermission.ADVERTISER_VIEW)*/
    @ApiOperation(value = "Advertiser 列表信息", response = AdvertiserRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "companyName", dataType = "String"),
            @ApiImplicitParam(name = "contactName", dataType = "String"),
            @ApiImplicitParam(name = "contactPhone", dataType = "String"),
            @ApiImplicitParam(name = "contactId", dataType = "Long"),
            @ApiImplicitParam(name = "balance", dataType = "BigDecimal"),
            @ApiImplicitParam(name = "comeFrom", dataType = "Integer"),
            @ApiImplicitParam(name = "status", dataType = "String"),
            @ApiImplicitParam(name = "address", dataType = "String"),
            @ApiImplicitParam(name = "shopkeeperId", dataType = "Long"),
            @ApiImplicitParam(name = "orgId", dataType = "Long"),
            @ApiImplicitParam(name = "loginTime", dataType = "Date"),
            @ApiImplicitParam(name = "createTime", dataType = "Date"),
            @ApiImplicitParam(name = "updateTime", dataType = "Date"),
            @ApiImplicitParam(name = "note", dataType = "String"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryAdvertisers(Page<AdvertiserRecord> page,
                                @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                                @RequestParam(name = "search", required = false) String search,
                                @RequestParam(name = "id", required = false) Long id,
                                @RequestParam(name = "companyName", required = false) String companyName,
                                @RequestParam(name = "contactName", required = false) String contactName,
                                @RequestParam(name = "contactPhone", required = false) String contactPhone,
                                @RequestParam(name = "contactId", required = false) Long contactId,
                                @RequestParam(name = "balance", required = false) BigDecimal balance,
                                @RequestParam(name = "comeFrom", required = false) Integer comeFrom,
                                @RequestParam(name = "status", required = false) String status,
                                @RequestParam(name = "address", required = false) String address,
                                @RequestParam(name = "shopkeeperId", required = false) Long shopkeeperId,
                                @RequestParam(name = "orgId", required = false) Long orgId,
                                @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                                @RequestParam(name = "loginTime", required = false) Date loginTime,
                                @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                                @RequestParam(name = "createTime", required = false) Date createTime,
                                @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                                @RequestParam(name = "updateTime", required = false) Date updateTime,
                                @RequestParam(name = "note", required = false) String note,
                                @RequestParam(name = "orderBy", required = false) String orderBy,
                                @RequestParam(name = "sort", required = false) String sort) {
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

        AdvertiserRecord record = new AdvertiserRecord();
        record.setId(id);
        record.setCompanyName(companyName);
        record.setContactName(contactName);
        record.setContactPhone(contactPhone);
        record.setContactId(contactId);
        record.setBalance(balance);
        record.setComeFrom(comeFrom);
        record.setStatus(status);
        record.setAddress(address);
        record.setAssistantId(shopkeeperId);
        if (META.enabledSaaS()) {
            record.setOrgId(JWTKit.getOrgId());
        }
        record.setLoginTime(loginTime);
        record.setCreateTime(createTime);
        record.setUpdateTime(updateTime);
        record.setNote(note);
        Integer userType = JWTKit.getUserType();
        Long userId = JWTKit.getUserId();
        page.setRecords(queryAdvertiserDao.findAdvertiserPage(page, record, search, orderBy, null, null,userType,userId));

        return SuccessTip.create(page);
    }




}
