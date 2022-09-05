package com.jfeat.am.module.ioJson.services.domain.util;

import java.io.*;
import java.util.*;

public class FileUtil {

    public static Map<String, String> readProperties(File file) {
        Map<String, String> map = new HashMap<String, String>();
        InputStream in = null;
        Properties p = new Properties();
        ;
        try {
            in = new BufferedInputStream(new FileInputStream(file));
            p.load(in);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Set<Map.Entry<Object, Object>> entrySet = p.entrySet();
        for (Map.Entry<Object, Object> entry : entrySet) {
            map.put((String) entry.getKey(), (String) entry.getValue());
        }
        return map;
    }


    public static Map<String, String> readProperties(String dir, String filePath) {
        Map<String, String> map = new HashMap<String, String>();
        InputStream in = null;
        Properties p = new Properties();
        ;
        try {
            File file = null;
            file = getFile(dir, filePath);
            in = new BufferedInputStream(new FileInputStream(file));
            p.load(in);
            in.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        Set<Map.Entry<Object, Object>> entrySet = p.entrySet();
        for (Map.Entry<Object, Object> entry : entrySet) {
            map.put((String) entry.getKey(), (String) entry.getValue());
        }
        return map;
    }



/*    public static File getFile(String filePath){
        File file = new File(filePath);
        File fileDir = new File(dir + File.separator + appId);
        if(!file.exists()){
            fileDir.mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;
    }*/

    public static void writeProperties(String proKey, String proValue, File file) {
        //Map<String, String> idMap = getIdMap();
        Map<String, String> idMap = readProperties(file);
        Properties properties = new Properties();
        OutputStream output = null;
        try {
          /*  File file = null;
            file = getFile(dir + File.separator + appId + File.separator + "appSite.properties");*/

            output = new FileOutputStream(file);
            for (String key : idMap.keySet()) {
                String value = idMap.get(key);
                properties.setProperty(key, value);
            }
            properties.setProperty(proKey, proValue);

            // 保存键值对到文件中

            properties.store(output, "modify" + new Date().toString());

        } catch (IOException io) {
            io.printStackTrace();
        } finally {
            if (output != null) {
                try {
                    output.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }


    public static File getFile(String dir, String filePath) {
        File file = new File(filePath);
        File fileDir = new File(dir);
        if (!file.exists()) {
            fileDir.mkdirs();
            try {
                file.createNewFile();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return file;

    }

}
