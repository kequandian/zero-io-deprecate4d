package com.jfeat.am.module.cinema.services.domain.model;

import com.jfeat.am.module.cinema.services.gen.persistence.model.CinemaLine;

/**
 * Created by Code generator on 2020-09-10
 */
public class CinemaLineRecord extends CinemaLine {
    String orgCode;

    public String getOrgCode() {
        return orgCode;
    }

    public void setOrgCode(String orgCode) {
        this.orgCode = orgCode;
    }
}
