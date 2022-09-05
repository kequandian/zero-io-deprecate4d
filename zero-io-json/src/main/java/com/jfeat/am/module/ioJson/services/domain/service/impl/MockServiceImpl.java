package com.jfeat.am.module.ioJson.services.domain.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.jfeat.am.module.ioJson.services.domain.service.MockService;
import com.jfeat.am.module.ioJson.services.domain.util.FileUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

@Service
public class MockServiceImpl implements MockService {

    public static final String dir = "mock";

    @Override
    public JSONObject readJsonFile(String name, String customDir) {
        checkDirMap(customDir);
        JSONObject json = new JSONObject();

        Map<String, String> dirMap = getNameMap(customDir);
        String fileName = dirMap.get(name);
        if (fileName == null || fileName.equals("")) {
            throw new BusinessException(BusinessCode.BadRequest, "该目录下 对应名字的json配置不存在");
        } else {

            File jsonFile = new File(dir + File.separator + customDir + File.separator + fileName);
            FileReader fileReader = null;
            try {
                fileReader = new FileReader(jsonFile);
                Reader reader = new InputStreamReader(new FileInputStream(jsonFile), "utf-8");
                int ch = 0;
                StringBuffer sb = new StringBuffer();
                while ((ch = reader.read()) != -1) {
                    sb.append((char) ch);
                }
                fileReader.close();
                reader.close();

                json = (JSONObject) JSONObject.parse(sb.toString());
            } catch (FileNotFoundException e) {
                e.printStackTrace();
            } catch (UnsupportedEncodingException e) {
                e.printStackTrace();
            } catch (IOException e) {
                e.printStackTrace();
            }


        }
        return json;
    }

    @Override
    public Integer saveJsonToFile(JSONObject json, String name, String customDir) {
        checkDirMap(customDir);

        Integer i = 0;
        Map<String, String> dirMap = getNameMap(customDir);
        //已有id处理
        String savefileName = dirMap.get(name);
        String fileName;
        if (savefileName != null && !"".equals(savefileName)) {
            fileName = savefileName;
        } else {
            fileName = name + ".json";
        }

        String content = JSON.toJSONString(json, SerializerFeature.PrettyFormat, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteDateUseDateFormat);


        File file = new File(dir + File.separator + customDir + File.separator + fileName);
        try {
            if (file.exists()) {
                file.delete();
            }
            Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            write.write(content);
            write.flush();
            write.close();

            i++;
            FileUtil.writeProperties(name, fileName, FileUtil.getFile(dir + File.separator + customDir
                    , dir + File.separator + customDir + File.separator + "site.properties"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return i;
    }


    //检查dir是否已记录进配置文件
    void checkDirMap(String customDir) {
        Map<String, String> dirMap = getDirIdMap();
        if (dirMap.get(customDir) == null) {
            FileUtil.writeProperties(customDir, customDir, FileUtil.getFile(dir, dir + File.separator + "dirMap.properties"));
        }
    }


    /**
     * 获取文件中的内容,并返回map
     *
     * @return
     */
    public Map<String, String> getNameMap(String customDir) {
        return FileUtil.readProperties(dir + File.separator + customDir, dir + File.separator + customDir + File.separator + "site.properties");
    }

    //获取所有mock的目录配置信息
    @Override
    public Map<String, String> getDirIdMap() {
        return FileUtil.readProperties(dir, dir + File.separator + "dirMap.properties");
    }


}
