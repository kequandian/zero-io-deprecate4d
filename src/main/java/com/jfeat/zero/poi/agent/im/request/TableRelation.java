package com.jfeat.zero.poi.agent.im.request;

/**
 * Created by vincenthuang on 2018/04/23.
 *
 */
public class TableRelation {
    private static final String PRIMARY_ID = "id";

    public static final String R_ONE_CHILD = "one";     // 一对一
    public static final String R_MANY_SLAVE = "many";   // 一对多
    public static final String R_PEER = "peer";         // 多对多
    public static final String R_GROUP = "group";       // 多层级组

    private String relation;                // "one" or "many" or "peer" or "group"
    private String table;                   // 表名
    private String keyField = PRIMARY_ID;   // 属于表 table 的关联字段， 通常其间键字段是 id
    private String relativeTable;           // 关联表名
    private String relativeKeyField;        // 属于表 relativeTable 的关联字段 (如一对多的关联字段在 relativeTable)
    private String relativePeerKeyField;    // 如果是多对多，第三个关联表有两个关键字段，
                                            // table.keyField & peerTable.peerKeyField
    private String peerTable;                   // 多对多副主表
    private String peerKeyField = PRIMARY_ID;   // 副主表关联字段， 通常其关键字段是 id

    private String groupKeyField = "pid";       // 多层级组关键字，通常字段是 pid

    @Deprecated
    private MultiLevel multiLevel;

    public MultiLevel getMultiLevel() {
        return multiLevel;
    }

    public void setMultiLevel(MultiLevel multiLevel) {
        this.multiLevel = multiLevel;
    }

    public TableRelation(){
    }

    public TableRelation(String relation, String table, String keyField, String relativeTable, String relativeKeyField){
        this.relation = relation;
        this.table = table;
        this.keyField = keyField;
        this.relativeTable = relativeTable;
        this.relativeKeyField = relativeKeyField;
    }

    public String getTable() {
        return table;
    }

    public void setTable(String table) {
        this.table = table;
    }

    public String getRelativeTable() {
        return relativeTable;
    }

    public void setRelativeTable(String relativeTable) {
        this.relativeTable = relativeTable;
    }

    public String getRelation() {
        return relation;
    }

    public void setRelation(String relation) {
        this.relation = relation;
    }

    public String getKeyField() {
        return keyField;
    }

    public void setKeyField(String keyField) {
        this.keyField = keyField;
    }

    public String getRelativeKeyField() {
        return relativeKeyField;
    }

    public void setRelativeKeyField(String relativeKeyField) {
        this.relativeKeyField = relativeKeyField;
    }

    public String getPeerTable() {
        return peerTable;
    }

    public void setPeerTable(String peerTable) {
        this.peerTable = peerTable;
    }

    public String getPeerKeyField() {
        return peerKeyField;
    }

    public void setPeerKeyField(String keyField) {
        this.peerKeyField = keyField;
    }

    public String getRelativePeerKeyField() {
        return relativePeerKeyField;
    }

    public void setRelativePeerKeyField(String relativePeerKeyField) {
        this.relativePeerKeyField = relativePeerKeyField;
    }

    public String getGroupKeyField() {
        return groupKeyField;
    }

    public void setGroupKeyField(String groupKeyField) {
        this.groupKeyField = groupKeyField;
    }
}
