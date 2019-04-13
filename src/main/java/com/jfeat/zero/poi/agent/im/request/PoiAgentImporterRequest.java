package com.jfeat.zero.poi.agent.im.request;

import com.jfeat.zero.poi.agent.util.TableConvert;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Silent-Y on 2017/10/9.
 */
public class PoiAgentImporterRequest {

    /**
     * 导入需要处理如下问题：
     *   1. 重复导入不能新增相同条目，需要定义唯一字段 （但作为导入工具不能任意修改数据库字段的业务属性，如增加 UNIQUE ）
     *   2. 若没有指定唯一字段，需要指定是否允许所有导入字段重复属性。 {"duplicate":0} 默认是 0-不允许
     *   3. 导入有可能涉及多表字段，需指定所属不同数据表
     *   4. 导入有可能涉及多表字段，并表多表间有依赖关系，如"一对一"，"一对多"，"多对多" 关系
     */

    private int level = 2;              /// import level, from single to complex, 默认支持 2
    private String source;              /// excel source
    private int duplicate = 0;          /// 是否允许添加与数据库中完全相同的数据，1允许存在完全相同数据，0为不允许
    private int header = 1;             /// excel source has header or not
    private int overwrite = 1;          /// 对导入复复项，是否重写, 默认重复导入可更新
    private int relationOnly = 0;       /// 是否仅建立多表关系，仅用于多表关联，跳过查入检查时间

    private List<TableTarget> target;   /// 导入到数据库的表目的字段,支持多数据库导入
    private List<TableTarget> unique;   /// 指定唯一字段，用于防止重新导入导致重新新增
    private List<TableTarget> notnull;  /// 对于Excel表没有的字段，但数据库又是必填字段，即需要定义notnull字段对其进行实始化
    private List<TableRelation> relation;   /// 表之间的关系，如一对多，需指定关联字段
    private List<TableConvert> convert;
    /// 导入前数据转换

    public List<TableConvert> getConvert() {
        return convert;
    }

    public  void setConvert(List<TableConvert> convert) {
        this.convert = convert;
    }

    public PoiAgentImporterRequest convert(List<TableConvert> tableConverts){
        this.convert = tableConverts;
        return this;
    }

    public PoiAgentImporterRequest convert(TableConvert converter){
        if(convert ==null) {
            convert = new ArrayList<>();
        }
        this.convert.add(converter);
        return this;
    }

    public PoiAgentImporterRequest convert(String table, String field, String oldValue, String newValue){
        if(convert ==null) {
            convert = new ArrayList<>();
        }
        TableConvert info = new TableConvert();
        info.setField(field);
        info.setOldValue(oldValue);
        info.setNewValue(newValue);
        info.setTable(table);
        convert.add(info);
        return this;
    }

    public PoiAgentImporterRequest target(List<TableTarget> target){
        this.target = target;
        return this;
    }
    public PoiAgentImporterRequest target(String table, List<String> fields){
        if(target==null) {
            target = new ArrayList<>();
        }
        if(!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table, fields));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.setFields(fields);
        }
        return this;
    }
    public PoiAgentImporterRequest target(String table, String field){
        if(target==null) {
            target = new ArrayList<>();
        }
        if(!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table).addField(field));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.addField(field);
        }
        return this;
    }
    public List<TableTarget> getTarget() {
        return target;
    }
    public void setTarget(List<TableTarget> target) {
        this.target = target;
    }

    public PoiAgentImporterRequest unique(List<TableTarget> unique){
        this.unique = unique;
        return this;
    }
    public PoiAgentImporterRequest notnull(List<TableTarget> notnull){
        this.notnull = notnull;
        return this;
    }
    public PoiAgentImporterRequest relation(List<TableRelation> relation){
        this.relation = relation;
        return this;
    }
    public PoiAgentImporterRequest relation(TableRelation relation){
        if(this.relation==null){
            this.relation = new ArrayList<>();
        }
        this.relation.add(relation);
        return this;
    }
    public PoiAgentImporterRequest relationMany(String table, String keyField, String relativeTable, String relativeKeyField){
        if(this.relation==null){
            this.relation = new ArrayList<>();
        }
        this.relation.add(new TableRelation(TableRelation.R_MANY_SLAVE, table, keyField, relativeTable, relativeKeyField));
        return this;
    }
    public PoiAgentImporterRequest relationOne(String table, String keyField, String relativeTable, String relativeKeyField){
        if(this.relation==null){
            this.relation = new ArrayList<>();
        }
        this.relation.add(new TableRelation(TableRelation.R_ONE_CHILD, table, keyField, relativeTable, relativeKeyField));
        return this;
    }

    public PoiAgentImporterRequest unique(String table, List<String> fields){
        if(unique==null) {
            unique = new ArrayList<>();
        }
        if(!TableTarget.containsTable(unique, table)) {
            unique.add(new TableTarget(table, fields));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(unique, table);
            t.setFields(fields);
        }
        return this;
    }
    public PoiAgentImporterRequest unique(String table, String... fields){
        List<String> fieldList = new ArrayList<>();
        for(String field : fields){
            fieldList.add(field);
        }

        if(unique==null) {
            unique = new ArrayList<>();
        }
        if(!TableTarget.containsTable(unique, table)) {
            unique.add(new TableTarget(table, fieldList));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(unique, table);
            t.setFields(fieldList);
        }
        return this;
    }
    public PoiAgentImporterRequest unique(String table, String field){
        if(unique==null) {
            unique = new ArrayList<>();
        }
        if(!TableTarget.containsTable(unique, table)) {
            unique.add(new TableTarget(table).addField(field));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(unique, table);
            t.addField(field);
        }
        return this;
    }
    public PoiAgentImporterRequest notnull(String table, String field, Object value){
        if(notnull==null) {
            notnull = new ArrayList<>();
        }
        if(!TableTarget.containsTable(notnull, table)) {
            notnull.add(new TableTarget(table).addField(field, value));
        }else{
            /// update fields
            TableTarget t = TableTarget.getTarget(notnull, table);
            t.addField(field,value);
        }
        return this;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(Integer level) {
        this.level = level;
    }

    public String getSource() {
        return source;
    }

    public void setSource(String source) {
        this.source = source;
    }

    public int getDuplicate() {
        return duplicate;
    }

    public void setDuplicate(int duplicate) {
        this.duplicate = duplicate;
    }

    public int getHeader() {
        return header;
    }

    public void setHeader(int header) {
        this.header = header;
    }

    public int getOverwrite() {
        return overwrite;
    }

    public void setOverwrite(int overwrite) {
        this.overwrite = overwrite;
    }

    public List<TableTarget> getUnique() {
        return unique;
    }

    public void setUnique(List<TableTarget> unique) {
        this.unique = unique;
    }

    public List<TableTarget> getNotnull() {
        return notnull;
    }

    public void setNotnulle(List<TableTarget> notnull) {
        this.notnull = notnull;
    }

    public List<TableRelation> getRelation() {
        return relation;
    }

    public void setRelation(List<TableRelation> relation) {
        this.relation = relation;
    }

    public int getRelationOnly() {
        return relationOnly;
    }

    public void setRelationOnly(int relationOnly) {
        this.relationOnly = relationOnly;
    }
}

