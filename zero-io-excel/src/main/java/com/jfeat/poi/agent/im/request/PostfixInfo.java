package com.jfeat.poi.agent.im.request;

public class PostfixInfo {

    private PostfixType postfixType;
    //初始自增值 例如 1
    private String increment;
    //替换体 例如 {1...}
    private String replace;
    //已经增加后缀的数据 获取后缀用的正则
    private String dataRegex;

    //自增模块前的 后缀字符串 例如用户输入 ##{1...}&& 此处为 ##
    private String beforeString;
    //自增模块后的 后缀字符串 例如用户输入 ##{1...}&& 此处为 &&
    private String afterString;
    //完整的正则 用于直接搜索后缀 例如用户输入 ##{1...}&& 此处为 ##\d&&
    private String completeRegex;

    public String getCompleteRegex() {
        return completeRegex;
    }

    public void setCompleteRegex(String completeRegex) {
        this.completeRegex = completeRegex;
    }

    public String getBeforeString() {
        return beforeString;
    }

    public void setBeforeString(String beforeString) {
        this.beforeString = beforeString;
    }

    public String getAfterString() {
        return afterString;
    }

    public void setAfterString(String afterString) {
        this.afterString = afterString;
    }

    public String getDataRegex() {
        return dataRegex;
    }

    public void setDataRegex(String dataRegex) {
        this.dataRegex = dataRegex;
    }

    public String getReplace() {
        return replace;
    }

    public void setReplace(String replace) {
        this.replace = replace;
    }

    public String getIncrement() {
        return increment;
    }

    public void setIncrement(String increment) {
        this.increment = increment;
    }

    public PostfixType getPostfixType() {
        return postfixType;
    }

    public void setPostfixType(PostfixType postfixType) {
        this.postfixType = postfixType;
    }
}
