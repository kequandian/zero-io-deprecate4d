package com.jfeat.fs.service;

import com.jfeat.fs.util.FileInfo;
import org.springframework.web.multipart.MultipartFile;

/**
 * Created by jackyhuang on 2018/1/3.
 */
public interface LoadFileCodeService {
    public String genAndGetCode(String name);

    public boolean checkCode(String code);

    FileInfo uploadFile(MultipartFile file, String fileHost,String fileSavePath, String bucket);
}
