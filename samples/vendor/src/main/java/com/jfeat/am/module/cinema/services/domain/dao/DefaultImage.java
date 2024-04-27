package com.jfeat.am.module.cinema.services.domain.dao;

import org.apache.ibatis.annotations.Param;

/**
 * Created by Code generator on 2020-09-10
 */
public interface DefaultImage {

    public String getDefaultUrl(@Param("urlField") String urlField,
                                @Param("orgId") Long orgId);

}