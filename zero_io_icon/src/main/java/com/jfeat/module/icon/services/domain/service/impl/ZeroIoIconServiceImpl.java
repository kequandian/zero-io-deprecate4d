package com.jfeat.module.icon.services.domain.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.jfeat.module.icon.properties.IconFileProperties;
import com.jfeat.module.icon.services.domain.dao.QueryZeroIoIconDao;
import com.jfeat.module.icon.services.domain.service.ZeroIoIconService;
import com.jfeat.module.icon.services.gen.crud.service.impl.CRUDZeroIoIconServiceImpl;
import com.jfeat.module.icon.services.gen.persistence.dao.ZeroIoIconMapper;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;
import com.jfeat.module.icon.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author admin
 * @since 2017-10-16
 */

@Service("zeroIoIconService")
public class ZeroIoIconServiceImpl extends CRUDZeroIoIconServiceImpl implements ZeroIoIconService {

    private static Logger log = LoggerFactory.getLogger(ZeroIoIconService.class);

    @Override
    protected String entityName() {
        return "ZeroIoIcon";
    }


    @Autowired
    IconFileProperties iconFileProperties;

    @Resource
    ZeroIoIconMapper zeroIoIconMapper;

    @Resource
    QueryZeroIoIconDao queryZeroIoIconDao;

    @Override
    public List<ZeroIoIcon> getFileInfo(){
        File[] fileArray;
        String path = iconFileProperties.getFileIconUploadPath();

        if (path==null||path.equals("")){
            log.info("icon Path not set");
        }

        File file=new File(path);

        List<ZeroIoIcon> result = new ArrayList<>();

        if(file.exists()){
            LinkedList<File> list = new LinkedList<File>();
            list.add(file);
            while(!list.isEmpty()){
                File fileFirst = list.removeFirst();
                fileArray = fileFirst.listFiles();
                for(File f:fileArray){
                    if(f.isDirectory()){
                        list.add(f);
                    }else{
                        ZeroIoIcon zeroIoIcon = new ZeroIoIcon();

                        try {
                            zeroIoIcon.setCheckSum(FileUtil.md5HashCode32(new FileInputStream(f)));
                        }catch (FileNotFoundException e){
                            log.error("file not found");
                        }
                        zeroIoIcon.setPath(File.separator.concat(f.getPath()));
                        zeroIoIcon.setName(f.getName());
                        zeroIoIcon.setCreateTime(new Date());
                        result.add(zeroIoIcon);
                    }
                }
            }
        }else{
            log.info(path+"文件不存在!");
        }
        return result;
    }




    @Override
    @Transactional
    public Integer synFileInfoTODatabase() {

        Integer affect = 0;
        List<ZeroIoIcon> fileIconList = getFileInfo();

        String startWith =File.separator.concat(iconFileProperties.getFileIconUploadPath());

        QueryWrapper<ZeroIoIcon> queryWrapper = new QueryWrapper<>();
        List<ZeroIoIcon> databaseList =  zeroIoIconMapper.selectList(queryWrapper);

//        求数据和实际文件之间的交集
        List<ZeroIoIcon> intersectionList = new ArrayList<>();
        for (ZeroIoIcon fileIcon:fileIconList){
            for (ZeroIoIcon databaseIcon:databaseList){
                if (databaseIcon.getPath().startsWith(startWith) && fileIcon.getPath().equals(databaseIcon.getPath()) && fileIcon.getName().equals(databaseIcon.getName())){
                    intersectionList.add(databaseIcon);
                    break;
                }
            }
        }

//        求实际文件中已经删除的文件
        List<ZeroIoIcon> deleteIconList = new ArrayList<>();
        for (ZeroIoIcon databaseIcon:databaseList){
            boolean flag = true;
            if (!databaseIcon.getPath().startsWith(startWith)){
                continue;
            }
            for (ZeroIoIcon intersection:intersectionList){

                if (intersection.getPath().equals(databaseIcon.getPath()) && intersection.getName().equals(databaseIcon.getName())){
                   flag = false;
                }
            }
            if (flag){
                deleteIconList.add(databaseIcon);
            }

        }


//        求文件中新增部分
        List<ZeroIoIcon> insertIconList = new ArrayList<>();
        for (ZeroIoIcon fileIcon:fileIconList){
            boolean flag = true;
            for (ZeroIoIcon intersection:intersectionList){
                if (fileIcon.getPath().equals(intersection.getPath())  && fileIcon.getName().equals(intersection.getName())){
                    flag = false;
                }
            }
            if (flag){
                insertIconList.add(fileIcon);
            }

        }

        if (deleteIconList!=null && deleteIconList.size()>0){
           affect+= zeroIoIconMapper.deleteBatchIds(deleteIconList.stream().map(ZeroIoIcon::getId).collect(Collectors.toList()));
        }

        if (insertIconList!=null && insertIconList.size()>0){
         affect+=   queryZeroIoIconDao.batchInsert(insertIconList);
        }

        return affect;
    }

    @Override
    public Integer deleteFile(Long id) {
        Integer affect = 0;
        ZeroIoIcon zeroIoIcon = zeroIoIconMapper.selectById(id);
        if (zeroIoIcon==null||zeroIoIcon.getPath()==null){
            return affect;
        }
        File file = new File(zeroIoIcon.getPath());
        if (file.exists()&&file.isFile()){
            file.delete();
            affect +=zeroIoIconMapper.deleteById(id);
        }


        return affect;
    }

}
