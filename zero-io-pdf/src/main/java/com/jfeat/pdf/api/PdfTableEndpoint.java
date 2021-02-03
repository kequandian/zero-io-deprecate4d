package com.jfeat.pdf.api;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created on 2020/3/24.
 *
 * @author Wen Hao
 */
@RestController
@RequestMapping("/api/io/crud/pdf/normal/pdfTables")
public class PdfTableEndpoint {


    // update

    // list

    /*@BusinessLog(name = "PdfTable", value = "查询可编辑列表 PdfTable")
    @ApiOperation(value = "PdfTable 可编辑列表信息", response = PdfTableRecord.class)
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
    @GetMapping
    public Tip listEditablePdfTables(Page<PdfTableRecord> page,
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
        page.setRecords(queryPdfTableDao.findPdfTableEditablePage(page, record, search, orderBy, null, null));
        return SuccessTip.create(page);
    }*/

    // get
}
