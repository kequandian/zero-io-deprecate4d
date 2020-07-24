package com.jfeat.util;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import org.springframework.core.io.ClassPathResource;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

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

    public static float[] toFloatArray(List<Float> floatList) {
        float[] floatArray = new float[floatList.size()];
        int i = 0;

        for (Float f : floatList) {
            floatArray[i++] = (f != null ? f : Float.NaN); // Or whatever default you want.
        }
        return floatArray;
    }

    /**
     * 获取测试模版文件
     */
    public static JSONObject readTemplateFile(String fileName) {
        String path = String.format("templates/%s.json", fileName);
        StringBuilder sb = new StringBuilder();
        try {
            InputStream inputStream = new ClassPathResource(path).getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(inputStream));
            String s;
            try {
                while ((s = in.readLine()) != null) {
                    sb.append(s);
                    sb.append("\n");
                }
            } finally {
                in.close();
            }
        } catch (IOException var8) {
            throw new RuntimeException(var8);
        }

        return JSONObject.parseObject(sb.toString());
    }

    public static JSONArray readJSONArrayFile(String fileName) {
        String path = String.format("templates/%s.json", fileName);
        StringBuilder sb = new StringBuilder();
        try {
            InputStream inputStream = new ClassPathResource(path).getInputStream();
            BufferedReader in = new BufferedReader(new InputStreamReader(inputStream));
            String s;
            try {
                while ((s = in.readLine()) != null) {
                    sb.append(s);
                    sb.append("\n");
                }
            } finally {
                in.close();
            }
        } catch (IOException var8) {
            throw new RuntimeException(var8);
        }

        return JSONObject.parseArray(sb.toString());
    }

    public static void main(String[] args) {
        List<String> list = Arrays.asList("${test}", "test");

        List<String> update = list.stream().map(item -> {
            if ("${test}".equals(item)) {
                return "update";
            }
            return item;
        }).collect(Collectors.toList());
        System.out.println(update);
    }
}
