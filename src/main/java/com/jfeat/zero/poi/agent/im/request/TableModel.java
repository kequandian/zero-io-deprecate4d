package com.jfeat.zero.poi.agent.im.request;

import java.util.List;

public class TableModel {

    private String table;
    private List<String> fields;
    private List<String> uniqueFields;
    private List<List<String>> currentContents;

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public List<String> getFields() {
        return fields;
    }

    public void setFields(List<String> fields) {
        this.fields = fields;
    }

    public List<String> getUniqueFields() {
        return uniqueFields;
    }

    public void setUniqueFields(List<String> uniqueFields) {
        this.uniqueFields = uniqueFields;
    }

    public List<List<String>> getCurrentContents() {
        return currentContents;
    }

    public void setCurrentContents(List<List<String>> currentContents) {
        this.currentContents = currentContents;
    }
}
