package com.jfeat.excel.model;

import io.swagger.annotations.ApiModelProperty;
import lombok.AccessLevel;
import lombok.Data;
import lombok.experimental.FieldDefaults;

import javax.validation.constraints.NotNull;
import java.util.HashMap;
import java.util.Map;

/**
 * Created on 2020/7/20.
 *
 * @author Wen Hao
 */
@Data
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ExportParam {

    // @NotNull
    //@ApiModelProperty(value = "导出名称")
    //String exportName;

//    @ApiModelProperty(value = "导出数据来源(api url)")
//    String api;

    //@ApiModelProperty(value = "导出类型, SQL=数据库方式, API=api方式")
    //String type;

//    @ApiModelProperty(value = "查询参数")
//    Map<String, String> search;

    //@ApiModelProperty(value = "转换字典")
    //Map<String, Map<String, String>> dict = new HashMap<>();
}
