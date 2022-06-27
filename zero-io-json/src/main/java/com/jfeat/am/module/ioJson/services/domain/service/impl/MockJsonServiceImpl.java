package com.jfeat.am.module.ioJson.services.domain.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
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
    private static String defaultPropertiesFilePath = "jsonMock/site.properties";

    private static String appMapFilePath = "jsonMock/appSite.properties";

    private static final String DEFAULT_APP_ID = "DEFAULT";

    private static String appId = DEFAULT_APP_ID;

/*    private static String appPropertiesFile = dir + File.separator + appId + File.separator + "appSite.properties";

    private static String appDir = dir + File.separator + appId;*/


    @Override
    public JSONObject readJsonFile(Long id){
        checkAppMap();

        JSONObject json = new JSONObject();

        Map<String, String> idMap = getIdMap();
        String fileName = idMap.get(id.toString());
        if(fileName == null || fileName.equals("")){
            throw new BusinessException(BusinessCode.BadRequest,"该id对应的数据不存在");
        }else{

            File jsonFile = new File(dir + File.separator+ appId+File.separator +fileName);
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

        checkAppMap();

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


        File file = new File(dir + File.separator + appId + File.separator + fileName);
        try {
            if(file.exists()){
                file.delete();
            }
            Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            write.write(content);
            write.flush();
            write.close();

            i++;
            writeProperties(id.toString(),fileName,getFile(dir + File.separator + appId + File.separator + "appSite.properties"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return i;
    }



    @Override
    public void writeProperties(String proKey, String proValue,File file) {
        //Map<String, String> idMap = getIdMap();
        Map<String, String> idMap = readProperties(file);
        Properties properties = new Properties();
        OutputStream output = null;
        try {
          /*  File file = null;
            file = getFile(dir + File.separator + appId + File.separator + "appSite.properties");*/

            output = new FileOutputStream(file);
            for(String key:idMap.keySet()){
                String value = idMap.get(key);
                properties.setProperty(key, value);
            }
            properties.setProperty(proKey, proValue);

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

    //检查appId是否已记录进配置文件
   void  checkAppMap(){
        Map<String, String> appIdMap = getAppIdMap();
        if(appIdMap.get(appId) == null){
            writeProperties(appId,appId,getFile(dir, dir + File.separator + "appMap.properties"));
        }
    }




    //获取Appid配置文件
/*    public File getAppMapFile(){
        return getFile(appMapFilePath);
    }*/


/*    public File getDefaultPropertiesFile(){
        return getFile(defaultPropertiesFilePath);
    }*/


    public File getFile(String filePath){
        File file = new File(filePath);
        File fileDir = new File(dir + File.separator + appId);
        if(!file.exists()){
            fileDir.mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;
    }


    public File getFile(String dir,String filePath){
        File file = new File(filePath);
        File fileDir = new File(dir);
        if(!file.exists()){
            fileDir.mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;

    }

    /**
     * 返回所有基于 appid 的配置列表
     * app.map [  {"appid": "", "appkey": ""}  ]
     * 提供API 设置当前 appid,  api由  appkey授权,  一个 app 一个保存目录, 每个目录一个 site.map，  {"id": "2323", "filename":"个人中心.json"}
     * */



    @Override
    public String getAppId(){
        if(appId == null){
            appId = DEFAULT_APP_ID;
        }
        return appId;
    }


    /**
     * 获取文件中的内容,并返回map
     *
     * @return
     */
    @Override
    public  Map<String, String> getIdMap() {
        return readProperties(dir + File.separator + appId ,dir + File.separator + appId + File.separator + "appSite.properties");
    }

    //获取AppId 的 配置列表
    @Override
    public Map<String,String> getAppIdMap(){
       return readProperties(dir, dir + File.separator + "appMap.properties");
    }

    public Map<String,String> readProperties(File file){
        Map<String, String> map = new HashMap<String, String>();
        InputStream in = null;
        Properties p = new Properties();;
        try {
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



    public Map<String,String> readProperties(String dir,String filePath){
        Map<String, String> map = new HashMap<String, String>();
        InputStream in = null;
        Properties p = new Properties();;
        try {
            File file = null;
            file = getFile(dir, filePath);
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
    public void setAppId(String appId){
        this.appId = appId;
    }


}
