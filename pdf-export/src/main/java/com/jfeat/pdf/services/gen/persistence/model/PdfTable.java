package com.jfeat.pdf.services.gen.persistence.model;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Code Generator
 * @since 2020-03-13
 */
@TableName("io_pdf_table")
public class PdfTable extends Model<PdfTable> {

    @TableField(exist = false)
    private com.alibaba.fastjson.JSONObject extra;

    public com.alibaba.fastjson.JSONObject getExtra() {
        return extra;
    }
    public void setExtra(com.alibaba.fastjson.JSONObject extra) {
        this.extra = extra;
    }


    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Long id;
    /**
     * 列表名
     */
	private String name;
    /**
     * 可编辑
     */
	private Integer editable;
    /**
     * 类别(api 或 statistics)
     */
	private String type;
    /**
     * 绑定api
     */
	private String api;
	/**
	 * api返回的字段
	 */
	@TableField("api_field")
	private String apiField;
	/**
	 * api返回的列表字段
	 */
	@TableField("api_list")
	private String apiList;
    /**
     * api返回数据的键值
     */
	@TableField("header_field")
	private String headerField;
    /**
     * 自动报表的field
     */
	private String field;
    /**
     * 模版内容
     */
	@TableField("template_content")
	private String templateContent;

	/**
	 * 前端模版内容
	 */
	@TableField("origin_config")
	private String originConfig;

	@TableField("sub_apis")
	private String subApis;


	public Long getId() {
		return id;
	}

	public PdfTable setId(Long id) {
		this.id = id;
		return this;
	}

	public String getName() {
		return name;
	}

	public PdfTable setName(String name) {
		this.name = name;
		return this;
	}

	public Integer getEditable() {
		return editable;
	}

	public PdfTable setEditable(Integer editable) {
		this.editable = editable;
		return this;
	}

	public String getType() {
		return type;
	}

	public PdfTable setType(String type) {
		this.type = type;
		return this;
	}

	public String getApi() {
		return api;
	}

	public PdfTable setApi(String api) {
		this.api = api;
		return this;
	}

	public String getApiField() {
		return apiField;
	}

	public void setApiField(String apiField) {
		this.apiField = apiField;
	}

	public String getApiList() {
		return apiList;
	}

	public void setApiList(String apiList) {
		this.apiList = apiList;
	}

	public String getHeaderField() {
		return headerField;
	}

	public PdfTable setHeaderField(String headerField) {
		this.headerField = headerField;
		return this;
	}

	public String getField() {
		return field;
	}

	public PdfTable setField(String field) {
		this.field = field;
		return this;
	}

	public String getTemplateContent() {
		return templateContent;
	}

	public PdfTable setTemplateContent(String templateContent) {
		this.templateContent = templateContent;
		return this;
	}

	public String getSubApis() {
		return subApis;
	}

	public void setSubApis(String subApis) {
		this.subApis = subApis;
	}

	public String getOriginConfig() {
		return originConfig;
	}

	public void setOriginConfig(String originConfig) {
		this.originConfig = originConfig;
	}

	public static final String ID = "id";

	public static final String NAME = "name";

	public static final String EDITABLE = "editable";

	public static final String TYPE = "type";

	public static final String API = "api";

	public static final String HEADER_FIELD = "header_field";

	public static final String FIELD = "field";

	public static final String TEMPLATE_CONTENT = "template_content";

	public static final String ORIGIN_CONFIG = "origin_config";

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	@Override
	public String toString() {
		return "PdfTable{" +
			"id=" + id +
			", name=" + name +
			", editable=" + editable +
			", type=" + type +
			", api=" + api +
			", headerField=" + headerField +
			", field=" + field +
			", templateContent=" + templateContent +
			"}";
	}
}
