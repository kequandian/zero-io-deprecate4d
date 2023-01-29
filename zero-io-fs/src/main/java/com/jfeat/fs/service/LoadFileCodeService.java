package com.jfeat.fs.service;

import com.jfeat.fs.model.FileInfo;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

/**
 * Created by jackyhuang on 2018/1/3.
 */
public interface LoadFileCodeService {

    /**
     * 生成下载码
     * @param name
     * @return
     */
    String genAndGetCode(String name);

    /**
     * 检查下载码，安全检查
     * @param code
     * @return
     */
    boolean checkCode(String code);

    /**
     * 上传文件服务
     * @param file
     * @param fileHost
     * @param fileSavePath
     * @param bucket
     * @return
     */
    FileInfo uploadFile(MultipartFile file, String fileSavePath, String bucket, String appid, String fileHost) throws IOException;


    /**
     * 上传图片数据流
     * @param base64Data
     * @param fileSavePath
     * @param bucket
     * @param fileHost
     * @param appid
     * @return
     * @throws IOException
     */
    FileInfo upload64(String base64Data, Boolean blur, String fileSavePath, String bucket, String appid, String fileHost) throws IOException;

}
