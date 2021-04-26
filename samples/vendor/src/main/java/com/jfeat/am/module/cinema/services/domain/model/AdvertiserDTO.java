package com.jfeat.am.module.cinema.services.domain.model;

import com.jfeat.am.module.cinema.services.gen.persistence.model.Advertiser;
import org.hibernate.validator.constraints.NotEmpty;

/**
 * Created by Code generator on 2020-09-10
 */
public class AdvertiserDTO extends Advertiser{

    @NotEmpty
    String password;

    String orgCode;

    String validateCode;

    public String getValidateCode() {
        return validateCode;
    }

    public void setValidateCode(String validateCode) {
        this.validateCode = validateCode;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }
}
