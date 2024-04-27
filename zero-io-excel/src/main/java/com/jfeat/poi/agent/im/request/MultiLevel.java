package com.jfeat.poi.agent.im.request;

import java.util.List;

/**
 * Created by craftperson on 2018/5/25.
 */
@Deprecated
public class MultiLevel {

    private String table;
    private String field;
    private String relativeField;
    private List<Integer> columns;

    public List<Integer> getColumns() {
        return columns;
    }

    public void setColumns(List<Integer> columns) {
        this.columns = columns;
    }

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

    public String getRelativeField() {
        return relativeField;
    }

    public void setRelativeField(String relativeField) {
        this.relativeField = relativeField;
    }
}
