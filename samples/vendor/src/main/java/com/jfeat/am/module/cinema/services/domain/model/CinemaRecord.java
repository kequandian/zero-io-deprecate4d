package com.jfeat.am.module.cinema.services.domain.model;

import com.jfeat.am.module.cinema.services.gen.persistence.model.Cinema;

/**
 * Created by Code generator on 2020-09-10
 */
public class CinemaRecord extends Cinema {
    String phone;

    String OrgCode;

    String assistantName;

    String password;

    String accountStatus;

    String account;

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAssistantName() {
        return assistantName;
    }

    public void setAssistantName(String assistantName) {
        this.assistantName = assistantName;
    }

    public String getOrgCode() {
        return OrgCode;
    }

    public void setOrgCode(String orgCode) {
        OrgCode = orgCode;
    }
}
