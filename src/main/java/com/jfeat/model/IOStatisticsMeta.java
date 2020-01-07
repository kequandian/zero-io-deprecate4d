package com.jfeat.model;


/**
 * Created on 2020/1/4.
 *
 * @author Wen Hao
 */

public class IOStatisticsMeta {

    private static final long serialVersionUID = 1L;

    public static final String ID = "id";

    public static final String FIELD = "field";

    public static final String QUERY_SQL = "query_sql";

    public static final String PERCENT = "percent";

    public static final String ICON = "icon";

    public static final String TITLE = "title";

    public static final String FIELD1 = "field1";

    public static final String FIELD2 = "field2";

    private Long id;
    /**
     * 数据指标唯一标识符
     */
    private String field;
    /**
     * 实时查询sql
     */
    private String querySql;
    /**
     * 是否显示为百分比
     */
    private Integer percent;
    /**
     * 图标路径
     */
    private String icon;
    /**
     * 图表标题
     */
    private String title;
    /**
     * 字段类型 D金钱  T时间  P百分比  C数量  S字符串
     */
    private String type;
    /**
     * 保留字段2
     */
    private String field2;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getField() {
        return field;
    }

    public void setField(String field) {
        this.field = field;
    }

    public String getQuerySql() {
        return querySql;
    }

    public void setQuerySql(String querySql) {
        this.querySql = querySql;
    }

    public Integer getPercent() {
        return percent;
    }

    public void setPercent(Integer percent) {
        this.percent = percent;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getField2() {
        return field2;
    }

    public void setField2(String field2) {
        this.field2 = field2;
    }
}
