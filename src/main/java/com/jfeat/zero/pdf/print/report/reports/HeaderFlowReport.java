package com.jfeat.zero.pdf.print.report.reports;

import com.itextpdf.text.BadElementException;
import com.jfeat.zero.pdf.print.element.TextBox;
import com.jfeat.zero.pdf.print.report.DataFlowReport;
import com.jfeat.zero.pdf.print.base.ListRow;
import com.jfeat.zero.pdf.print.base.ListRowBase;
import com.jfeat.zero.pdf.print.report.row.FlowListRow;
import com.jfeat.zero.pdf.print.report.row.FlowListRowData;
import com.jfeat.zero.pdf.print.report.row.StackFlowListRow;
import com.jfeat.zero.pdf.print.report.row.TextBoxData;

import java.io.IOException;

/**
 * Created by vincent on 2018/3/19.
 */
public class HeaderFlowReport extends DataFlowReport {

    public HeaderFlowReport(int columns) {
        super(columns);
    }

    @Override
    public ListRow convertRowData(ListRowBase data) {
        try {

            String rowId = data.rowId();

            if(rowId.equals(TextBox.ID)){
                TextBox box = new TextBox();

                TextBoxData info = (TextBoxData) data;
                if (info.getContent() != null) {
                    box.setContent(info.getContent(), info.getFont());
                    box.setBackgroundColor(info.getsolid());
                    box.setFont(info.getFont());
                }

                return box;

            }else if(rowId.equals(FlowListRow.ID) || rowId.equals(StackFlowListRow.ID)) {

                FlowListRow row = null;
                if(rowId.equals(FlowListRow.ID)){
                    row = new FlowListRow();
                }else if(rowId.equals(StackFlowListRow.ID)){
                    row = new StackFlowListRow();
                }


                FlowListRowData info = (FlowListRowData) data;

                if (info.getIconImage() != null) {
                    row.icon(info.getIconImage());
                } else if (info.getIconUrl() != null) {

                    row.icon(getRowImage(info.getIconUrl()));
                }

                if (info.getNextImage() != null) {
                    row.next(info.getNextImage());
                } else if (info.getNextUrl() != null) {
                    row.next(getRowImage(info.getNextUrl()));
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

            }else{
                throw new RuntimeException("Row Id not supported : " + rowId);

            }

        } catch (IOException e) {
            throw new RuntimeException(e);
        } catch (BadElementException e) {
            throw new RuntimeException(e);
        }
    }

}
