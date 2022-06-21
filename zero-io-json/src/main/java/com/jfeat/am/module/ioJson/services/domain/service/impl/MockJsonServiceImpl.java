package com.jfeat.am.module.ioJson.services.domain.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import org.springframework.stereotype.Service;

import java.io.*;
import java.util.*;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author admin
 * @since 2017-10-16
 */

@Service("mockJsonService")
public class MockJsonServiceImpl implements MockJsonService {

    public void saveFile(){

    }

    private static String dir = "jsonMock";
    /**
     * 文件路径
     */
    private static String filePath = "jsonMock/site.properties";


    @Override
    public JSONObject readJsonFile(Long id){

        JSONObject json = new JSONObject();

        Map<String, String> idMap = getIdMap();
        String fileName = idMap.get(id.toString());
        if(fileName == null || fileName.equals("")){
            throw new BusinessException(BusinessCode.BadRequest,"该id对应的数据不存在");
        }else{

            File jsonFile = new File(dir + File.separator +fileName);
            FileReader fileReader = null;
            try {
                fileReader = new FileReader(jsonFile);
                Reader reader = new InputStreamReader(new FileInputStream(jsonFile),"utf-8");
                int ch = 0;
                StringBuffer sb = new StringBuffer();
                while ((ch = reader.read()) != -1) {
                    sb.append((char) ch);
                }
                fileReader.close();
                reader.close();

                json =  (JSONObject) JSONObject.parse(sb.toString());
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
    public Integer saveJsonToFile(JSONObject json, Long id){
        Integer i = 0;
        Map<String, String> idMap = getIdMap();
        //已有id处理
        String savefileName = idMap.get(id.toString());
        String fileName ;
        if(savefileName!=null && !"".equals(savefileName)){
            fileName = savefileName;
        }else{
            fileName = IdWorker.getIdStr() + ".json";
        }

        String content = JSON.toJSONString(json, SerializerFeature.PrettyFormat, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteDateUseDateFormat);


        File file = new File(dir + File.separator + fileName);
        try {
            if(file.exists()){
                file.delete();
            }
            Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            write.write(content);
            write.flush();
            write.close();

            i++;
            writeProperties(id,fileName);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return i;
    }


    /**
     * 获取文件中的内容,并返回map
     *
     * @return
     */
    @Override
    public  Map<String, String> getIdMap() {
        Map<String, String> map = new HashMap<String, String>();
        InputStream in = null;
        Properties p = new Properties();;
        try {
            File file = getFile();
            in = new BufferedInputStream(new FileInputStream(file));
            p.load(in);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Set<Map.Entry<Object, Object>> entrySet = p.entrySet();
        for (Map.Entry<Object, Object> entry : entrySet) {
            map.put((String) entry.getKey(), (String) entry.getValue());
        }
        return map;
    }





    @Override
    public void writeProperties(Long id, String fileName) {
        Map<String, String> idMap = getIdMap();
        Properties properties = new Properties();
        OutputStream output = null;
        try {

            File file = getFile();
            output = new FileOutputStream(file);
            for(String key:idMap.keySet()){
                String value = idMap.get(key);
                properties.setProperty(key, value);
            }
            properties.setProperty(id.toString(), fileName);

            // 保存键值对到文件中

            properties.store(output, "modify" + new Date().toString());

        } catch (IOException io) {
            io.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    public File getFile() throws IOException {
        File file = new File(filePath);
        File fileDir = new File(dir);
        if(!file.exists()){
            fileDir.mkdirs();
            file.createNewFile();
        }
        return file;
    }

}
