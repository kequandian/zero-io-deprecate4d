package com.jfeat.pdf.api.crud;

import com.baomidou.mybatisplus.plugins.Page;
import com.jfeat.am.module.log.annotation.BusinessLog;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.pdf.services.domain.dao.QueryPdfTableDao;
import com.jfeat.pdf.services.domain.model.PdfTableRecord;
import com.jfeat.pdf.services.domain.service.PdfTableService;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

/**
 * Created on 2020/3/13.
 *
 * @author Wen Hao
 */
@RestController

@RequestMapping("/api/io/crud/pdf/pdfTables")
public class PdfTableEndpoint {

    protected final static Logger logger = LoggerFactory.getLogger(PdfTableEndpoint.class);

    // CRUD

    @Resource
    PdfTableService pdfTableService;

    @Resource
    QueryPdfTableDao queryPdfTableDao;

    @BusinessLog(name = "PdfTable", value = "create PdfTable")
    @PostMapping
    @ApiOperation(value = "新建 PdfTable", response = PdfTable.class)
    public Tip createPdfTable(@RequestBody PdfTable entity) {

        Integer affected = 0;
        try {
            affected = pdfTableService.createMaster(entity);

        } catch (DuplicateKeyException e) {
            throw new BusinessException(BusinessCode.DuplicateKey);
        }

        return SuccessTip.create(affected);
    }

    @BusinessLog(name = "PdfTable", value = "查看 PdfTable")
    @GetMapping("/{id}")
    @ApiOperation(value = "查看 PdfTable", response = PdfTable.class)
    public Tip getPdfTable(@PathVariable Long id) {
        return SuccessTip.create(pdfTableService.retrieveMaster(id));
    }

    @BusinessLog(name = "PdfTable", value = "update PdfTable")
    @PutMapping("/{id}")
    @ApiOperation(value = "修改 PdfTable", response = PdfTable.class)
    public Tip updatePdfTable(@PathVariable Long id, @RequestBody PdfTable entity) {
        entity.setId(id);
        return SuccessTip.create(pdfTableService.updateMaster(entity));
    }

    @BusinessLog(name = "PdfTable", value = "delete PdfTable")
    @DeleteMapping("/{id}")
    @ApiOperation("删除 PdfTable")
    public Tip deletePdfTable(@PathVariable Long id) {
        return SuccessTip.create(pdfTableService.deleteMaster(id));
    }

    @BusinessLog(name = "PdfTable", value = "查询列表 PdfTable")
    @ApiOperation(value = "PdfTable 列表信息", response = PdfTableRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "name", dataType = "String"),
            @ApiImplicitParam(name = "editable", dataType = "Integer"),
            @ApiImplicitParam(name = "type", dataType = "String"),
            @ApiImplicitParam(name = "api", dataType = "String"),
            @ApiImplicitParam(name = "headerField", dataType = "String"),
            @ApiImplicitParam(name = "field", dataType = "String"),
            @ApiImplicitParam(name = "templateContent", dataType = "String"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryPdfTables(Page<PdfTableRecord> page,
                              @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                              @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                              @RequestParam(name = "search", required = false) String search,
                              @RequestParam(name = "id", required = false) Long id,
                              @RequestParam(name = "name", required = false) String name,
                              @RequestParam(name = "editable", required = false) Integer editable,
                              @RequestParam(name = "type", required = false) String type,
                              @RequestParam(name = "api", required = false) String api,
                              @RequestParam(name = "headerField", required = false) String headerField,
                              @RequestParam(name = "field", required = false) String field,
                              @RequestParam(name = "templateContent", required = false) String templateContent,
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

        PdfTableRecord record = new PdfTableRecord();
        record.setId(id);
        record.setName(name);
        record.setEditable(editable);
        record.setType(type);
        record.setApi(api);
        record.setHeaderField(headerField);
        record.setField(field);
        record.setTemplateContent(templateContent);
        page.setRecords(queryPdfTableDao.findPdfTablePage(page, record, search, orderBy, null, null));
        return SuccessTip.create(page);
    }

    // find editable

    @GetMapping("/editable")
    public Tip findPdfTablesEditable() {
        return SuccessTip.create(queryPdfTableDao.findPdfTablesEditable());
    }
}
