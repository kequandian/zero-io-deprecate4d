package com.jfeat.pdf.print.report.reports;

import com.jfeat.pdf.print.PdfFlowRequest;
import com.jfeat.pdf.print.base.*;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.report.request.RowFormatRequest;
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
            if (info.getBackgroundColor() != null) {
                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
            }
            // title
            if (info.getText() != null) {
                box.setContent(info.getText());
            }
            if (info.getTextFormat() != null) {
                if (info.getTextFormat().getFont() != null) {
                    box.setFont(FontDefinition.getFont(info.getTextFormat().getFont()));
                }
            }
            return box;

        } else if (rowId.equals(ImageBox.ID)) {
            ImageBox box = new ImageBox();

            ImageBoxData info = (ImageBoxData) data;
//            if(info.getBackgroundColor()!=null) {
//                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
//            }
            // image
            if (info.getImageUrl() != null) {
                box.setImage(ImageUtil.getImage(info.getImageUrl()), super.getRowAlignment());
            }
            return box;

        } else if (rowId.equals(ImageTextBox.ID)) {
            ImageTextBox box = new ImageTextBox();

            ImageTextBoxData info = (ImageTextBoxData) data;
            if (info.getBackgroundColor() != null) {
                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
            }
            // image
            if (info.getImageUrl() != null) {
                box.setImage(ImageUtil.getImage(info.getImageUrl()), super.getRowAlignment());
            }
            // text
            if (info.getTitle() != null) {
                box.setContent(info.getTitle());
            }
            if (info.getTitleFormat() != null) {
                RowFormatRequest request = info.getTitleFormat();
                if (request.getFont() != null) {
                    box.setFont(FontDefinition.getFont(request.getFont()));
                }
                box.setIndent(request.getIndent());
                box.setSpacing(request.getSpacing());
                box.setAlignment(PdfFlowRequest.FlowElement.getAlignment(request.getAlignment()));
                box.setVerticalAlignment(PdfFlowRequest.FlowElement.getAlignment(request.getVerticalAlignment()));
            }

            return box;

        } else if (rowId.equals(RelativeRow.ID)) {

            RelativeRow row = new RelativeRow();

            RelativeRowData info = (RelativeRowData) data;

            if (info.getImageUrl() != null) {
                row.setIcon(ImageUtil.getImage(info.getImageUrl()));
            } else if (info.getNextImageUrl() != null) {
                row.setNext(ImageUtil.getImage(info.getImageUrl()));
            }

            if (info.getNextImageUrl() != null) {
                row.setNext(ImageUtil.getImage(info.getNextImageUrl()));
            } else if (info.getNextImageUrl() != null) {
                row.setNext(ImageUtil.getImage(info.getNextImageUrl()));
            }

            // draw text
            if (info.getTitle() != null) {
                row.title(info.getTitle(),
                        info.getSubtitle(),
                        info.getHint(),
                        FontDefinition.getFont(info.getFontTitle()),
                        FontDefinition.getFont(info.getFontSubtitle()),
                        FontDefinition.getFont(info.getFontHint()));
            }

            if (info.getValue() != null) {
                row.value(info.getValue(), FontDefinition.getFont(info.getFontValue()));
            }

            /// padding
            row.setPadding(info.getPaddingLeft(), info.getPaddingRight(), info.getPaddingTop(), info.getPaddingBottom());

            return row;
        }

        throw new RuntimeException("Row Id not supported : " + rowId);
    }
}
