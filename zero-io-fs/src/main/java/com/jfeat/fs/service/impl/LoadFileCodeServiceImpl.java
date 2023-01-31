package com.jfeat.fs.service.impl;

import com.google.common.cache.Cache;
import com.google.common.cache.CacheBuilder;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.fs.service.LoadFileCodeService;
import com.jfeat.fs.model.FileInfo;
import com.jfeat.fs.util.ImageUtil;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.Assert;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import java.util.stream.Stream;

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

    // public static void main(String[] args){
    //     String[] imageExt = new String[] {"jpg", "jpeg", "png"};
    //     String[] zipExt = new String[] {"zip", "gzip", "bz2", "tar", "7z", "rar"};
    //     String[] docExt = new String[] {"doc", "docx", "ppt", "xlsx", "xls"};

    //     System.out.println(String.join(",", String.join(",", imageExt), String.join(",", zipExt), String.join(",", docExt)));
    // }


    @Override
    public FileInfo uploadFile(MultipartFile file, String fileSavePath, String bucket, String appid, String fileHost) throws IOException {
        String originalFileName = file.getOriginalFilename();
        String extensionName = FilenameUtils.getExtension(originalFileName);

        // if(extensionName != null){
        //     if(extensionName.equals("exe")||extensionName.equals("java")||extensionName.equals("jsp")||extensionName.equals("php")||extensionName.equals("asp")){
        //         throw new BusinessException(BusinessCode.BadRequest,  "文件类型有误! 不能为：" + extensionName +"类型的文件");
        //     }
        // }
        if(extensionName != null){
            String[] imageExt = new String[] {"jpg", "jpeg", "png"};
            String[] zipExt = new String[] {"zip", "gzip", "bz2", "tar", "7z", "rar"};
            String[] docExt = new String[] {"doc", "docx", "ppt", "xlsx", "xls"};

            if(Stream.of(imageExt).anyMatch(ext->ext.equals(extensionName)) || Stream.of(zipExt).anyMatch(ext->ext.equals(extensionName)) || Stream.of(docExt).anyMatch(ext->ext.equals(extensionName))){
                // pass
            }else{
                throw new BusinessException(BusinessCode.BadRequest,  "仅支持有限的文件类型：" + String.join(",", String.join(",", imageExt), String.join(",", zipExt), String.join(",", docExt)));
            }
        }

        Long fileSize = file.getSize();
        String fileName = UUID.randomUUID() + "." + extensionName;
        // just ensure fileSavePath exists
        {
            File fileSaveFile = new File(fileSavePath);
            if (!fileSaveFile.exists()) {
                fileSaveFile.mkdirs();
            }
        }

        // check bucket exists, cos's required authorized.
        if ((!StringUtils.isEmpty(bucket)) || (!StringUtils.isEmpty(appid))) {
            String targetPath = String.join(File.separator, fileSavePath, bucket);
            File bucketFile = new File(targetPath);
            Assert.isTrue(bucketFile.exists(), "path from (X-FS-BUCKET) not exists: " + bucketFile.getPath());
        }

        // get current year
        String currentYear = new SimpleDateFormat("yyyy").format(new Date());
        // just ensure targetFilePath exists
        {
            String targetFilePath = String.join(File.separator, fileSavePath, bucket, appid, currentYear);
            File tmpFileSaveFile = new File(targetFilePath);
            if (!tmpFileSaveFile.exists()) {
                tmpFileSaveFile.mkdirs();
            }
        }
        File targetFile = new File(String.join(File.separator, fileSavePath, bucket, appid, currentYear, fileName));

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
        String pathFileName = String.join(File.separator, appid, currentYear, fileName);
        return FileInfo.create(fileHost, bucket, pathFileName, extensionName, originalFileName, fileSize, relativePath);
    }

    @Override
    public FileInfo upload64(String base64Data, Boolean blur, String fileSavePath, String bucket, String appid, String fileHost) throws IOException{
        String dataPrix = "";
        String data = "";
        String[] d = base64Data.split("base64,");
        if (d != null && d.length == 2) {
            dataPrix = d[0];
            data = d[1];
        } else {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        String suffix = "";
        if ("data:image/jpeg;".equalsIgnoreCase(dataPrix)) {
            suffix = ".jpg";
        } else if ("data:image/x-icon;".equalsIgnoreCase(dataPrix)) {
            suffix = ".ico";
        } else if ("data:image/gif;".equalsIgnoreCase(dataPrix)) {
            suffix = ".gif";
        } else if ("data:image/png;".equalsIgnoreCase(dataPrix)) {
            suffix = ".png";
        } else {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        byte[] dataBytes = Base64Utils.decodeFromString(data);

        String pictureName = UUID.randomUUID().toString() + suffix;
        String blurryName = "";

        String targetPath = String.join(File.separator, fileSavePath, bucket, appid, pictureName);
        File target = new File(targetPath);

        target.setReadable(true);
        FileUtils.writeByteArrayToFile(target, dataBytes);
        logger.info("file uploaded to: {}", target.getAbsolutePath());
        File reducedFile = ImageUtil.reduce(target);
        logger.info("file reduced to: {}", reducedFile.getAbsolutePath());
        pictureName = reducedFile.getName();

        File thumbFile = ImageUtil.thumb(reducedFile);
        logger.info("file thumb to: {}", thumbFile.getAbsoluteFile());

        if (blur) {
            File blurryFile = ImageUtil.reduce(ImageUtil.gaos(reducedFile));
            blurryFile.setReadable(true);
            blurryName = blurryFile.getName();

            File blurryThumbFile = ImageUtil.thumb(blurryFile);
            logger.info("blurry file thumb to: {}", blurryThumbFile.getAbsoluteFile());
        }

        return FileInfo.create(fileHost, pictureName, blurryName);
    }
}
