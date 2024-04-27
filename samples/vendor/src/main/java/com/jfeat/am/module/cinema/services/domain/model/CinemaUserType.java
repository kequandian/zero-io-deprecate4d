package com.jfeat.am.module.cinema.services.domain.model;

public class CinemaUserType {

    //平台管理员
    public static final Integer SYSTEM_ADMIN = 101;
    //平台总主管 广告主审批主管
    public static final Integer SYSTEM_SHOPKEEPER_MANAGER_MASTER = 102;
    //平台店小二主管
    public static final Integer SYSTEM_SHOPKEEPER_MANAGER = 103;
    //平台店小二
    public static final Integer SYSTEM_SHOPKEEPER = 104;
    //平台商务主管
    public static final Integer SYSTEM_BUSINESS_MANAGER = 105;
    //平台商务
    public static final Integer SYSTEM_BUSINESS = 106;

    //平台用户
    public static final Integer SYSTEM_USER = 107;
    //广告主租户 审核前
    public static final Integer ADVERTISERS_TENANT = 200;
    //广告主租户 审核后
    public static final Integer ADVERTISERS_TENANT_APPROVED = 201;
    //广告主用户
    public static final Integer ADVERTISERS_USER = 202;
    //影院管理员
    public static final Integer CINEMA_MANAGER = 301;
    //影院广告执行人
    public static final Integer CINEMA_EXECUTOR = 302;


}
