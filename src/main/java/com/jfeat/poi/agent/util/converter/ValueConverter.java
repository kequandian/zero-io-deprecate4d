package com.jfeat.poi.agent.util.converter;

import com.jfeat.poi.agent.im.request.TableTarget;
import com.jfeat.poi.agent.util.TableConvert;

import java.util.List;

/**
 * Created by jackyhuang on 2018/1/27.
 */
public interface ValueConverter {
    Object convert(List<TableConvert> tableConverts, List<TableTarget> target, List<List<String>> contents);

    Object convert(Object object);
}
