package com.jfeat.am.module.kafkaEmail.util;

import java.util.Map;

public class TemplateUtil {

    public static String getContent(String template, Map<String,String> param){
        if (param==null){
            return null;
        }
        for (String key:param.keySet()){
            template = template.replaceAll("\\{".concat(key).concat("\\}"),param.get(key));
        }
        return template;
    }

}
