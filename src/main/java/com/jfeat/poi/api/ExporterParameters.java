package com.jfeat.poi.api;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by vincenthuang on 25/04/2018.
 * 由业务层指定可导出的 table, 没有定义即无 table 被允许导出
 */
public class ExporterParameters {
    static ExporterParameters inst = new ExporterParameters();

    public static ExporterParameters me(){
        return inst;
    }

    /**
     * 从 SQL 查询语名中查找 表名
     * @param query
     * @return
     */
    public static String[] findTablesFromSql(String query){
        String[] tables = new String[0];
        query = query.toLowerCase();
        query = query.replace("\n"," ").replace("\t"," ");
        // trim where
        int index = query.indexOf(" where ");
        if(index>0){
            query = query.substring(0, index);
        }

        boolean noJoinFound = query.indexOf(" join ")==-1;
        if(noJoinFound){
            // trim select
            index = query.indexOf(" from ");
            query = query.substring(index+" from ".length(), query.length());
            query = query.trim();

            // check single table or more
            if(query.indexOf(",")>=0){
                tables = query.split(", ");
            }else if(query.length()>0){
                /// only one table
                tables = new String[]{query.split(" ")[0]};
            }

            for(int i=0; i<tables.length; i++){
                String tab = tables[i];
                if(tab.matches("\\w+")){
                    /// ok
                }else{
                    tables[i] = tab.substring(0, tab.indexOf(" ")>=0?tab.indexOf(" "):tab.length());
                }
            }


        }else{
            // trim select
            index = query.indexOf(" from ");
            query = query.substring(index+" from ".length(), query.length());
            query = query.trim();

            String[] lines = query.split(" join ");
            for(int i=0; i<lines.length; i++){
                String line = lines[i];
                if(line.indexOf(" on ")>=0) {
                    lines[i] = line.substring(0, line.indexOf(" on "));
                }
            }

            /// split each line
            List<String> list = new ArrayList<>();

            for(String line : lines) {
                // check single table or more
                if (line.indexOf(",") >= 0) {
                    tables = query.split(", ");
                }else{
                    tables = new String[]{line};
                }

                for (int i = 0; i < tables.length; i++) {
                    String tab = tables[i];
                    if (tab.matches("\\w+")) {
                    } else {
                        tables[i] = tables[i].trim();
                        tables[i] = tab.substring(0, tab.indexOf(" ") >= 0 ? tab.indexOf(" ") : tab.length());
                    }
                }

                for(String t : tables){
                    list.add(t);
                }
            }


            tables = list.toArray(new String[0]);
        }

        return tables;
    }


    /**
     * class ExporterParameters
     */

    /// permission
    private Map<String,String> tables = new HashMap<>();

    public ExporterParameters(){

    }

    public ExporterParameters permitTable(String table){
        tables.put(table, table);
        return this;
    }

    public boolean canTableExported(String table){
        return table.contains(table);
    }
}
