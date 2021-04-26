package com.jfeat.am.module.cinema.services.gen.persistence.model;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.extension.activerecord.Model;

import java.math.BigDecimal;
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
@TableName("ca_cinema")
public class Cinema extends Model<Cinema> {

    private static final long serialVersionUID=1L;

      @TableId(value = "id", type = IdType.AUTO)
      private Long id;

      /**
     * 影院名
     */
      private String name;

      /**
     * 省
     */
      private String province;

    /**
     * 票房
     */
    private BigDecimal ticket;

      /**
     * 市
     */
      private String city;

      /**
     * 地区，例如：  华北地区
     */
      private String area;

      /**
     * 所属影线
     */
      private Long lineId;

      /*
      * 影线名字
      * */
      private String lineName;


      /**
     * 专资编号
     */
      private String qualificationNumber;

      /**
     * 影厅数
     */
      private Integer roomNumber;

      /**
     * 总座位数
     */
      private Integer seatNumber;

      /*
      * 省市区的pcdId
      * */
      private Long pcdId;

      /**
     * 联系人名字
     */
      private String contactName;

      /**
     * 鑱联系电话
     */
      private String contact;

      /**
     * 所属商圈
     */
      private String businessArea;

      /**
     * 详细地址
     */
      private String address;

    private Long orgId;

      /**
     * 备注
     */
      private String note;

      /*
      * 区
      * **/
    private String district;

    /**
     * 城市级别
     */
    private String cityLevel;


    private Date createTime;

    private Date updateTime;

    /**
     * 商务id
     */
    private Long assistantId;



    @TableField("business_license_prove")
    private String businessLicenseProve;
    @TableField("business_license_phone")
    private String  businessLicensePhone;

    @TableField("import_note")
    private String importNote;

    @TableField("opening_time")
    private Date openingTime;

    @TableField("average_ticket_price")
    private BigDecimal averageTicketPrice;

    public Date getOpeningTime() {
        return openingTime;
    }

    public void setOpeningTime(Date openingTime) {
        this.openingTime = openingTime;
    }

    public BigDecimal getAverageTicketPrice() {
        return averageTicketPrice;
    }

    public void setAverageTicketPrice(BigDecimal averageTicketPrice) {
        this.averageTicketPrice = averageTicketPrice;
    }

    public String getImportNote() {
        return importNote;
    }

    public void setImportNote(String importNote) {
        this.importNote = importNote;
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

    public BigDecimal getTicket() {
        return ticket;
    }

    public void setTicket(BigDecimal ticket) {
        this.ticket = ticket;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getCityLevel() {
        return cityLevel;
    }

    public void setCityLevel(String cityLevel) {
        this.cityLevel = cityLevel;
    }

    public Long getPcdId() {
        return pcdId;
    }

    public void setPcdId(Long pcdId) {
        this.pcdId = pcdId;
    }

    public String getLineName() {
        return lineName;
    }

    public void setLineName(String lineName) {
        this.lineName = lineName;
    }

    public Long getAssistantId() {
        return assistantId;
    }

    public void setAssistantId(Long assistantId) {
        this.assistantId = assistantId;
    }

    public Long getId() {
        return id;
    }

      public Cinema setId(Long id) {
          this.id = id;
          return this;
      }
    
    public String getName() {
        return name;
    }

      public Cinema setName(String name) {
          this.name = name;
          return this;
      }
    
    public String getProvince() {
        return province;
    }

      public Cinema setProvince(String province) {
          this.province = province;
          return this;
      }
    
    public String getCity() {
        return city;
    }

      public Cinema setCity(String city) {
          this.city = city;
          return this;
      }
    
    public String getArea() {
        return area;
    }

      public Cinema setArea(String area) {
          this.area = area;
          return this;
      }
    
    public Long getLineId() {
        return lineId;
    }

      public Cinema setLineId(Long lineId) {
          this.lineId = lineId;
          return this;
      }
    
    public String getQualificationNumber() {
        return qualificationNumber;
    }

      public Cinema setQualificationNumber(String qualificationNumber) {
          this.qualificationNumber = qualificationNumber;
          return this;
      }
    
    public Integer getRoomNumber() {
        return roomNumber;
    }

      public Cinema setRoomNumber(Integer roomNumber) {
          this.roomNumber = roomNumber;
          return this;
      }
    
    public Integer getSeatNumber() {
        return seatNumber;
    }

      public Cinema setSeatNumber(Integer seatNumber) {
          this.seatNumber = seatNumber;
          return this;
      }
    
    public String getContactName() {
        return contactName;
    }

      public Cinema setContactName(String contactName) {
          this.contactName = contactName;
          return this;
      }
    
    public String getContact() {
        return contact;
    }

      public Cinema setContact(String contact) {
          this.contact = contact;
          return this;
      }
    
    public String getBusinessArea() {
        return businessArea;
    }

      public Cinema setBusinessArea(String businessArea) {
          this.businessArea = businessArea;
          return this;
      }
    
    public String getAddress() {
        return address;
    }

      public Cinema setAddress(String address) {
          this.address = address;
          return this;
      }
    
    public Long getOrgId() {
        return orgId;
    }

      public Cinema setOrgId(Long orgId) {
          this.orgId = orgId;
          return this;
      }
    
    public String getNote() {
        return note;
    }

      public Cinema setNote(String note) {
          this.note = note;
          return this;
      }
    
    public Date getCreateTime() {
        return createTime;
    }

      public Cinema setCreateTime(Date createTime) {
          this.createTime = createTime;
          return this;
      }
    
    public Date getUpdateTime() {
        return updateTime;
    }

      public Cinema setUpdateTime(Date updateTime) {
          this.updateTime = updateTime;
          return this;
      }

      public static final String ID = "id";

      public static final String NAME = "name";

      public static final String PROVINCE = "province";

      public static final String CITY = "city";

      public static final String AREA = "area";

      public static final String LINE_ID = "line_id";

      public static final String QUALIFICATION_NUMBER = "qualification_number";

      public static final String ROOM_NUMBER = "room_number";

      public static final String SEAT_NUMBER = "seat_number";

      public static final String CONTACT_NAME = "contact_name";

      public static final String CONTACT = "contact";

      public static final String BUSINESS_AREA = "business_area";

      public static final String ADDRESS = "address";

      public static final String ORG_ID = "org_id";

      public static final String NOTE = "note";

      public static final String CREATED_TIME = "create_time";

      public static final String UPDATE_TIME = "update_time";

      @Override
    protected Serializable pkVal() {
          return this.id;
      }

    @Override
    public String toString() {
        return "Cinema{" +
              "id=" + id +
                  ", name=" + name +
                  ", province=" + province +
                  ", city=" + city +
                  ", area=" + area +
                  ", lineId=" + lineId +
                  ", qualificationNumber=" + qualificationNumber +
                  ", roomNumber=" + roomNumber +
                  ", seatNumber=" + seatNumber +
                  ", contactName=" + contactName +
                  ", contact=" + contact +
                  ", businessArea=" + businessArea +
                  ", address=" + address +
                  ", orgId=" + orgId +
                  ", note=" + note +
                  ", createTime=" + createTime +
                  ", updateTime=" + updateTime +
              "}";
    }
}
