package com.jfeat.pdf.util;

import com.alibaba.fastjson.JSONArray;

import java.util.List;

/**
 * Created on 2020/3/13.
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
}
