package com.jfeat.am.module.cinema.services.domain.model;

import com.jfeat.am.module.cinema.services.gen.persistence.model.Advertiser;

/**
 * Created by Code generator on 2020-09-10
 */
public class AdvertiserRecord extends Advertiser {

    String assistantName;

    Integer countHistoryOrder;

    public String getAssistantName() {
        return assistantName;
    }

    public void setAssistantName(String assistantName) {
        this.assistantName = assistantName;
    }

    public Integer getCountHistoryOrder() {
        return countHistoryOrder;
    }

    public void setCountHistoryOrder(Integer countHistoryOrder) {
        this.countHistoryOrder = countHistoryOrder;
    }

    String orgCode;

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }
}
