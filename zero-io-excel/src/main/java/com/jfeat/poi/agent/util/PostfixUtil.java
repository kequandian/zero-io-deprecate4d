package com.jfeat.poi.agent.util;

import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.poi.agent.im.request.Option;
import com.jfeat.poi.agent.im.request.PostfixInfo;
import com.jfeat.poi.agent.im.request.PostfixType;
import com.jfeat.poi.agent.im.request.TableTarget;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;


public class PostfixUtil {
    protected final static Logger logger = LoggerFactory.getLogger(PostfixUtil.class);

    /**
     * 合并重复的项
     * @param contents
     * @param fields
     * @param unique
     * @return
     */
    public static List<List<String>> postfixDuplicateContentRows(List<List<String>> contents, List<String> fields, List<String> unique, Option option) {
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
            fixRow(map,keys,content,contentIndex,option);


        }

        List<List<String>> temps = new ArrayList<>();
        temps.addAll(map.values());

        contents = temps;
        return contents;

    }




    private static void fixRow(Map<List<String>,List<String>> map, List<String> keys,List<String> content,List<Integer> contentIndex, Option option){
        if(!map.containsKey(keys)) {
            map.put(keys, content);
        }else{
            //拼接防止重复字段 例如 ： ‘-1’
            postfix(keys,content,contentIndex,option);
            //递归然后添加内容到map
            fixRow(map,keys,content,contentIndex,option);
        }
    }

   public static void postfix(List<String> keys,List<String> content,List<Integer> contentIndex, Option option){
        String postfix = option.getPostfix();
        if(StringUtils.isEmpty(postfix)){
            postfix = TableTarget.DEFAULT_POST_FIX;
        }
        //修改第一个即可
        String firstKey = keys.get(0);
        String contentValue = content.get(contentIndex.get(0));

       PostfixInfo postfixInfo = getPostfixInfo(postfix);
       Integer number = 0;
       //如果是数字
       if(postfixInfo.getPostfixType().getTypeName().equals(PostfixType.Number.getTypeName())){
           //设置初始化
            number = Integer.parseInt(postfixInfo.getIncrement());

        //检查之前是否已进行重写操作
           Pattern compile = Pattern.compile(postfixInfo.getCompleteRegex());
           Matcher matcher = compile.matcher(firstKey);
         if(matcher.find()){
             String firstKeyPostfix = matcher.group();
             Pattern incrementRegex = Pattern.compile(postfixInfo.getPostfixType().getIncrementRegex());
             Matcher incrementMatcher = incrementRegex.matcher(firstKeyPostfix);
             if(incrementMatcher.find()){
                 String numberString = incrementMatcher.group();
                 number = Integer.parseInt(numberString);
             }
            number ++;
            String replaceString =postfixInfo.getBeforeString() + number + postfixInfo.getAfterString();
             String replaceKey = firstKey.replaceAll(postfixInfo.getCompleteRegex(), replaceString);
             firstKey = replaceKey;
        }else{
            firstKey = firstKey +postfixInfo.getBeforeString() + number + postfixInfo.getAfterString();
        }
             //将空的设置为null 而不是""
            if(StringUtils.isEmpty(contentValue)){
                contentValue = null;
            }
            else {
                contentValue = firstKey;
                /*String[] contentValueList = contentValue.split(postfix);
                contentValue = contentValueList[0]+postfix+number;*/
            }
       }

       keys.set(0,firstKey);
       content.set(contentIndex.get(0),contentValue);
    }


    //获取后缀类型及初始自增值
    public static PostfixInfo getPostfixInfo(String postfix){
        PostfixInfo postfixInfo = new PostfixInfo();
        Integer count = 0;
        for(PostfixType postfixType:PostfixType.values()){
            //循环确定类型

            String type = checkPostfixType(postfix, postfixType);
            if(!StringUtils.isEmpty(type)){
                String incrementBody = getIncrementBody(postfix, postfixType);

                postfixInfo.setPostfixType(postfixType);
                postfixInfo.setIncrement(getPostfixIncrement(postfix,postfixType));
                postfixInfo.setReplace(incrementBody);
                setCompleteRegex(postfix,postfixInfo);
                count ++ ;
                break;
            }
        }

        if(count == 0){
                throw new BusinessException(BusinessCode.NotSupport.getCode(),"获取数据类型失败");
        }
        return postfixInfo;
    }


    //判断类型   num
    public static String checkPostfixType(String postfix,PostfixType type){

        Pattern pattern = Pattern.compile(type.getRegex());
        Matcher matcher = pattern.matcher(postfix);
        if(matcher.find())
        {return type.getTypeName();}
        else return null;
    }

    //获取初始增量   1
    public static String getPostfixIncrement(String postfix,PostfixType type){
        String postfixBody = getIncrementBody(postfix, type);
        Pattern incrementPattern = Pattern.compile(type.getIncrementRegex());
        Matcher incrementMatcher = incrementPattern.matcher(postfixBody);
        String increment = null;
        if(incrementMatcher.find()){
            increment  = incrementMatcher.group();
        }
        if(StringUtils.isEmpty(increment)){
            throw new BusinessException(BusinessCode.NotSupport.getCode(),"至少需要一个自增变量起始值 例如 数字类型的：{1...}");
        }
        return increment;
    }

    //获得截取后的内容
    public static String getIncrementBody(String postfix, PostfixType type){
        Pattern pattern = Pattern.compile(type.getRegex());
        Matcher matcher = pattern.matcher(postfix);
        String group = null;
        if(matcher.find()){
            group = matcher.group();
        }
        return group;
    }


    //设置正则 用于已设置后缀的
    public static void setCompleteRegex(String postfix,PostfixInfo postfixInfo){
        String replace = postfixInfo.getReplace();
        String incrementRegex = postfixInfo.getPostfixType().getIncrementRegex();

        StringBuilder stringBuilder = new StringBuilder(postfix);
        int replaceIndex = stringBuilder.indexOf(replace);
        int replaceEndIndex = replaceIndex+replace.length();
        String beforeString = null;
        String afterString = null;
        if(replaceIndex!=0){
            beforeString = stringBuilder.substring(0, replaceIndex);
        }
        if (replaceEndIndex!=stringBuilder.length()){
            afterString = stringBuilder.substring(replaceEndIndex, stringBuilder.length());
        }
        postfixInfo.setBeforeString(beforeString);
        postfixInfo.setAfterString(afterString);
        postfixInfo.setCompleteRegex(beforeString+incrementRegex+afterString);


    }

}
