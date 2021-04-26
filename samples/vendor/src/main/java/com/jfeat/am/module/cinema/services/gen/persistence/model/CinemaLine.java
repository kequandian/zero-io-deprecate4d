package com.jfeat.am.module.cinema.services.gen.persistence.model;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Code generator
 * @since 2020-09-10
 */
@TableName("ca_cinema_line")
public class CinemaLine extends Model<CinemaLine> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;

      /**
        * 影线名
        */
    private String name;

    private Long orgId;

    private Date createTime;

    private Date updateTime;

      /**
     * 备注
     */
      private String note;

    
    public Long getId() {
        return id;
    }

      public CinemaLine setId(Long id) {
          this.id = id;
          return this;
      }
    
    public String getName() {
        return name;
    }

      public CinemaLine setName(String name) {
          this.name = name;
          return this;
      }
    
    public Long getOrgId() {
        return orgId;
    }

      public CinemaLine setOrgId(Long orgId) {
          this.orgId = orgId;
          return this;
      }
    
    public Date getCreateTime() {
        return createTime;
    }

      public CinemaLine setCreateTime(Date createTime) {
          this.createTime = createTime;
          return this;
      }
    
    public Date getUpdateTime() {
        return updateTime;
    }

      public CinemaLine setUpdateTime(Date updateTime) {
          this.updateTime = updateTime;
          return this;
      }
    
    public String getNote() {
        return note;
    }

      public CinemaLine setNote(String note) {
          this.note = note;
          return this;
      }

      public static final String ID = "id";

      public static final String NAME = "name";

      public static final String ORG_ID = "org_id";

      public static final String CREATED_TIME = "create_time";

      public static final String UPDATE_TIME = "update_time";

      public static final String NOTE = "note";

      @Override
    protected Serializable pkVal() {
          return this.id;
      }

    @Override
    public String toString() {
        return "CinemaLine{" +
              "id=" + id +
                  ", name=" + name +
                  ", orgId=" + orgId +
                  ", createTime=" + createTime +
                  ", updateTime=" + updateTime +
                  ", note=" + note +
              "}";
    }
}
