package com.jfeat.pdf.print.element;

import com.itextpdf.awt.AsianFontMapper;
import com.itextpdf.awt.FontMapper;
import com.itextpdf.awt.PdfGraphics2D;
import com.itextpdf.text.*;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPTable;
import com.jfeat.pdf.print.base.ListRow;
import com.jfeat.pdf.print.util.PdfFontMetrics;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by vincent on 2018/3/16.
 * 文本框: 纯色框内居中显示字符
 */
public class TextBox extends Rectangle implements ListRow {
    public static String ID = "TextBox";

    private String content;
    private Font font;
    private int alignment = Element.ALIGN_CENTER;

    private AccessibleElementId cellId;

    public TextBox(){
        super(0,0,0,0);
    }

    public TextBox(int alignment){
        super(0,0,0,0);
        this.alignment = alignment;
    }

    public TextBox(String content, Font font){
        super(0,0,0,0);
        this.content = content;
        this.font = font;
    }

    public TextBox(String content, Font font, int alignment){
        super(0,0,0,0);
        this.content = content;
        this.font = font;
        this.alignment = alignment;
    }

    public TextBox(Rectangle position, String content, Font font){
        super(position);
        this.content = content;
        this.font = font;;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setContent(String content, Font font){
        this.content = content;
        this.font = font;
    }

    public void draw(PdfContentByte canvas, Rectangle position){
        PdfContentByte[] canvases = new PdfContentByte[]{canvas, canvas, canvas, canvas};
        drawCell(canvases, position);
    }

    public void drawCell(PdfContentByte[] canvases, Rectangle position){
        if(content==null || content.length()==0){
            return;
        }

        super.setLeft(position.getLeft());
        super.setTop(position.getTop());
        super.setRight(position.getRight());
        super.setBottom(position.getBottom());

        // draw background
        PdfContentByte bgcanvas = canvases[PdfPTable.BACKGROUNDCANVAS];
        bgcanvas.saveState();
        Rectangle solid = new Rectangle(this);
        float borderWidth = solid.getBorderWidth();
        if(borderWidth>0) {
            solid.setLeft(solid.getLeft() + borderWidth);
            solid.setRight(solid.getRight() - borderWidth);
            solid.setTop(solid.getTop() - borderWidth);
            solid.setBottom(solid.getBottom() + borderWidth);
        }
        bgcanvas.rectangle(solid);
        bgcanvas.restoreState();


        /// draw text
        PdfContentByte canvas = canvases[PdfPTable.TEXTCANVAS];

        // draw text via PdfGraphics2D
        int stringHeight = 0;
        int stringWidth = 0;
        PdfFontMetrics metrics = new PdfFontMetrics(canvas, font);
        {
            //stringWidth = metrics.getStringWidth(content);
            stringHeight = metrics.getStringHeight();
            stringWidth = metrics.getStringWidth(content);

            //java.awt.Font font = new java.awt.Font(textFont.getFamilyname(), textFont.getStyle(), (int) textFont.getSize());
            //PdfGraphics2D graphics2D = createGraphics2D(canvas);
            //graphics2D.setFont(font);
            //FontMetrics fm = graphics2D.getFontMetrics(font);
            //stringWidth = fm.stringWidth(content);
            //stringHeight = fm.getDescent()-fm.getAscent();

            ////float cx = (position.getLeft()+position.getRight())*0.5f;
            ////float cy = (position.getTop()+position.getBottom())*0.5f;
            ////graphics2D.drawString(content, cx, cy);
        }

        ///draw text
        canvas.saveState();
        float tx = alignment == Element.ALIGN_LEFT ? getLeft() : (getLeft()+getRight())*0.5f;  // else ALIGN_CENTER

        int contentLen = (int)(stringWidth / getWidth()) + (stringWidth%getWidth()>0?1:0);
        final int stringYOffset = 4;

        // get text array
        String[] lines = alignUpPosition(metrics, content, this);
        //String[] lines = new String[] {content.substring(0,5), content.substring(6,content.length())};

        for(int i=0; i<contentLen; i++) {
            String text = lines[i];

            float cellHeight = getHeight();
            int textTotalHeight = stringHeight * contentLen + stringYOffset * (contentLen-1);
            float offset = (getHeight() - textTotalHeight)*0.5f;

            float ty = getTop() - offset - stringHeight*0.5f - ( stringHeight*i + stringYOffset*i );
            ty -= stringHeight * 0.5f;  // offset string vertical center

            //float ty_old = (getTop() + getBottom()) * 0.5f - stringHeight * 0.5f;

            ColumnText.showTextAligned(canvas, alignment, new Phrase(text, font), tx, ty, 0);
        }

        canvas.restoreState();
    }

    protected final static Logger logger = LoggerFactory.getLogger(TextBox.class);

    /**
     * 单行在限定框内转换为多行
     * @param content
     * @param position  矩形位置
     * @return
     */
    public static String[] alignUpPosition(PdfFontMetrics metrics, String content, Rectangle position){

        if(content.contains("亮")){
            "".toUpperCase();
        }

        float totalWidth = position.getWidth();
        List<String> lines = new ArrayList<>();
        int len = content.length();

        int i = 0, j = 0, currWidth = 0;
        while (i < len) {
            int charWidth = metrics.getStringWidth(String.valueOf(content.charAt(i))) ;
            if (charWidth > totalWidth) {
                throw new RuntimeException("字符宽度不能大于限定框宽度");
            }
            currWidth += charWidth;
            logger.info("curWidth total --> {}, {}", currWidth, totalWidth);
            if (currWidth > totalWidth) {
                lines.add(content.substring(j, i));
                j = i;
                currWidth = 0;
                continue;
            }
            i++;
        }
        // 最后一行
        lines.add(content.substring(j));

        return lines.toArray(String[]::new);
    }


    /**
     * implement in FontSizeMetrics
     * @param canvas
     * @return
     */
    @Deprecated
    private PdfGraphics2D createGraphics2D(PdfContentByte canvas) {

        Document document = canvas.getPdfDocument();
        Rectangle pageSize = document.getPageSize(); //获取pdf文档的大小

        //添加关于中文的支持
        FontMapper fm = new AsianFontMapper(AsianFontMapper.ChineseSimplifiedFont, AsianFontMapper.ChineseSimplifiedEncoding_H);
        PdfGraphics2D graphics2D = new PdfGraphics2D(canvas, pageSize.getWidth(), pageSize.getHeight(), fm);

        return graphics2D;
    }

    @Override
    public void setCellId(AccessibleElementId cellId) {
        this.cellId = cellId;
    }

    @Override
    public AccessibleElementId getCellId(){
        return cellId;
    }

    public String rowId() {
        return ID;
    }

    public Font getFont() {
        return font;
    }

    public void setFont(Font textFont) {
        this.font = textFont;
    }

    public String getContent() {
        return content;
    }
}
