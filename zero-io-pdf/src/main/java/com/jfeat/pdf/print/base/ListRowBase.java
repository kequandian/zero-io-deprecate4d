package com.jfeat.pdf.print.base;

/**
 * Created by vincent on 2018/3/19.
 * 列表行数据接口，rowId()用于指定运行时行的类型ID
 */
public interface ListRowBase {

    /**
     * 运行时获取 cellId, 用于记录打印位置
     *
     * @return
     */
    String rowId();
}
