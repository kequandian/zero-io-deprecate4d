package com.jfeat.poi.agent.im;

import com.jfeat.poi.agent.POIAgent;
import com.jfeat.poi.agent.im.request.MultiLevel;
import com.jfeat.poi.agent.im.request.TableRelation;
import com.jfeat.poi.agent.im.request.TableTarget;
import com.jfeat.poi.agent.util.DatabaseReadWrite;
import com.jfeat.poi.agent.util.ExcelReaderUtils;
import com.jfeat.poi.agent.util.TableConvert;
import com.jfeat.poi.agent.util.converter.ValueConverter;
import com.jfeat.poi.agent.util.converter.impl.ValueConverterImpl;
//import sun.reflect.generics.reflectiveObjects.NotImplementedException;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.*;

/**
 * Created by vincenthuang on 19/04/2018.
 */
public class PoiAgentImporter implements POIAgent {

    private static final String PRIMARY_KEY_ID = "id";

    private boolean overwrite = true;
    private boolean duplicate = false;
    private List<TableTarget> target;
    private List<TableTarget> unique;
    private List<TableTarget> notnull;
    private List<TableRelation> relation;
    private List<TableConvert> convert;


    @Deprecated
    private Map<String, ValueConverter> valueConverters;

    public PoiAgentImporter() {
    }

    public PoiAgentImporter duplicate(boolean duplicate) {
        this.duplicate = duplicate;
        return this;
    }

    public PoiAgentImporter overwrite(boolean overwrite) {
        this.overwrite = overwrite;
        return this;
    }

    public PoiAgentImporter target(List<TableTarget> targetList) {
        this.target = targetList;
        return this;
    }

    public PoiAgentImporter unique(List<TableTarget> unique) {
        this.unique = unique;
        return this;
    }

    public PoiAgentImporter notnull(List<TableTarget> notnull) {
        this.notnull = notnull;
        return this;
    }

    public PoiAgentImporter target(String table, List<String> fields) {
        if (target == null) {
            target = new ArrayList<>();
        }
        if (!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table, fields));
        } else {
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.setFields(fields);
        }
        return this;
    }

    public PoiAgentImporter target(String table, String field) {
        if (target == null) {
            target = new ArrayList<>();
        }
        if (!TableTarget.containsTable(target, table)) {
            target.add(new TableTarget(table).addField(field));
        } else {
            /// update fields
            TableTarget t = TableTarget.getTarget(target, table);
            t.addField(field);
        }
        return this;
    }

    public PoiAgentImporter unique(String table, List<String> fields) {
        if (unique == null) {
            unique = new ArrayList<>();
        }
        if (!TableTarget.containsTable(unique, table)) {
            unique.add(new TableTarget(table, fields));
        } else {
            /// update fields
            TableTarget t = TableTarget.getTarget(unique, table);
            t.setFields(fields);
        }
        return this;
    }

    public PoiAgentImporter unique(String table, String field) {
        if (unique == null) {
            unique = new ArrayList<>();
        }
        if (!TableTarget.containsTable(unique, table)) {
            unique.add(new TableTarget(table).addField(field));
        } else {
            /// update fields
            TableTarget t = TableTarget.getTarget(unique, table);
            t.addField(field);
        }
        return this;
    }

    public PoiAgentImporter notnull(String table, String field, Object value) {
        if (notnull == null) {
            notnull = new ArrayList<>();
        }
        if (!TableTarget.containsTable(notnull, table)) {
            notnull.add(new TableTarget(table).addField(field, value));
        } else {
            /// update fields
            TableTarget t = TableTarget.getTarget(notnull, table);
            t.addField(field, value);
        }
        return this;
    }

    public PoiAgentImporter relation(List<TableRelation> relations) {
        if (relations == null) {
            this.relation = new ArrayList<>();
        }
        // todo, check unique
        this.relation = relations;
        return this;
    }

    public PoiAgentImporter convert(List<TableConvert> tableConverts) {
        this.convert = tableConverts;
        return this;
    }

    public PoiAgentImporter convert(TableConvert tableConvert) {
        if (this.convert == null) {
            this.convert = new ArrayList<>();
        }
        this.convert.add(tableConvert);
        return this;
    }

    public PoiAgentImporter convert(String table, String field, String oldValue, String newValue) {
        if (this.convert == null) {
            this.convert = new ArrayList<>();
        }

        TableConvert converter = new TableConvert();
        converter.setTable(table);
        converter.setField(field);
        converter.setOldValue(oldValue);
        converter.setNewValue(newValue);

        this.convert.add(converter);
        return this;
    }


    /**
     * import excel from source file
     *
     * @param connection
     * @param source
     * @return
     */
    public int importExcel(Connection connection, File source, boolean header) throws SQLException {

        /// only the first sheet
        List<List<String>> contents = ExcelReaderUtils.readSheet(source);

        if (this.convert != null) {
            ValueConverter valueConverter = new ValueConverterImpl();
            contents = (List<List<String>>) valueConverter.convert(this.convert, this.target, contents);
        }


        if (header) {
            contents.remove(0);
        }

        return importExcel(connection, contents);
    }


    /**
     * import contents into database via connection
     *
     * @param connection
     * @param contents
     * @return
     */
    public int importExcel(Connection connection, List<List<String>> contents) throws SQLException {
        DatabaseReadWrite readWrite = new DatabaseReadWrite();
        /// write table
        int success = 0;
        {


            int start = 0, end = 0;

            //Map<String, TableTarget> targetHash = buildTargetHash(target);
            Map<String, TableTarget> uniqueHash = buildTargetHash(unique);
            Map<String, TableTarget> notnullHash = buildTargetHash(notnull);

            for (TableTarget t : target) {
                start += end;
                end += t.getFields().size();

                if (contents.get(0).size() < t.getFields().size()) {
                    throw new RuntimeException("Invalid contents column size " + contents.get(0).size());
                }

                List<List<String>> targetTableContents = ExcelReaderUtils.getSubContents(contents, start, end);
                List<String> fields = t.getFields();

                if (targetTableContents.get(0).size() != fields.size()) {
                    throw new RuntimeException("currentContents size not equals fields size !");
                }

                /// if notnull fields is set
                if (notnullHash != null) {
                    if (notnullHash.containsKey(t.getTable())) {
                        TableTarget notnullTarget = notnullHash.get(t.getTable());
                        if (notnullTarget.getFields().size() != notnullTarget.getFields().size()) {
                            throw new RuntimeException("Fatal: fields size not equal values size !");
                        }

                        /// update fields
                        fields = new ArrayList<>();
                        fields.addAll(t.getFields());

                        fields.addAll(notnullTarget.getFields());

                        /// update contents
                        targetTableContents = ExcelReaderUtils.appendContents(targetTableContents, notnullTarget.getValues());
                    }
                }


                /// find unique
                List<String> uniqueFields = null;
                if (uniqueHash != null) {
                    if (uniqueHash.containsKey(t.getTable())) {
                        TableTarget uniqueTarget = uniqueHash.get(t.getTable());
                        if (uniqueTarget != null) {
                            uniqueFields = uniqueTarget.getFields();
                        }
                    }
                }

                success += readWrite.writeTable(connection, t.getTable(), fields, uniqueFields, overwrite, duplicate, targetTableContents, valueConverters);
            }
        }


        if (relation != null && relation.size() > 0) {
            Iterator<TableRelation> tableRelationIterator = relation.iterator();
            while (tableRelationIterator.hasNext()) {
                TableRelation relation = tableRelationIterator.next();
                String table = relation.getTable();
                String relativeTable = relation.getRelativeTable();


                /// one to many relation
                if (relation.getRelation().equals(TableRelation.R_MANY_SLAVE)) {
                    TableTarget masterTableTarget = null;
                    TableTarget slaveTableTarget = null;
                    for (TableTarget t : target) {
                        if (t.getTable().equals(table)) {
                            masterTableTarget = t;
                        }
                        if (t.getTable().equals(relativeTable)) {
                            slaveTableTarget = t;
                        }
                    }
                    /// fix:  if majorTableTarget is not set, build it from relation
                    if (masterTableTarget == null) {
                        String majorTable = relation.getTable();

                        // field from unique
                        TableTarget selectedTarget = null;
                        for (TableTarget t : unique) {
                            if (t.getTable().equals(majorTable)) {
                                selectedTarget = t;
                                break;
                            }
                        }

                        /// build the masterTargetTable
                        if (selectedTarget != null) {
                            masterTableTarget = new TableTarget();
                            masterTableTarget.setTable(majorTable);

                            masterTableTarget.setFields(selectedTarget.getFields());
                        }
                    }

                    /// update relative key field
                    if (masterTableTarget != null && slaveTableTarget != null) {
                        List<String> masterTableTargetFields = masterTableTarget.getFields();
                        masterTableTargetFields.add(0, PRIMARY_KEY_ID);
                        List<String> slaveTableTargetFields = slaveTableTarget.getFields();
                        slaveTableTargetFields.add(0, PRIMARY_KEY_ID);
                        List<List<String>> masterTableContents = DatabaseReadWrite.queryContentsFromTable(connection, masterTableTarget.getTable(), null, masterTableTargetFields);

                        /// where slave table key field value = 0
                        Map<String, String> options = new HashMap<>();
                        for (TableTarget nn : notnull) {
                            if (relation.getRelativeTable().equals(nn.getTable())) {
                                for (String f : nn.getFields()) {
                                    if (f != null && f.equals(relation.getRelativeKeyField())) {
                                        int col = nn.getFields().indexOf(f);
                                        options.put(relation.getRelativeKeyField(), nn.getValues().get(col));
                                    }
                                }
                            }
                        }
                        List<List<String>> slaveTableContents = DatabaseReadWrite.queryContentsFromTable(connection, slaveTableTarget.getTable(), options, slaveTableTargetFields);

                        Map<List<String>, Object> masterMapIdContent = getMapIdContent(masterTableContents);
                        Map<List<String>, Object> slaveMapIdContent = getMapIdContent(slaveTableContents);

                        Iterator<List<String>> listIterator = slaveTableContents.iterator();
                        while (listIterator.hasNext()) {
                            List<String> row = listIterator.next();
                            handleRelation(connection, row, masterMapIdContent, slaveMapIdContent, relation);
                        }
                    }
                } else if (relation.getRelation().equals(TableRelation.R_PEER)) {
                    if(true){
                        //TODO, not yet verify
                    }

                    String relationTable = relation.getRelativeTable();
                    String peerTable = relation.getPeerTable();     //peer master table

                    if (relationTable == null) {
                        throw new IllegalArgumentException("没有设置中间表");
                    } else {
                        List<Map<String, String>> peerIdMapper = getPeerIdMapper(readWrite, connection, contents, table, peerTable);
                        List<List<String>> peerContents = new LinkedList<>();
                        for (Map<String, String> mapper : peerIdMapper) {
                            peerContents.add((List<String>) mapper.values());
                        }

                        if (peerContents != null && peerContents.size() > 0) {
                            List<String> peerTableFields = new ArrayList<>();
                            peerTableFields.add(relation.getRelativeKeyField());
                            peerTableFields.add(relation.getRelativePeerKeyField());

                            List<String> unique = peerTableFields;  ///多对多表两关键字段决定唯一性

                            readWrite.writeTable(connection, relationTable, peerTableFields,
                                    unique, false, false, peerContents, valueConverters);
                        }
                    }
                } else if (relation.getRelation().equalsIgnoreCase(TableRelation.R_GROUP)) {
                    if(true){
                        //TODO, not yet pass
                    }

                    MultiLevel multiLevel = relation.getMultiLevel();
                    if (multiLevel != null) {
                        String mutiTable = multiLevel.getTable();
                        if (mutiTable == null)
                            throw new IllegalArgumentException("multiLevel Table is null");
                        List<Integer> columns = multiLevel.getColumns();
                        if (columns == null || columns.size() == 0)
                            throw new IllegalArgumentException("colums is null");
                        String relativeField = multiLevel.getRelativeField();
                        String field = multiLevel.getField();
                        if (relativeField == null)
                            throw new IllegalArgumentException("relativeFiled is null");
                        if (field == null)
                            throw new IllegalArgumentException("field is null");

                        for (List<String> content : contents) {
                            List<String> newContent = new ArrayList<>();
                            for (Integer column : columns) {
                                String s = content.get(column);
                                if (s != null && !s.trim().equals("")) {
                                    newContent.add(s);
                                }
                            }
                            handleMultiLevel(readWrite, connection, mutiTable, newContent, field, relativeField);
                        }
                    } else {
                        throw new IllegalArgumentException("multiLevel is null!");
                    }
                }
            }
        }

        return success;
    }

    private void handleMultiLevel(DatabaseReadWrite readWrite, Connection connection, String table, List<String> contents, String field, String relativeField) throws SQLException {
        int size = contents.size();
        String pId = null;
        for (Integer i = 0; i < size; i++) {
            List<String> fields = new ArrayList<>();
            fields.add(field);
            List<List<String>> list = new ArrayList<>();
            List<String> con = new ArrayList<>();
            con.add(contents.get(i));
            list.add(con);
            if (i != 0) {
                fields.add(relativeField);
                con.add(pId);
            }
            readWrite.writeTable(connection, table, fields, null, overwrite, true, list, valueConverters);
            if (size != 1) {
                Map<String, String> option = new HashMap<>();
                option.put(field, contents.get(i));
                List<String> ls = new ArrayList<>();
                ls.add("id");
                List<List<String>> lists = DatabaseReadWrite.queryContentsFromTable(connection, table, option, ls);
                pId = new String(lists.get(0).get(0));
            }
        }
    }

    private List<Map<String, String>> getPeerIdMapper(DatabaseReadWrite readWrite, Connection connection, List<List<String>> contents, String table, String peerTable) {
        List<Map<String, String>> peerIdMapper = new LinkedList<>();

        List<Map<String, String>> tableContents = readWrite.readTable(connection, table);
        List<Map<String, String>> peerTableContents = readWrite.readTable(connection, peerTable);

        for (List<String> content : contents) {
            String tableId = null;
            String peerTableId = null;
            for (Map<String, String> tableMapper : tableContents) {
                String tempTableId = null;
                if (tableMapper.containsKey(PRIMARY_KEY_ID)) {
                    tempTableId = tableMapper.get(PRIMARY_KEY_ID);
                }
                tableMapper.remove(PRIMARY_KEY_ID);
                List<String> values = (List<String>) tableMapper.values();

                boolean tableFlag = true;
                for (String v : values) {
                    if (!content.contains(v)) {
                        tableFlag = true;
                    }
                }

                if (tableFlag) {
                    if (tempTableId != null) {
                        tableId = tempTableId;
                        tempTableId = null;
                    } else {
                        continue;
                    }

                    for (Map<String, String> relativeTableMapper : peerTableContents) {
                        if (relativeTableMapper.containsKey(PRIMARY_KEY_ID)) {
                            tempTableId = relativeTableMapper.get(PRIMARY_KEY_ID);
                        }

                        relativeTableMapper.remove(PRIMARY_KEY_ID);

                        List<String> strings = (List<String>) relativeTableMapper.values();

                        for (String v : strings) {
                            if (!content.contains(v)) {
                                tableFlag = false;
                            }
                        }

                        if (tableFlag) {
                            if (tempTableId != null) {
                                peerTableId = tempTableId;
                            }
                        }
                    }
                }
            }

            if (tableId != null && peerTableId != null) {
                Map map = new HashMap<>();
                map.put("tableId", tableId);
                map.put("peerTableId", peerTableId);
                peerIdMapper.add(map);
            }
        }

        return peerIdMapper;
    }

    private void handleRelation(Connection connection, List<String> row,
                                Map<List<String>, Object> masterIdMap, Map<List<String>, Object> slaveIdMap,
                                TableRelation tableRelation) throws SQLException {
        Set<List<String>> masterIdSet = masterIdMap.keySet();
        Set<List<String>> slaveIdSet = slaveIdMap.keySet();
        String relativeTable = tableRelation.getRelativeTable();

        {
            List<String> masterRow = findInsertedRow(row, masterIdSet);
            List<String> slaveRow = findInsertedRow(row, slaveIdSet);

            if (masterRow != null && slaveRow != null) {
                System.out.println("原始数据===============" + row.toString());
                System.out.println("master数据============" + masterRow.toString());
                System.out.println("对应的slave数据========" + slaveRow.toString());
                System.out.println("对应的slaveID==========" + slaveIdMap.get(slaveRow));
                System.out.println("slave需要的masterID====" + masterIdMap.get(masterRow) + "\n");

                Map<String, Object> updates = new HashMap<>();
                updates.put(tableRelation.getRelativeKeyField(), masterIdMap.get(masterRow).toString());

                Map<String, Object> wheres = new HashMap<>();
                Object slaveRowId = slaveIdMap.get(slaveRow);
                wheres.put(PRIMARY_KEY_ID, slaveRowId);

                int success = DatabaseReadWrite.updateTable(connection, relativeTable, updates, wheres);
                if (success == 0) {
                    System.out.println("fail");
                } else {
                    System.out.println(success + "success");
                }
            }
        }


        /// replaced by findInsertedRow()
        if (false) {
            for (List<String> masterRow : masterIdSet) {
                boolean isMasterWithinFlag = true;

                for (String masterRowCellValue : masterRow) {
                    if (!row.contains(masterRowCellValue)) {
                        isMasterWithinFlag = false;
                        break;
                    }
                }

                /// this is master relative row
                if (isMasterWithinFlag) {
                    for (List<String> slaveRow : slaveIdSet) {
                        boolean isMasterSlaveMatch = true;
                        for (String slaveRowCellValue : slaveRow) {
                            if (slaveRowCellValue != null && slaveRowCellValue.length() > 0) {
                                if (!row.contains(slaveRowCellValue)) {
                                    isMasterSlaveMatch = false;
                                    break;
                                }
                            }
                        }

                        if (isMasterSlaveMatch) {
                            System.out.println("原始数据===============" + row.toString());
                            System.out.println("master数据============" + masterRow.toString());
                            System.out.println("对应的slave数据========" + slaveRow.toString());
                            System.out.println("对应的slaveID==========" + slaveIdMap.get(slaveRow));
                            System.out.println("slave需要的masterID====" + masterIdMap.get(masterRow) + "\n");

                            Map<String, Object> updates = new HashMap<>();
                            updates.put(tableRelation.getRelativeKeyField(), masterIdMap.get(masterRow).toString());

                            Map<String, Object> wheres = new HashMap<>();
                            Object slaveRowId = slaveIdMap.get(slaveRow);
                            wheres.put(PRIMARY_KEY_ID, slaveRowId);

                            int success = DatabaseReadWrite.updateTable(connection, relativeTable, updates, wheres);
                            if (success == 0) {
                                System.out.println("fail");
                            } else {
                                System.out.println(success + "success");
                            }
                        }
                    }
                }
            }
        }
    }


    /**
     * 查找 左边的行，其值包含在 contentRow 内
     *
     * @param contentRow
     * @param insertedRow
     * @return
     */
    private List<String> findInsertedRow(List<String> contentRow, Set<List<String>> insertedRow) {

        /// build hash
        //Map<String,String> contentRowHash = new HashMap<>();
        //for(String v : contentRow){
        //    if(v!=null && v.length()>0){
        //       contentRowHash.put(v, v);
        //    }
        //}


        for (List<String> masterRow : insertedRow) {
            boolean isMasterWithinFlag = true;

            for (String masterRowCellValue : masterRow) {
                if (masterRowCellValue != null && masterRowCellValue.length() > 0) {

                    if (!contentRow.contains(masterRowCellValue)) {
                        isMasterWithinFlag = false;
                        break;
                    }
                }
            }

            if (isMasterWithinFlag) {
                return masterRow;
            }
        }

        return null;
    }


    /**
     * 构建数据行与实体ID的对应关系
     */
    private Map<List<String>, Object> getMapIdContent(List<List<String>> originContents) {
        Map<List<String>, Object> mapIdContent = new HashMap<>();
        for (List<String> content : originContents) {
            String id = content.remove(0);
            mapIdContent.put(content, id);
        }
        return mapIdContent;
    }

    private Map<String, TableTarget> buildTargetHash(List<TableTarget> list) {
        if (list != null) {
            Map<String, TableTarget> hash = new HashMap<>();
            for (TableTarget t : list) {
                hash.put(t.getTable(), t);
            }
            return hash;
        }
        return null;
    }

   /* private boolean containsTable(List<TableTarget> list, String table){
        if(list!=null) {
            Map<String, TableTarget> hash = new HashMap<>();
            for (TableTarget t : list) {
                hash.put(t.getTable(), t);
            }
            return hash.containsKey(table);
        }
        return false;
    }
    private TableTarget getTableTarget(List<TableTarget> list, String table){
        if(list!=null) {
            Map<String, TableTarget> hash = new HashMap<>();
            for (TableTarget t : list) {
                hash.put(t.getTable(), t);
            }
            if(hash.containsKey(table)){
                return hash.get(table);
            }
        }
        return null;
    }*/
}
