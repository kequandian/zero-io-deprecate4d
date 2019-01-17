package com.jfeat.poi.agent.util.converter.impl;

import com.jfeat.poi.agent.im.request.TableTarget;
import com.jfeat.poi.agent.util.TableConvert;
import com.jfeat.poi.agent.util.converter.ValueConverter;

import java.util.List;

/**
 * Created by craftperson on 2018/5/9.
 */
public class ValueConverterImpl implements ValueConverter {
    @Override
    public Object convert(List<TableConvert> tableConverts, List<TableTarget> target, List<List<String>> contents) {

        if(target==null||target.size()==0)
            throw new  IllegalArgumentException("tableTarget is null");

        for(TableConvert tableConvert : tableConverts){

            int indexOfContentColumn = getIndexOfContentColumn(tableConvert, target);

            for(List<String> content:contents){
                String temp = content.get(indexOfContentColumn);
                if(temp.trim().toLowerCase().compareTo(tableConvert.getOldValue().toLowerCase())==0){
                    content.set(indexOfContentColumn, tableConvert.getNewValue());
                }
            }

        }

        return contents;
    }

    @Override
    public Object convert(Object object) {
        return null;
    }

    private int getIndexOfContentColumn(TableConvert tableConvert, List<TableTarget> target){
        int size = 0;

        for(TableTarget tableTaget : target){
            if(tableTaget.getTable().toLowerCase().trim().compareTo(tableConvert.getTable().trim().toLowerCase())==0){
                List<String> fields = tableTaget.getFields();
                if(fields.contains(tableConvert.getField())){
                    int i = fields.indexOf(tableConvert.getField());
                    size += i;
                    break;
                }else{
                    throw  new IllegalArgumentException("当你看到这条信息的时候，你应该怀疑List<ValueConverterInfo> 中table "+tableTaget.getTable()+"是不是配错了");
                }
            }else{
                size += tableTaget.getFields().size();
            }
        }

        return size;
    }
}
