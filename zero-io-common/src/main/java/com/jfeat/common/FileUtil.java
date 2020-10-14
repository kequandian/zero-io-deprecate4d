package com.jfeat.common;

import cn.hutool.core.io.IoUtil;
import cn.hutool.core.util.StrUtil;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.TypeReference;
import lombok.SneakyThrows;
import lombok.experimental.UtilityClass;
import lombok.extern.slf4j.Slf4j;

import java.io.File;
import java.io.FileReader;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created on 2020/8/8.
 *
 * @author Wen Hao
 */
@UtilityClass
@Slf4j
public class FileUtil {

    @SneakyThrows
    public List<String> readLine(String filePath) {
        File templateFile = new File(filePath);
        if (!templateFile.exists()) {
            log.error("文件 : " + filePath + "不存在!");
            throw new RuntimeException("文件 : " + filePath + "不存在!");
        }
        // 读取sql
        List<String> lines = new ArrayList<>();
        IoUtil.readLines(new FileReader(templateFile), lines);
        return lines;
    }

    @SneakyThrows
    public String readJsonString(String fileName) {
        log.info("read file path: {}", fileName);
        FileReader fileReader = new FileReader(new File(fileName));
        String jsonStr = IoUtil.read(fileReader);
        IoUtil.close(fileReader);

        return jsonStr;
    }

    @SneakyThrows
    public JSONObject readJsonFile(String fileName) {
        String jsonStr = readJsonString(fileName);
        return JSONObject.parseObject(jsonStr);
    }

    @SneakyThrows
    public <T> T readJsonFile(String fileName, Class<T> clazz) {
        String jsonStr = readJsonString(fileName);
        return JSONObject.parseObject(jsonStr, clazz);
    }

    public <T> T parseJsonFile(String fileName, TypeReference<T> type) {
        String jsonStr = readJsonString(fileName);
        return JSON.parseObject(jsonStr, type);
    }

    public void main(String[] args) {

        String templateFilePath = "excel-templates/equipment.sql";
        Map<String, String> replaceMap = new HashMap<>();
        replaceMap.put("categoryxId", "10");
        // 逐行读取 sql文件
        List<String> sqlLines = FileUtil.readLine(templateFilePath);

        // 构建 sql
        StringBuilder sqlBuilder = new StringBuilder();
        for (String sqlLine : sqlLines) {
            sqlLine = StrUtil.trimStart(sqlLine);
            // 替换并消除注释
            // 注释开头
            if (sqlLine.startsWith("---")) {
                for (Map.Entry<String, String> entry : replaceMap.entrySet()) {
                    String replace = String.format("#{%s}", entry.getKey());
                    if (sqlLine.contains(replace)) {
                        // 替换字段并消除注释
                        sqlLine = StrUtil.removePrefix(sqlLine, "---");
                        sqlLine = StrUtil.replace(sqlLine, replace, entry.getValue());
                    }
                }
            }
            sqlBuilder.append(sqlLine).append("\n");
        }
        String sql = sqlBuilder.toString();
        System.out.println(sql);
    }
}
