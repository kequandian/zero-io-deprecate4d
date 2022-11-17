package com.jfeat.fs.service.impl;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.fs.api.FileServiceEndpoint;
import com.jfeat.fs.properties.FSProperties;
import com.jfeat.fs.service.LoadFileCodeService;
import com.jfeat.fs.util.FileInfo;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;

/**
 * Created by jackyhuang on 2018/1/3.
 */
@Service
public class LoadFileCodeServiceImpl implements LoadFileCodeService {


    protected final static Logger logger = LoggerFactory.getLogger(LoadFileCodeService.class);



    private static Cache<String, String> cache = CacheBuilder
            .newBuilder()
            .maximumSize(100)
            .expireAfterAccess(60, TimeUnit.SECONDS) //当缓存项在指定的时间段内没有被读或写就会被回收。
            .build();


    @Override
    public String genAndGetCode(String name) {
        String key = UUID.randomUUID().toString();
        cache.put(key, name);
        return key;
    }

    @Override
    public boolean checkCode(String code) {
        try {

            String name = cache.get(code, () -> "");

            if (name == null || name.equals("")) {
                return false;
            }

            return true;
        } catch (ExecutionException e) {
            return false;
        }
    }

//    上传接口
    @Override
    public FileInfo uploadFile(MultipartFile file, String fileHost,String fileSavePath, String bucket) {
        if (file.isEmpty()) {
            throw new BusinessException(BusinessCode.BadRequest, "file is empty");
        }
        if (bucket == null) bucket = "";
        logger.info("============== upload start ===============");
        String originalFileName = file.getOriginalFilename();
        String extensionName = FilenameUtils.getExtension(originalFileName);
        if (extensionName != null) {
            if (extensionName.equals("html") || extensionName.equals("js") || extensionName.equals("htm")) {
                throw new BusinessException(BusinessCode.BadRequest, "文件类型有误 不能为：" + extensionName + "类型的文件");
            }
        }
        Long fileSize = file.getSize();
        String fileName = UUID.randomUUID() + "." + extensionName;

        try {
            {
                File fileSaveFile = new File(fileSavePath);
                if (!fileSaveFile.exists()) {
                    fileSaveFile.mkdirs();
                }
            }

            // check bucket exists
            if (!StringUtils.isEmpty(bucket)) {
                File bucketFile = new File(String.join(File.separator, fileSavePath, bucket));
                Assert.isTrue(bucketFile.exists(), "bucket (X-FS-BUCKET) not exists: " + bucketFile.getPath());
            }

            File targetFile = new File(String.join(File.separator, fileSavePath, bucket, fileName));

            //boolean readable = target.setReadable(true);
            //if(readable){
            logger.info("file uploading to: {}", targetFile.getAbsolutePath());
            FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
            logger.info("file uploaded to: {}", targetFile.getAbsolutePath());
            /*}else{
                throw new BusinessException(BusinessCode.UploadFileError, "file is not readable");
            }*/

            // get relative path
            String relativePath = targetFile.getAbsolutePath().substring(new File("./").getAbsolutePath().length() - 1);
            return FileInfo.create(fileHost, bucket, fileName, extensionName, originalFileName, fileSize, relativePath);

        } catch (Exception e) {
            logger.info("============== exception {} ===============");
            logger.info(e.getMessage());
            logger.info(e.getLocalizedMessage());
            logger.info(e.toString());
            throw new BusinessException(BusinessCode.UploadFileError);
        }
    }
}
