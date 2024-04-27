package com.jfeat.poi.agent.im.request;

import com.jfeat.poi.agent.util.converter.ValueConverter;

import java.util.*;

/**
 * Created by jackyhuang on 2017/12/29.
 */
public class TableTarget {

    public static final String UPDATE = "UPDATE";
    public static final String POSTFIX = "POSTFIX";
    public static final String UNIQUE_SEPARATE = ":";
    public static final String DEFAULT_POST_FIX = "##{1...}";


    private String table;
    private List<String> fields = new ArrayList<>();
    private List<String> values = new ArrayList<>();  /// not necessary
    private Option option; //配置

    public Option getOption() {
        return option;
    }

    public void setOption(Option option) {
        this.option = option;
    }

    public TableTarget() {
    }

    public TableTarget(String table) {
        this.table = table;
    }

    public TableTarget(String table, List<String> fields) {
        this.table = table;
        this.fields = fields;
        this.option = new Option();
        this.option.type = UPDATE;
    }

    public TableTarget(String table, List<String> fields, List<String> values, Option option) {
        this.table = table;
        this.fields = fields;
        this.values = values;
        this.option = option;
    }

    public TableTarget addField(String field) {
        return addField(field, null);
    }

    public TableTarget addField(String field, Object value) {
        this.fields.add(field);
        if (value != null) {
            this.values.add(String.valueOf(value));
        }
        return this;
    }

    private Map<String, ValueConverter> valueConverterMap = new LinkedHashMap<>();

    public Map<String, ValueConverter> getValueConverterMap() {
        return valueConverterMap;
    }

    public void setValueConverterMap(Map<String, ValueConverter> valueConverterMap) {
        this.valueConverterMap = valueConverterMap;
    }

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

    public List<String> getValues() {
        return values;
    }

    public void setValues(List<String> values) {
        this.values = values;
    }


    /**
     * statics table target methods
     *
     * @param list
     * @param table
     * @return
     */
    public static boolean containsTable(List<TableTarget> list, String table) {
        if (list != null && list.size() > 0) {
            Map<String, TableTarget> hash = new HashMap<>();
            for (TableTarget t : list) {
                if (t != null) {
                    hash.put(t.getTable(), t);
                }
            }
            return hash.containsKey(table);
        }
        return false;
    }

    public static TableTarget getTarget(List<TableTarget> list, String table) {
        if (list != null) {
            Map<String, TableTarget> hash = new HashMap<>();
            for (TableTarget t : list) {
                hash.put(t.getTable(), t);
            }
            if (hash.containsKey(table)) {
                return hash.get(table);
            }
        }
        return null;
    }

    @Override
    public String toString() {
        return "TableTarget{" +
                "table='" + table + '\'' +
                ", fields=" + fields +
                ", values=" + values +
                ", valueConverterMap=" + valueConverterMap +
                '}';
    }
}
