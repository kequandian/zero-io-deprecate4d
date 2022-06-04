package com.jfeat.pdf.print.report.row;


import com.itextpdf.text.Image;

/**
 * Created by vincenthuang on 19/03/2018.
 *  上下布局图文框 [上方图片，下方标题] 数据
 */
public class StackFlowListRowData extends FlowListRowData {

    private String url;
    private String title;

    private Image urlImage;

    @Override
    public String rowId() {
        return StackFlowListRow.ID;
    }

}
