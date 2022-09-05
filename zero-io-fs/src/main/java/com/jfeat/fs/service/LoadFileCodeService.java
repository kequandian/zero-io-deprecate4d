package com.jfeat.fs.service;

/**
 * Created by jackyhuang on 2018/1/3.
 */
public interface LoadFileCodeService {
    public String genAndGetCode(String name);

    public boolean checkCode(String code);
}
