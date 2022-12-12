package com.jfeat.am.module.ioJson.services.domain.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.am.module.ioJson.services.domain.service.MockDataBaseService;
import com.jfeat.am.module.ioJson.services.domain.service.MockJsonService;
import com.jfeat.am.module.ioJson.services.domain.util.FileUtil;
import com.jfeat.module.frontPage.services.domain.service.FrontPageModuleInfoService;
import com.jfeat.module.frontPage.services.gen.crud.model.FrontPageModuleInfoModel;
import com.jfeat.module.frontPage.services.gen.persistence.dao.FrontPageMapper;
import com.jfeat.module.frontPage.services.gen.persistence.model.FrontPage;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;
import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service("mockDataBaseService")
public class MockDataBaseServiceImpl implements MockDataBaseService {

    @Resource
    MockJsonService mockJsonService;

    @Resource
    FrontPageMapper frontPageMapper;

    @Resource
    FrontPageModuleInfoService frontPageModuleInfoService;


    private static String jsonMockDirMapPath = "jsonMock/appMap.properties";
    private static String mockDirMapPath = "mock/dirMap.properties";

    @Override
    public Integer saveJsonToDataBase(JSONObject json, Long id,String jsonFileName,String tag) {

        Integer affect = 0;
//        if (isSaveFile){
//            affect += mockJsonService.saveJsonToFile(json, id);
//        }

        Map<String, String> idMap = mockJsonService.getIdMap();

//        String jsonFileName = idMap.get(String.valueOf(id));
        String jsonPath = "jsonMock"+File.separator+mockJsonService.getAppId()+File.separator+jsonFileName;
        String title = "";
        if (json!=null&&json.get("title")!=null){
            title = json.get("title").toString();
        }

        FrontPage record = new FrontPage();
        record.setPageId(String.valueOf(id));
        record.setTitle(title);
        record.setContent(json.toJSONString());

        record.setJsonName(jsonFileName);
        record.setJsonPath(jsonPath);
        record.setTag(tag);

//        更新type和moduleName
        frontPageModuleInfoService.setTypeAndModuleName(record,json);

        QueryWrapper<FrontPage> pageQueryWrapper = new QueryWrapper<>();
        pageQueryWrapper.eq(FrontPage.PAGE_ID,id);
        FrontPage frontPage = frontPageMapper.selectOne(pageQueryWrapper);
        if (frontPage==null){
            record.setAppid(mockJsonService.getAppId());
            affect+=frontPageMapper.insert(record);
        }else {
            record.setId(frontPage.getId());
            affect+=frontPageMapper.updateById(record);
        }

        return affect;
    }






    @Override
    @Transactional
    public Integer synchronizationToDataBase() {

        File jsonMockDirMapFile = new File(jsonMockDirMapPath);
//        File mockDirMapFile = new File(mockDirMapPath);

        int affect = 0;

        Map<String,String> jsonMockDirMap = FileUtil.readProperties(jsonMockDirMapFile);
        Iterator<Map.Entry<String, String>> iterator = jsonMockDirMap.entrySet().iterator();

        String appid = mockJsonService.getAppId();

        while (iterator.hasNext()){
            Map.Entry<String, String> entry = iterator.next();
            mockJsonService.setAppId(entry.getKey());
            Map<String, String> idMap = mockJsonService.getIdMap();

            String currentAppid = mockJsonService.getAppId();

            for (Map.Entry<String,String> idMapEntry:idMap.entrySet()){


                String jsonPath = "jsonMock"+File.separator+entry.getValue()+File.separator+idMapEntry.getValue();
                JSONObject contentJson =  mockJsonService.readJsonFile(Long.parseLong(idMapEntry.getKey()));
                String title = "";
                if (contentJson!=null && contentJson.get("title")!=null){
                    title = contentJson.get("title").toString();
                }

                FrontPage record = new FrontPage();
                record.setPageId(idMapEntry.getKey());
                record.setTitle(title);
                record.setContent(contentJson.toJSONString());
                record.setAppid(currentAppid);
                record.setJsonName(idMapEntry.getValue());
                record.setJsonPath(jsonPath);

                QueryWrapper<FrontPage> pageQueryWrapper = new QueryWrapper<>();
                pageQueryWrapper.eq(FrontPage.APPID,currentAppid).eq(FrontPage.JSON_NAME,idMapEntry.getValue());
                FrontPage frontPage = frontPageMapper.selectOne(pageQueryWrapper);
                if (frontPage==null){
                    affect+=frontPageMapper.insert(record);
                }else {
                    record.setId(frontPage.getId());
                    affect+=frontPageMapper.updateById(record);
                }

            }

        }
        mockJsonService.setAppId(appid);
        

        return affect;
    }




}
