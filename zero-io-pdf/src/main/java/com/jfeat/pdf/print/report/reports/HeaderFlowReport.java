package com.jfeat.pdf.print.report.reports;

import com.jfeat.pdf.print.base.DataFlowReport;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.base.ListRowBase;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.report.row.ImageBoxData;
import com.jfeat.pdf.print.report.row.ImageTextBoxData;
import com.jfeat.pdf.print.report.row.RelativeRowData;
import com.jfeat.pdf.print.element.ImageTextBox;
import com.jfeat.pdf.print.report.row.TextBoxData;
import com.jfeat.pdf.print.util.ImageUtil;

/**
 * Created by vincent on 2018/3/19.
 * 自动支持所有已定义的行格式，转换DataFlowReport为实体report
 */
public class HeaderFlowReport extends DataFlowReport {

    public HeaderFlowReport(int columns) {
        super(columns);
    }

    @Override
    public ListRow convertRowData(ListRowBase data) {
        String rowId = data.rowId();

        if (rowId.equals(TextBox.ID)) {
            TextBox box = new TextBox();

            TextBoxData info = (TextBoxData) data;
            if (info.getTitle() != null) {
                box.setContent(info.getTitle(), info.getFont());
                box.setBackgroundColor(info.getsolid());
                box.setFont(info.getFont());
            }
            return box;

        }else if(rowId.equals(ImageBox.ID)) {
            ImageBox box = new ImageBox();

            ImageBoxData info = (ImageBoxData) data;
            if (info.getImageUrl() != null) {
                box.setUrl(info.getImageUrl());
            }

            return box;

        }else if(rowId.equals(ImageTextBox.ID)){
            ImageTextBox box = new ImageTextBox();

            ImageTextBoxData info = (ImageTextBoxData) data;
            if (info.getImageUrl() != null) {
                box.setImage(ImageUtil.getImage(info.getImageUrl()));
            }

            return box;

        }else if(rowId.equals(RelativeRow.ID)) {

            RelativeRow row = new RelativeRow();

            RelativeRowData info = (RelativeRowData) data;

            if (info.getIconImage() != null) {
                row.icon(info.getIconImage());
            } else if (info.getIconUrl() != null) {
                row.icon(ImageUtil.getImage(info.getIconUrl()));
            }

            if (info.getNextImage() != null) {
                row.next(info.getNextImage());
            } else if (info.getNextImageUrl() != null) {
                row.next(ImageUtil.getImage(info.getNextImageUrl()));
            }

            // draw text
            if (info.getTitle() != null) {
                row.title(info.getTitle(), info.getSubtitle(), info.getHint(),
                        info.getFontTitle(), info.getFontSubtitle(),info.getFontHint(),
                        info.getTitleIndent(), info.getTitleSpacing(), info.getTitleAlignment());
            }

            if (info.getValue() != null) {
                row.value(info.getValue(), info.getFontValue());
            }

            /// padding
            row.setPadding(info.getPaddingLeft(), info.getPaddingRight(), info.getPaddingTop(), info.getPaddingBottom());

            // spacing
            row.setTitleSpacing(info.getTitleSpacing());
            row.setTitleIndent(info.getTitleIndent());

            return row;
        }

        throw new RuntimeException("Row Id not supported : " + rowId);
    }
}
