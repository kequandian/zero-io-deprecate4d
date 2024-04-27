package com.jfeat.common;

import org.springframework.core.io.ClassPathResource;
import org.springframework.util.ResourceUtils;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;

import org.apache.commons.io.IOUtils;

public class ResourceUtil {
    /**
     * 获取资源文件内容
     *
     * @param resourcePath
     * @return
     * @throws IOException
     */
    public static String getDefaultResourceFileContent(String resourcePath) throws IOException {
        String content = null;

        // 优先本地配置文件
        File localFile = new File(resourcePath);
        if (localFile.exists()) {
            // 从本地配置文件获取
            content = new String(Files.readAllBytes(localFile.toPath()));

        } else {
            // 从资源文件获取
            try {
                String resourceClassPath = ResourceUtils.CLASSPATH_URL_PREFIX + resourcePath;

                File file = ResourceUtils.getFile(resourceClassPath);
                content = new String(Files.readAllBytes(file.toPath()));
                return content;

            } catch (FileNotFoundException e) {
            }

            // fix deployed  *-standalone.jar
            try {
                ClassPathResource resource = new ClassPathResource(resourcePath);
                InputStream inputStream = resource.getInputStream();
                content = IOUtils.toString(inputStream, Charset.forName("UTF-8"));
            } catch (IOException e) {

            }
        }

        return content;
    }

    public static InputStream getDefaultResourceFileAsStream(String resourcePath) throws IOException {
        // 优先本地配置文件
        File localFile = new File(resourcePath);
        if (localFile.exists()) {
            // 从本地配置文件获取
            return new FileInputStream(localFile);

        } else {
            // 从资源文件获取
            try {
                String resourceClassPath = ResourceUtils.CLASSPATH_URL_PREFIX + resourcePath;

                File file = ResourceUtils.getFile(resourceClassPath);
                return new FileInputStream(file);

            } catch (FileNotFoundException e) {
            }

            // fix deployed  *-standalone.jar
            ClassPathResource resource = new ClassPathResource(resourcePath);
            return resource.getInputStream();
        }
    }
}
