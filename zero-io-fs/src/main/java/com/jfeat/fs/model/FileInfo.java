package com.jfeat.fs.model;


import com.jfeat.crud.base.util.StrKit;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.io.File;

/**
 * Created by jackyhuang on 2017/7/4.
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class FileInfo {
    private String name;
    private String bucket;
    private String host;
    private String url;
    private String blurryName;
    private String blurryUrl;
    private String originalFileName;
    private String extensionName;
    private Long size;
    private String path;

    public static FileInfo create(String host, String name) {
        return new FileInfo(host, name);
    }

    public static FileInfo create(String host, String name, String blurryName) {
        return new FileInfo(host, name, blurryName);
    }

    public static FileInfo create(String host, String name, String extensionName, String originalFileName, Long size, String path) {
        return new FileInfo(host, null, name, extensionName, originalFileName, size, path);
    }

    public static FileInfo create(String host, String bucket, String name, String extensionName, String originalFileName, Long size, String path) {
        return new FileInfo(host, bucket, name, extensionName, originalFileName, size, path);
    }

    /**
     * Construction
     */

    public FileInfo(String host, String name) {
        this(host, null, name, null, null, 0L, null);
    }

    public FileInfo(String host, String name, String blurryName) {
        this(host, name);
        this.blurryName = blurryName;
        this.blurryUrl = host + "/" + blurryName;
        if (StrKit.notBlank(host) && host.endsWith("/")) {
            this.blurryUrl = host + blurryName;
        }
    }

    public FileInfo(String host, String name, String extensionName, String originalFileName, Long size, String path) {
        this(host, null, name, extensionName, originalFileName, size, path);
    }

    public FileInfo(String host, String bucket, String name, String extensionName, String originalFileName, Long size, String path) {
        if(name.startsWith(File.separator)){
            name = name.substring(1);
        }
        this.name = name;
        this.host = host;
        this.originalFileName = originalFileName;
        this.extensionName = extensionName;
        this.size = size;
        if (bucket==null || bucket.equals("")){
            this.url = String.join(File.separator, host, name);
        }else {
            this.url = String.join(File.separator, host, bucket, name);
        }

        this.path = path;
    }




    /**
     * Deprecated
     */
    @Deprecated
    public static FileInfo create(String host, String name, String extensionName, String originalFileName, Long size) {
        return new FileInfo(host, name, extensionName, originalFileName, size);
    }

    @Deprecated
    public FileInfo(String host, String name, String extensionName, String originalFileName, Long size) {
        this(host, null, name, extensionName, originalFileName, size, null);
    }

}
