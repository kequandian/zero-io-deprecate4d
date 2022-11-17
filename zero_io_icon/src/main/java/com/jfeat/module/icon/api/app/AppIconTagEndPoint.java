package com.jfeat.module.icon.api.app;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.am.crud.tag.services.domain.service.StockTagRelationService;
import com.jfeat.am.crud.tag.services.domain.service.StockTagSDkService;
import com.jfeat.am.crud.tag.services.domain.service.StockTagService;
import com.jfeat.am.crud.tag.services.persistence.dao.StockTagMapper;
import com.jfeat.am.crud.tag.services.persistence.dao.StockTagRelationMapper;
import com.jfeat.am.crud.tag.services.persistence.model.StockTag;
import com.jfeat.am.crud.tag.services.persistence.model.StockTagRelation;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.module.icon.services.domain.service.ZeroIoIconService;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/api/u/zero/iconTag")
public class AppIconTagEndPoint {


    @Resource
    StockTagSDkService stockTagSDkService;

    @Resource
    ZeroIoIconService zeroIoIconService;

    @GetMapping
    public Tip getIconTagList() {
        return SuccessTip.create(stockTagSDkService.getTagList(zeroIoIconService.getEntityName()));
    }

    @PutMapping("/{id}")
    public Tip updateIconTag(@PathVariable Long id, @RequestBody StockTag entity) {
        return SuccessTip.create(stockTagSDkService.updateTag(id,entity,zeroIoIconService.getEntityName()));
    }

    @PostMapping
    public Tip createIconTag(@RequestBody StockTag entity) {

        return SuccessTip.create(stockTagSDkService.createTag(entity,zeroIoIconService.getEntityName()));
    }

    @DeleteMapping("/{id}")
    public Tip deleteIconTag(@PathVariable Long id) {
        return SuccessTip.create(stockTagSDkService.deleteTag(id));
    }

    @PostMapping("/bind")
    public Tip bingIconTag(@RequestBody StockTagRelation entity){

        return SuccessTip.create(stockTagSDkService.bingTag(entity,zeroIoIconService.getEntityName()));

    }

    @PostMapping("/unbind")
    public Tip unbindIconTag(@RequestBody StockTagRelation entity){
        return SuccessTip.create(stockTagSDkService.unbindTag(entity,zeroIoIconService.getEntityName()));
    }
}
