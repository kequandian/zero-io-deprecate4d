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
 * @since 2020-10-08
 */
@TableName("ca_advertiser_operate_log")
public class AdvertiserOperateLog extends Model<AdvertiserOperateLog> {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    /**
     * 澶囨敞
     */
    private String note;

    /**
     * 骞垮憡涓籭d
     */
    private Long advertiserId;

    /**
     * 淇敼鍚庣姸鎬�
     */
    private String status;

    /**
     * 鍒涘缓鏃堕棿
     */
    private Date createTime;


    public Long getId() {
        return id;
    }

    public AdvertiserOperateLog setId(Long id) {
        this.id = id;
        return this;
    }

    public String getNote() {
        return note;
    }

    public AdvertiserOperateLog setNote(String note) {
        this.note = note;
        return this;
    }

    public Long getAdvertiserId() {
        return advertiserId;
    }

    public AdvertiserOperateLog setAdvertiserId(Long advertiserId) {
        this.advertiserId = advertiserId;
        return this;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public AdvertiserOperateLog setCreateTime(Date createTime) {
        this.createTime = createTime;
        return this;
    }

    public static final String ID = "id";

    public static final String NOTE = "note";

    public static final String ADVERTISER_ID = "advertiser_id";

    public static final String TO_STATUS = "to_status";

    public static final String CREATE_TIME = "create_time";

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "AdvertiserOperateLog{" +
                "id=" + id +
                ", note=" + note +
                ", advertiserId=" + advertiserId +
                ", status=" + status +
                ", createTime=" + createTime +
                "}";
    }
}
