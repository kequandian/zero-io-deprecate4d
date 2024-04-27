package com.jfeat.am.module.cinema.services.domain.model;

public class AdvertiserStatus {
    //状态   PASS-已审核 PENDING_APPROVAL-待审核 REFUSE-已拒绝 STOP -停用

    public static String PENDING_APPROVAL = "PENDING_APPROVAL";
    public static String PASS = "PASS";
    public static String REFUSE = "REFUSE";
    public static String STOP = "STOP";


    //来源 平台0 用户1
    public static Integer COME_FROM_SYSTEM = 0;
    public static Integer COME_FROM_USER = 1;

}
