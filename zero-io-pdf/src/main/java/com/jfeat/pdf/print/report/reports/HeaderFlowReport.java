package com.jfeat.pdf.print.report.reports;

import com.jfeat.pdf.print.base.*;
import com.jfeat.pdf.print.element.ImageBox;
import com.jfeat.pdf.print.element.TextBox;
import com.jfeat.pdf.print.element.RelativeRow;
import com.jfeat.pdf.print.report.request.RowFormatRequest;
import com.jfeat.pdf.print.report.row.ImageTextBoxData;
import com.jfeat.pdf.print.report.row.RelativeRowData;
import com.jfeat.pdf.print.element.ImageTextBox;
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

            ImageTextBoxData info = (ImageTextBoxData) data;
            if(info.getBackgroundColor()!=null) {
                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
            }
            // title
            if (info.getTitle() != null) {
                box.setContent(info.getTitle());
            }
            if(info.getTitleFormat()!=null){
                if(info.getTitleFormat().getTitleFont()!=null) {
                    box.setFont(FontDefinition.getFont(info.getTitleFormat().getTitleFont()));
                }
            }
            return box;

        }else if(rowId.equals(ImageBox.ID)) {
            ImageBox box = new ImageBox();

            ImageTextBoxData info = (ImageTextBoxData) data;
            if(info.getBackgroundColor()!=null) {
                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
            }
            // image
            if (info.getImageUrl() != null) {
                box.setImage(ImageUtil.getImage(info.getImageUrl()));
            }
            return box;

        }else if(rowId.equals(ImageTextBox.ID)){
            ImageTextBox box = new ImageTextBox();

            ImageTextBoxData info = (ImageTextBoxData) data;
            if(info.getBackgroundColor()!=null) {
                box.setBackgroundColor(ColorDefinition.getBaseColor(info.getBackgroundColor()));
            }
            // image
            if (info.getImageUrl() != null) {
                box.setImage(ImageUtil.getImage(info.getImageUrl()));
            }
            // text
            if (info.getTitle() != null) {
                box.setContent(info.getTitle());
            }
            if(info.getTitleFormat()!=null){
                RowFormatRequest request = info.getTitleFormat();
                if(request.getTitleFont()!=null) {
                    box.setFont(FontDefinition.getFont(request.getTitleFont()));
                }
                box.setIndent(request.getTitleIndent());
                box.setSpacing(request.getTitleSpacing());
                box.setAlignment(request.getTitleAlignment());
                box.setVerticalAlignment(request.getTitleVerticalAlignment());
            }

            return box;

        }else if(rowId.equals(RelativeRow.ID)) {

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
                row.title(info.getTitle(), info.getSubtitle(), info.getHint(),
                        FontDefinition.getFont(info.getFontTitle()), FontDefinition.getFont(info.getFontSubtitle()), FontDefinition.getFont(info.getFontHint()),
                        info.getTitleIndent(), info.getTitleSpacing(), info.getTitleAlignment());
            }

            if (info.getValue() != null) {
                row.value(info.getValue(), FontDefinition.getFont(info.getFontValue()));
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
