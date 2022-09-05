package com.jfeat.pdf.print.util;

import java.io.*;

/**
 * Created by craftperson on 2018/2/27.
 */
public class FileBinaryUtil {

    /**
     * 获取文件字节流
     *
     * @param filePath
     * @return
     **/
    public static byte[] getBytes(String filePath) {
        byte[] buffer = null;
        try (FileInputStream fis = new FileInputStream(filePath);
             ByteArrayOutputStream bos = new ByteArrayOutputStream(1000)) {

            byte[] b = new byte[1000];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }
}