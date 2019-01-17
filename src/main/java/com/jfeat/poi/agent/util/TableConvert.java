package com.jfeat.poi.agent.util;

/**
 * Created by craftperson on 2018/5/9.
 */
public class TableConvert {
    public static final String DATE_TIME_FORMAT = "yyyy-MM-dd hh:mm:ss";

    private String table;
    private String field;
    private String oldValue;
    private String newValue;

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getOldValue() {
        return oldValue;
    }

    public void setOldValue(String oldValue) {
        this.oldValue = oldValue;
    }

    public String getNewValue() {
        return newValue;
    }

    public void setNewValue(String newValue) {
        this.newValue = newValue;
    }
}
