package com.jfeat.am.module.cinema.services.gen.persistence.model;

import java.math.BigDecimal;

import com.baomidou.mybatisplus.annotation.TableField;
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
@TableName("ca_advertiser")
public class Advertiser extends Model<Advertiser> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;

      /**
     * 公司名
     */
      private String companyName;

      /**
     * 联系人名字
     */
      private String contactName;

      /**
     * 联系人电话
     */
      private String contactPhone;

      /**
     * 联系人id  有id的话按id的信息来 为空按照上面的字段为主
     */
      private Long contactId;

      /**
     * 金额
     */
      private BigDecimal balance;

      /**
     * 来源 0-系统创建 1-用户注册
     */
      private Integer comeFrom;

      /**
     * 状态   PASS-已审核 PENDING_APPROVAL-待审核 REFUSE-已拒绝
     */
      private String status;

      /**
     * 地址
     */
      private String address;

      /**
     * 店小二id
     */
      private Long assistantId;

    private Long orgId;

      /**
     * 最近登录时间
     */
      private Date loginTime;

    private Date createTime;

    private Date updateTime;

      /**
     * 备注
     */
      private String note;


    private  String province;
    private String   city;
    private String   district;
    private String   idCard;
    private String  idCardUrl;
    private String  idCardBackUrl;
    private String   businessLicenseProve;
    private String  businessLicensePhone;
    private String  industry;

    @TableField("x_industry")
    private String  xIndustry;
    @TableField("l_industry")
    private String  lIndustry;
    @TableField("m_industry")
    private String  mIndustry;

    private String avatar;

    public String getAvatar() {
        return avatar;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getIdCardBackUrl() {
        return idCardBackUrl;
    }

    public void setIdCardBackUrl(String idCardBackUrl) {
        this.idCardBackUrl = idCardBackUrl;
    }

    public String getxIndustry() {
        return xIndustry;
    }

    public void setxIndustry(String xIndustry) {
        this.xIndustry = xIndustry;
    }

    public String getlIndustry() {
        return lIndustry;
    }

    public void setlIndustry(String lIndustry) {
        this.lIndustry = lIndustry;
    }

    public String getmIndustry() {
        return mIndustry;
    }

    public void setmIndustry(String mIndustry) {
        this.mIndustry = mIndustry;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCard(String idCard) {
        this.idCard = idCard;
    }

    public String getIdCardUrl() {
        return idCardUrl;
    }

    public void setIdCardUrl(String idCardUrl) {
        this.idCardUrl = idCardUrl;
    }

    public String getBusinessLicenseProve() {
        return businessLicenseProve;
    }

    public void setBusinessLicenseProve(String businessLicenseProve) {
        this.businessLicenseProve = businessLicenseProve;
    }

    public String getBusinessLicensePhone() {
        return businessLicensePhone;
    }

    public void setBusinessLicensePhone(String businessLicensePhone) {
        this.businessLicensePhone = businessLicensePhone;
    }

    public String getIndustry() {
        return industry;
    }

    public void setIndustry(String industry) {
        industry = industry;
    }

    public Long getId() {
        return id;
    }

      public Advertiser setId(Long id) {
          this.id = id;
          return this;
      }
    
    public String getCompanyName() {
        return companyName;
    }

      public Advertiser setCompanyName(String companyName) {
          this.companyName = companyName;
          return this;
      }
    
    public String getContactName() {
        return contactName;
    }

      public Advertiser setContactName(String contactName) {
          this.contactName = contactName;
          return this;
      }
    
    public String getContactPhone() {
        return contactPhone;
    }

      public Advertiser setContactPhone(String contactPhone) {
          this.contactPhone = contactPhone;
          return this;
      }
    
    public Long getContactId() {
        return contactId;
    }

      public Advertiser setContactId(Long contactId) {
          this.contactId = contactId;
          return this;
      }
    
    public BigDecimal getBalance() {
        return balance;
    }

      public Advertiser setBalance(BigDecimal balance) {
          this.balance = balance;
          return this;
      }
    
    public Integer getComeFrom() {
        return comeFrom;
    }

      public Advertiser setComeFrom(Integer comeFrom) {
          this.comeFrom = comeFrom;
          return this;
      }
    
    public String getStatus() {
        return status;
    }

      public Advertiser setStatus(String status) {
          this.status = status;
          return this;
      }
    
    public String getAddress() {
        return address;
    }

      public Advertiser setAddress(String address) {
          this.address = address;
          return this;
      }

    public Long getAssistantId() {
        return assistantId;
    }

    public void setAssistantId(Long assistantId) {
        this.assistantId = assistantId;
    }

    public Long getOrgId() {
        return orgId;
    }

      public Advertiser setOrgId(Long orgId) {
          this.orgId = orgId;
          return this;
      }
    
    public Date getLoginTime() {
        return loginTime;
    }

      public Advertiser setLoginTime(Date loginTime) {
          this.loginTime = loginTime;
          return this;
      }
    
    public Date getCreateTime() {
        return createTime;
    }

      public Advertiser setCreateTime(Date createTime) {
          this.createTime = createTime;
          return this;
      }
    
    public Date getUpdateTime() {
        return updateTime;
    }

      public Advertiser setUpdateTime(Date updateTime) {
          this.updateTime = updateTime;
          return this;
      }
    
    public String getNote() {
        return note;
    }

      public Advertiser setNote(String note) {
          this.note = note;
          return this;
      }

      public static final String ID = "id";

      public static final String COMPANY_NAME = "company_name";

      public static final String CONTACT_NAME = "contact_name";

      public static final String CONTACT_PHONE = "contact_phone";

      public static final String CONTACT_ID = "contact_id";

      public static final String BALANCE = "balance";

      public static final String COME_FROM = "come_from";

      public static final String STATUS = "status";

      public static final String ADDRESS = "address";

      public static final String ASSISTANT_ID = "assistant_id";

      public static final String ORG_ID = "org_id";

      public static final String LOGIN_TIME = "login_time";

      public static final String CREATED_TIME = "create_time";

      public static final String UPDATE_TIME = "update_time";

      public static final String NOTE = "note";

      @Override
    protected Serializable pkVal() {
          return this.id;
      }

    @Override
    public String toString() {
        return "Advertiser{" +
              "id=" + id +
                  ", companyName=" + companyName +
                  ", contactName=" + contactName +
                  ", contactPhone=" + contactPhone +
                  ", contactId=" + contactId +
                  ", balance=" + balance +
                  ", comeFrom=" + comeFrom +
                  ", status=" + status +
                  ", address=" + address +
                  ", assistantId=" + assistantId +
                  ", orgId=" + orgId +
                  ", loginTime=" + loginTime +
                  ", createTime=" + createTime +
                  ", updateTime=" + updateTime +
                  ", note=" + note +
              "}";
    }
}
