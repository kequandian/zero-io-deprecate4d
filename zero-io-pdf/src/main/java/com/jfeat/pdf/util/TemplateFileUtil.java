package com.jfeat.pdf.util;

import cn.hutool.core.io.IoUtil;
import com.alibaba.fastjson.JSONObject;
import lombok.experimental.UtilityClass;
import org.mockito.internal.util.io.IOUtil;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.util.List;

/**
 * Created on 2021/2/3 4:01 下午.
 *
 * @author Wen Hao
 */
@UtilityClass
public class TemplateFileUtil {

    public JSONObject readTemplateByName(String templateDir, String fileName) throws FileNotFoundException {
        String templateJsonPath = String.format("%s/%s.json", templateDir, fileName);
        FileReader fileReader = new FileReader(new File(templateJsonPath));
        String readJson = IoUtil.read(fileReader);
        IOUtil.close(fileReader);
        return JSONObject.parseObject(readJson);
    }

    public List<String> getAllTemplateFiles() {
        return null;
    }

    public static void main(String[] args) {
        try {
            JSONObject jsonObject = readTemplateByName("pdf-templates", "test1_api");
            System.out.println(jsonObject);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
            System.out.println("catch");
        }

    }
}
