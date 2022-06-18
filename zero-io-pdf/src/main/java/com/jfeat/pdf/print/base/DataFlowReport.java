package com.jfeat.pdf.print.base;

import com.jfeat.pdf.print.element.EmptyListRow;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincent on 2018/3/19.
 * 转换数据为实体类，用于画实体
 */
public abstract class DataFlowReport extends FlowReport {

    public DataFlowReport(int columns) {
        super(columns);
        this.flowDirection = FlowReport.FLOW_LTR;
    }


    /**
     * 转换数据至 ListRow 实体
     * @param data
     * @return
     */
    public abstract ListRow convertRowData(ListRowBase data);


    public void setHeaderData(ListRowBase headerInfo) {
        ListRow headRow = convertRowData(headerInfo);
        super.setHeader(headRow);
    }

    public void setRowData(List<? extends ListRowBase> rowDataList) {
        List<ListRow> listRows = new ArrayList<>();

        if(rowDataList==null || rowDataList.size()==0){
            super.setRows(listRows);
            return;
        }
        if(flowDirection == FlowReport.FLOW_LTR) {

            for (ListRowBase item : rowDataList) {
                ListRow r = convertRowData(item);
                listRows.add(r);
            }

            /// fill empty line
            if(rowDataList.size()%columns>0){
                int empties = columns - rowDataList.size()%columns;
                for(int i=0; i<empties; i++) {
                    listRows.add(EmptyListRow.EMPTY);
                }
            }

        }else if(flowDirection == FlowReport.FLOW_UTD){

            if(maxRowsPerColumn <=0 ){
                throw new RuntimeException("flow height is not set for UTD flow on rows arrangement");
            }

            if(rowHeight < 0.000001){
                throw new RuntimeException("row height must be set before setRowData for UTD flow");
            }

            List<ListRow> list = new ArrayList<>();
            for (ListRowBase item : rowDataList) {
                ListRow r = convertRowData(item);
                list.add(r);
            }

            int cells = maxRowsPerColumn * columns;

            for (int n = 0; n < cells; n++) {
                int currentRow = n / columns;
                int currentCol = n % columns;

                int index = maxRowsPerColumn * currentCol + currentRow;

                /// check within range
                if(index<list.size()) {
                    listRows.add(list.get(index));

                }else{

                    // empty list row, place holder
                    listRows.add(EmptyListRow.EMPTY);
                }
            }
        }

        super.setRows(listRows);
    }
}
