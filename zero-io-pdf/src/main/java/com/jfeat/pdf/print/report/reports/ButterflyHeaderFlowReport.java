package com.jfeat.pdf.print.report.reports;

/**
 * Created by vincent on 2018/3/19.
 * 左右两列排列报表，先占满左边报表列（需固定列数），然后是右边
 */
public class ButterflyHeaderFlowReport extends HeaderFlowReport {

    public ButterflyHeaderFlowReport() {
        super(2);
        super.flowDirection = FLOW_UTD;
    }
}
