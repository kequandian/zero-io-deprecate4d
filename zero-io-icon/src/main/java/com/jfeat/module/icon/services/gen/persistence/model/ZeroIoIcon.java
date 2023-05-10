package com.jfeat.module.icon.services.gen.persistence.model;

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
 * @since 2022-11-11
 */
@TableName("t_zero_io_icon")
@ApiModel(value="ZeroIoIcon对象", description="")
public class ZeroIoIcon extends Model<ZeroIoIcon> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;

      @ApiModelProperty(value = "名称")
      private String name;

      @ApiModelProperty(value = "标题")
      private String title;

      @ApiModelProperty(value = "描述")
      private String note;

      @ApiModelProperty(value = "路径")
      private String path;

      @ApiModelProperty(value = "摘要")
      private String checkSum;

      @ApiModelProperty(value = "是否逻辑删除")
      private Integer flag;

      @ApiModelProperty(value = "创建时间")
      private Date createTime;

      @ApiModelProperty(value = "更新时间")
      private Date updateTime;

    
    public Long getId() {
        return id;
    }

      public ZeroIoIcon setId(Long id) {
          this.id = id;
          return this;
      }
    
    public String getName() {
        return name;
    }

      public ZeroIoIcon setName(String name) {
          this.name = name;
          return this;
      }
    
    public String getTitle() {
        return title;
    }

      public ZeroIoIcon setTitle(String title) {
          this.title = title;
          return this;
      }
    
    public String getNote() {
        return note;
    }

      public ZeroIoIcon setNote(String note) {
          this.note = note;
          return this;
      }
    
    public String getPath() {
        return path;
    }

      public ZeroIoIcon setPath(String path) {
          this.path = path;
          return this;
      }
    
    public String getCheckSum() {
        return checkSum;
    }

      public ZeroIoIcon setCheckSum(String checkSum) {
          this.checkSum = checkSum;
          return this;
      }
    
    public Integer getFlag() {
        return flag;
    }

      public ZeroIoIcon setFlag(Integer flag) {
          this.flag = flag;
          return this;
      }
    
    public Date getCreateTime() {
        return createTime;
    }

      public ZeroIoIcon setCreateTime(Date createTime) {
          this.createTime = createTime;
          return this;
      }
    
    public Date getUpdateTime() {
        return updateTime;
    }

      public ZeroIoIcon setUpdateTime(Date updateTime) {
          this.updateTime = updateTime;
          return this;
      }

      public static final String ID = "id";

      public static final String NAME = "name";

      public static final String TITLE = "title";

      public static final String NOTE = "note";

      public static final String PATH = "path";

      public static final String CHECK_SUM = "check_sum";

      public static final String FLAG = "flag";

      public static final String CREATE_TIME = "create_time";

      public static final String UPDATE_TIME = "update_time";

      @Override
    protected Serializable pkVal() {
          return this.id;
      }

    @Override
    public String toString() {
        return "ZeroIoIcon{" +
              "id=" + id +
                  ", name=" + name +
                  ", title=" + title +
                  ", note=" + note +
                  ", path=" + path +
                  ", checkSum=" + checkSum +
                  ", flag=" + flag +
                  ", createTime=" + createTime +
                  ", updateTime=" + updateTime +
              "}";
    }
}
