package com.jfeat.util;

import com.alibaba.fastjson.JSONArray;

import java.util.ArrayList;
import java.util.List;

/**
 * Created on 2020/1/17.
 *
 * @author Wen Hao
 */
public class JsonUtil {

    public static List<String> toList(JSONArray jsonArray) {
        return toList(jsonArray, String.class);
    }

    public static <T> List<T> toList(JSONArray jsonArray, Class<T> clazz) {
        return jsonArray == null ? null : jsonArray.toJavaList(clazz);
    }

    public static void main(String[] args) {
        List<String> list = new ArrayList<>();
        list.addAll(null);
        System.out.println(list);
    }
}