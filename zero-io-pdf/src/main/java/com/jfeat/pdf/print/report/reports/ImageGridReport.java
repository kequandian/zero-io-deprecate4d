package com.jfeat.pdf.print.report.reports;

import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.base.ListRowBase;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.report.DataFlowReport;
import com.jfeat.pdf.print.report.row.ImageBoxData;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

/**
 * Created by vincent on 2018/3/19.
 * 自动支持所有已定义的行格式，转换DataFlowReport为实体report
 */
public class ImageGridReport extends DataFlowReport {

    public ImageGridReport(int columns) {
        super(columns);
    }

    @Override
    public ListRow convertRowData(ListRowBase data) {
        String rowId = data.rowId();
        Assert.isTrue(rowId.equals(ImageBox.ID), "rowId cannot be other then: " + rowId);

        ImageBoxData info = (ImageBoxData) data;

        ImageBox box = new ImageBox();
        if (!StringUtils.isEmpty(info.getImageUrl())) {
            box.setUrl(info.getImageUrl());
        }
        return box;
    }
}
