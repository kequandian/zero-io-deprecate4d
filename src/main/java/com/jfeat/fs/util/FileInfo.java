package com.jfeat.fs.util;


import com.jfeat.crud.base.util.StrKit;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * Created by jackyhuang on 2017/7/4.
 */
@Data
@NoArgsConstructor
@Accessors(chain = true)
public class FileInfo {
    private String name;
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

    public static FileInfo create(String host, String name, String extensionName, String originalFileName, Long size) {
        return new FileInfo(host, name, extensionName, originalFileName, size);
    }

    public static FileInfo create(String host, String name, String extensionName, String originalFileName, Long size, String path) {
        return new FileInfo(host, name, extensionName, originalFileName, size, path);
    }


    public FileInfo(String host, String name) {
        this.name = name;
        this.host = host;
        this.url = host + "/" + name;
        if (StrKit.notBlank(host) && host.endsWith("/")) {
            this.url = host + name;
        }
    }

    public FileInfo(String host, String name, String extensionName, String originalFileName, Long size) {
        this.name = name;
        this.host = host;
        this.originalFileName = originalFileName;
        this.extensionName = extensionName;
        this.size = size;
        this.url = host + "/" + name;
        if (StrKit.notBlank(host) && host.endsWith("/")) {
            this.url = host + name;
        }
    }

    public FileInfo(String host, String name, String extensionName, String originalFileName, Long size, String path) {
        this.name = name;
        this.host = host;
        this.originalFileName = originalFileName;
        this.extensionName = extensionName;
        this.size = size;
        this.url = host + "/" + name;
        this.path = path;
        if (StrKit.notBlank(host) && host.endsWith("/")) {
            this.url = host + name;
        }
    }

    public FileInfo(String host, String name, String blurryName) {
        this(host, name);
        this.blurryName = blurryName;
        this.blurryUrl = host + "/" + blurryName;
        if (StrKit.notBlank(host) && host.endsWith("/")) {
            this.blurryUrl = host + blurryName;
        }
    }
}
