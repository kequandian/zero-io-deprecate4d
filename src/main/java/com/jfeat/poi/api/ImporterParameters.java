package com.jfeat.poi.api;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by vincenthuang on 25/04/2018.
 * 由业务层指定可导出的 table, 没有定义即无 table 被允许导出
 */
public class ImporterParameters {
    static ImporterParameters inst = new ImporterParameters();

    public static ImporterParameters me(){
        return inst;
    }

    /**
     * class ImporterParameters
     */

    /// permission
    private Map<String,String> tables = new HashMap<>();

    public ImporterParameters(){

    }

    public ImporterParameters permitTable(String table){
        tables.put(table, table);
        return this;
    }

    public boolean canTableImported(String table){
        if(table == null) {
            return false;
        }
        return table.contains(table);
    }
}
