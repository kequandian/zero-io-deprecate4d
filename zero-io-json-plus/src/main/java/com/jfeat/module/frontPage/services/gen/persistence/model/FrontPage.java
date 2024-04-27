package com.jfeat.module.frontPage.services.gen.persistence.model;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.util.Date;

import com.baomidou.mybatisplus.annotation.TableId;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * <p>
 *
 * </p>
 *
 * @author Code generator
 * @since 2022-09-06
 */
@TableName("t_front_page")
@ApiModel(value = "FrontPage对象", description = "")
public class FrontPage extends Model<FrontPage> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "pageName ")
    private String pageName;
    @ApiModelProperty(value = "前端传的唯一数值")
    private String pageId;

    @ApiModelProperty(value = "标题")
    private String title;

    @ApiModelProperty(value = "页面描述")
    private String pageDescrip;

    @ApiModelProperty(value = "页面配置json数据")
    private String content;

    @ApiModelProperty(value = "appid")
    private String appid;

    @ApiModelProperty(value = "json文件名")
    private String jsonName;

    @ApiModelProperty(value = "json文件路径")
    private String jsonPath;

    @ApiModelProperty(value = "创建时间")
    private Date createTime;

    @ApiModelProperty(value = "更新时间")
    private Date updateTime;

    private Integer templateStatus;

    private String tag;


    @TableField(exist = false)
    private JSONObject extra;

    @TableField(exist = false)
    private String tags;

    @TableField(exist = false)
    private String tagIds;

    private String type;

    private String moduleName;

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public JSONObject getExtra() {
        return extra;
    }

    public void setExtra(JSONObject extra) {
        this.extra = extra;
    }

    public String getTagIds() {
        return tagIds;
    }

    public void setTagIds(String tagIds) {
        this.tagIds = tagIds;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }



    public Long getId() {
        return id;
    }

    public FrontPage setId(Long id) {
        this.id = id;
        return this;
    }

    public Integer getTemplateStatus() {
        return templateStatus;
    }

    public void setTemplateStatus(Integer templateStatus) {
        this.templateStatus = templateStatus;
    }


    public String getPageId() {
        return pageId;
    }

    public void setPageId(String pageId) {
        this.pageId = pageId;
    }

    public String getTitle() {
        return title;
    }

    public FrontPage setTitle(String title) {
        this.title = title;
        return this;
    }

    public String getPageDescrip() {
        return pageDescrip;
    }

    public FrontPage setPageDescrip(String pageDescrip) {
        this.pageDescrip = pageDescrip;
        return this;
    }

    public String getContent() {
        return content;
    }

    public FrontPage setContent(String content) {
        this.content = content;
        return this;
    }

    public String getAppid() {
        return appid;
    }

    public FrontPage setAppid(String appid) {
        this.appid = appid;
        return this;
    }

    public String getJsonName() {
        return jsonName;
    }

    public FrontPage setJsonName(String jsonName) {
        this.jsonName = jsonName;
        return this;
    }

    public String getJsonPath() {
        return jsonPath;
    }

    public FrontPage setJsonPath(String jsonPath) {
        this.jsonPath = jsonPath;
        return this;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public FrontPage setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public FrontPage setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
        return this;
    }

    public static final String ID = "id";

    public static final String PAGE_NAME="page_name";

    public static final String PAGE_ID = "page_id";

    public static final String TITLE = "title";

    public static final String PAGE_DESCRIP = "page_descrip";

    public static final String CONTENT = "content";

    public static final String APPID = "appid";

    public static final String JSON_NAME = "json_name";

    public static final String JSON_PATH = "json_path";

    public static final String CREATE_TIME = "create_time";

    public static final String UPDATE_TIME = "update_time";

    public static final String  TEMPLATE_STATUS="template_status";

    public static final Integer TEMPLATE_STATUS_YES = 1;

    public static final Integer TEMPLATE_STATUS_NO = 0;

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "FrontPage{" +
                "id=" + id +
                ", pageId=" + pageId +
                ", title=" + title +
                ", pageDescrip=" + pageDescrip +
                ", content=" + content +
                ", appid=" + appid +
                ", jsonName=" + jsonName +
                ", jsonPath=" + jsonPath +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                "}";
    }
}
