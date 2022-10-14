
package com.jfeat.module.frontPage.services.gen.persistence.model;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author Code generator
 * @since 2022-09-28
 */
@TableName("t_front_page_module_info")
public class FrontPageModuleInfo extends Model<FrontPageModuleInfo> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;



    private Long pageId;

    private String itemModuleName;

    private String moduleType;



    private Long frontPageId;

    private String title;




    public Long getId() {
        return id;
    }

      public FrontPageModuleInfo setId(Long id) {
          this.id = id;
          return this;
      }
    
    public Long getPageId() {
        return pageId;
    }

      public FrontPageModuleInfo setPageId(Long pageId) {
          this.pageId = pageId;
          return this;
      }


    public String getItemModuleName() {
        return itemModuleName;
    }

    public void setItemModuleName(String itemModuleName) {
        this.itemModuleName = itemModuleName;
    }

    public String getModuleType() {
        return moduleType;
    }

    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }


    
    public Long getFrontPageId() {
        return frontPageId;
    }

      public FrontPageModuleInfo setFrontPageId(Long frontPageId) {
          this.frontPageId = frontPageId;
          return this;
      }

      public static final String ID = "id";

      public static final String PAGE_ID = "page_id";

      public static final String MODULE_NAME = "module_name";

      public static final String MODULE_JSON = "module_json";

      public static final String FRONT_PAGE_ID = "front_page_id";

      @Override
    protected Serializable pkVal() {
          return this.id;
      }

    @Override
    public String toString() {
        return "FrontPageModuleInfo{" +
              "id=" + id +
                  ", pageId=" + pageId +
                  ", moduleName=" + itemModuleName +
                  ", frontPageId=" + frontPageId +
              "}";
    }
}
