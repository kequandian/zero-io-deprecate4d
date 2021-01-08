package com.jfeat.poi.agent.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import static com.jfeat.poi.agent.im.request.TableTarget.POST_FIX_SEPARATE;

public class PostfixUtil {
    protected final static Logger logger = LoggerFactory.getLogger(PostfixUtil.class);

    /**
     * 合并重复的项
     * @param contents
     * @param fields
     * @param unique
     * @return
     */
    public static List<List<String>> postfixDuplicateContentRows(List<List<String>> contents, List<String> fields, List<String> unique) {
        if(unique==null || unique.size()==0){ return contents; }

        List<Integer> contentIndex = new ArrayList<>();

        for(String uniq:unique){
            if(fields.contains(uniq))
                contentIndex.add(fields.indexOf(uniq));
        }

        Map<List<String>,List<String>> map = new HashMap<>();
        for(List<String> content:contents){
            List<String> keys = new ArrayList<>();
            for(Integer index:contentIndex){
                keys.add(content.get(index));
            }
            fixRow(map,keys,content,contentIndex);


        }

        List<List<String>> temps = new ArrayList<>();
        temps.addAll(map.values());

        contents = temps;
        return contents;

    }




    private static void fixRow(Map<List<String>,List<String>> map, List<String> keys,List<String> content,List<Integer> contentIndex){
        if(!map.containsKey(keys)) {
            map.put(keys, content);
        }else{
            //拼接防止重复字段 例如 ： ‘-1’
            postfix(keys,content,contentIndex);
            //递归然后添加内容到map
            fixRow(map,keys,content,contentIndex);
        }
    }

   public static void postfix(List<String> keys,List<String> content,List<Integer> contentIndex){
        //修改第一个即可
        String firstKey = keys.get(0);
        String contentValue = content.get(contentIndex.get(0));
        Integer number = 1;
        //检查之前是否已进行重写操作
        if(firstKey.indexOf(POST_FIX_SEPARATE)>0){
            String[] firstKeyList = firstKey.split(POST_FIX_SEPARATE);
            number = Integer.parseInt(firstKeyList[1]);
            number ++;
            firstKey = firstKeyList[0]+POST_FIX_SEPARATE+number;
        }else{
            firstKey = firstKey +POST_FIX_SEPARATE+number;
        }
       contentValue = contentValue+POST_FIX_SEPARATE+number;
       keys.set(0,firstKey);
       content.set(contentIndex.get(0),contentValue);
    }

}
