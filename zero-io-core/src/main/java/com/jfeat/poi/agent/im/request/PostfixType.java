package com.jfeat.poi.agent.im.request;

public enum PostfixType {

    //数字
    Number("NUM","\\{\\d\\.\\.\\.\\}","\\d"),
    //大小写字母
    LETTER("LETTER","","");

    private String typeName;
    private String regex;
    private String incrementRegex;

    PostfixType(String typeName,String regex,String incrementRegex){
        this.typeName = typeName;
        this.regex = regex;
        this.incrementRegex = incrementRegex;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getRegex() {
        return regex;
    }

    public void setRegex(String regex) {
        this.regex = regex;
    }

    public String getIncrementRegex() {
        return incrementRegex;
    }

    public void setIncrementRegex(String incrementRegex) {
        this.incrementRegex = incrementRegex;
    }
}
