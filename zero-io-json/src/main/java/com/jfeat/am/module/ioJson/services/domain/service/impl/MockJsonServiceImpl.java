package com.jfeat.am.module.ioJson.services.domain.service.impl;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SerializerFeature;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.IdWorker;
import com.jfeat.am.module.ioJson.services.domain.service.MockDataBaseService;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.am.module.ioJson.services.domain.util.FileUtil;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
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

    /**
     * 返回所有基于 appid 的配置列表
     * app.map [  {"appid": "", "appkey": ""}  ]
     * 提供API 设置当前 appid,  api由  appkey授权,  一个 app 一个保存目录, 每个目录一个 site.map，  {"id": "2323", "filename":"个人中心.json"}
     */


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

    @Resource
    FrontPageMapper frontPageMapper;

    @Resource
    MockDataBaseService mockDataBaseService;




    @Override
    public JSONObject readJsonFile(Long id){

       return readJsonFile(id,null);

    }

    @Override
    public JSONObject readJsonFile(Long id,String tag) {
        checkAppMap();

        //如果有tag，则用tag查出来的id作为
        if(tag != null && !tag.equals("")){
            QueryWrapper<FrontPage> qw = new QueryWrapper<>();
            qw.eq("tag",tag);
            FrontPage frontPage = frontPageMapper.selectOne(qw);
            if(frontPage == null){throw new BusinessException(BusinessCode.BadRequest,"tag："+tag+" 对应的页面配置不存在");}
            id  =  frontPage.getId();
        }


        JSONObject json = new JSONObject();

        Map<String, String> idMap = getIdMap();
        String fileName = idMap.get(id.toString());
        if (fileName == null || fileName.equals("")) {
            throw new BusinessException(BusinessCode.BadRequest, "该id对应的数据不存在");
        } else {

            File jsonFile = new File(dir + File.separator + appId + File.separator + fileName);
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
    public Integer saveJsonToFile(JSONObject json, Long id) {
       return saveJsonToFile(json,id,null);
    }


    @Override
    public Integer saveJsonToFile(JSONObject json, Long id, String tag) {

        checkAppMap();

        Integer i = 0;
        Map<String, String> idMap = getIdMap();
        //已有id处理
        String savefileName = idMap.get(id.toString());
        String fileName;
        if (savefileName != null && !"".equals(savefileName)) {
            fileName = savefileName;
        } else {
            fileName = IdWorker.getIdStr() + ".json";
        }

//        写入数据库
        mockDataBaseService.saveJsonToDataBase(json,id,fileName);
        i++;

        String content = JSON.toJSONString(json, SerializerFeature.PrettyFormat, SerializerFeature.WriteMapNullValue,
                SerializerFeature.WriteDateUseDateFormat);


        File file = new File(dir + File.separator + appId + File.separator + fileName);
        try {
            if (file.exists()) {
                file.delete();
            }
            Writer write = new OutputStreamWriter(new FileOutputStream(file), "UTF-8");
            write.write(content);
            write.flush();
            write.close();

            i++;
            FileUtil.writeProperties(id.toString(), fileName, FileUtil.getFile(dir + File.separator + appId
                    , dir + File.separator + appId + File.separator + "appSite.properties"));
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }


        return i;
    }


    //检查appId是否已记录进配置文件
    void checkAppMap() {
        Map<String, String> appIdMap = getAppIdMap();
        if (appIdMap.get(appId) == null) {
            FileUtil.writeProperties(appId, appId, FileUtil.getFile(dir, dir + File.separator + "appMap.properties"));
        }
    }


    //获取Appid配置文件
/*    public File getAppMapFile(){
        return getFile(appMapFilePath);
    }*/


/*    public File getDefaultPropertiesFile(){
        return getFile(defaultPropertiesFilePath);
    }*/


    @Override
    public String getAppId() {
        if (appId == null) {
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
    public Map<String, String> getIdMap() {
        return FileUtil.readProperties(dir + File.separator + appId, dir + File.separator + appId + File.separator + "appSite.properties");
    }

    //获取AppId 的 配置列表
    @Override
    public Map<String, String> getAppIdMap() {
        return FileUtil.readProperties(dir, dir + File.separator + "appMap.properties");
    }


    @Override
    public void setAppId(String appId) {
        this.appId = appId;
    }




}
