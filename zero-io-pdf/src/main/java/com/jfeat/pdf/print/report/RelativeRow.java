package com.jfeat.pdf.print.report;

import com.itextpdf.awt.geom.Point;
import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.*;
import com.jfeat.pdf.print.util.Fonts;
import com.jfeat.pdf.print.util.PdfFontMetrics;

/**
 * Created by vincent on 2018/3/16.
 * 相对布局， 类似于 Android 的 RelativeLayout
 */
public abstract class RelativeRow extends Rectangle {

    private static final Logger logger = LoggerFactory.getLogger(RelativeRow.class);

    protected float paddingTop;
    protected float paddingLeft;
    protected float paddingRight;
    protected float paddingBottom;

    public RelativeRow(Rectangle position) {
        super(position);
    }

    public void setPadding(float padding) {
        this.setPadding(padding, padding, padding, padding);
    }

    public void setPadding(float paddingLeft, float paddingRight, float paddingTop, float paddingBottom) {
        this.paddingLeft = paddingLeft;
        this.paddingRight = paddingRight;
        this.paddingTop = paddingTop;
        this.paddingBottom = paddingBottom;
    }

    protected void drawLines(PdfContentByte canvas, Rectangle position, Phrase[] lines, int alignment, float indent, float lineSpacing) {
        PdfPTable table = new PdfPTable(1);

        float totalHeight = 0;
        for(Phrase p : lines) {
            /*java.util.List<Chunk> chunks = p.getChunks();
            if(chunks!=null){
            }*/
            if(p==null){
                logger.error("drawLines(): phrase is null");
            }

            if(p.getContent().length()>0) {

                Float fontSize = p.getFont().getSize();
                Float capHeight = fontSize;

                // if has base font
                BaseFont baseFont = p.getFont().getBaseFont();
                if (baseFont != null) {
                    capHeight = baseFont.getFontDescriptor(BaseFont.CAPHEIGHT, fontSize);
                }

                PdfPCell cell = new PdfPCell(p);
                cell.setBorderWidth(0);
                cell.setBorder(Rectangle.NO_BORDER);

                cell.setUseAscender(true);
                cell.setVerticalAlignment(Element.ALIGN_BASELINE);
                float paddingTop = capHeight - fontSize;
                cell.setPaddingTop(paddingTop);
                cell.setPaddingBottom(lineSpacing);

                cell.setPaddingLeft(indent);

                table.addCell(cell);

                totalHeight += PdfFontMetrics.getFontHeight(baseFont, fontSize);

            }else{

                logger.warn("no content for phrase " + p.toString());
            }
        }

        /// draw table
        try{

            float ux = 0, uy = 0;

            if(alignment==Element.ALIGN_BASELINE) {
                Point pos = getDockPosition(position, Element.ALIGN_BASELINE);
                ux = (float) pos.getX();
                uy = (float) pos.getY();

            }else if(alignment==Element.ALIGN_LEFT){
                Point pos = getDockPosition(position, Element.ALIGN_LEFT);
                ux = (float) pos.getX();
                uy = (float) pos.getY();

                float offset = totalHeight * 0.5f;
                uy += offset;
             }else{
                throw new RuntimeException("Not support for Alignment: "+ alignment);
            }

            table.setTotalWidth(getInternalWidth(position));
            table.writeSelectedRows(0, -1, ux, uy, canvas);

            /// debug
            //float th = table.getTotalHeight();
            //float h1 = table.getRowHeight(0);
            //float h2 = table.getRowHeight(1);

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    protected void drawText(PdfContentByte canvas, Rectangle position, String text, Font font, int alignment) {
        if(text!=null) {
            this.drawText(canvas, position,
                    font == null ? new Phrase(text) : new Phrase(text, font),
                    alignment);
        }
    }

    protected void drawText(PdfContentByte canvas, Rectangle position, Phrase text, int alignment) {

        if(text!=null) {

            Point pos = getDockPosition(position, alignment);
            float ux = (float) pos.getX();
            float uy = (float) pos.getY();

            //todo, RelativeRow::drawText: PdfFontMetrics
            if(true){
                PdfFontMetrics metrics = new PdfFontMetrics(canvas, text.getFont());
                float height = metrics.getStringHeight();

                uy += height * 0.5;

            }else {
                // fix text height
                float height = text.getFont().getSize();
                if (height == 10.0f) {
                    uy -= (Fonts.FONT_SIZE_10 * 0.5);
                } else if (height == 12.0f) {
                    uy -= (Fonts.FONT_SIZE_12 * 0.5);
                } else if (height == 14.0f) {
                    uy -= (Fonts.FONT_SIZE_14 * 0.5);
                } else if (height == 16.0f) {
                    uy -= (Fonts.FONT_SIZE_16 * 0.5);
                } else if (height == 18.0f) {
                    uy -= (Fonts.FONT_SIZE_18 * 0.5);
                } else if (height == 20.0f) {
                    uy -= (Fonts.FONT_SIZE_20 * 0.5);
                } else if (height == 21.0f) {
                    uy -= (Fonts.FONT_SIZE_21 * 0.5);
                } else if (height == 22.0f) {
                    uy -= (Fonts.FONT_SIZE_22 * 0.5);
                } else if (height == 24.0f) {
                    uy -= (Fonts.FONT_SIZE_24 * 0.5);
                }
            }

            ColumnText.showTextAligned(canvas, alignment,
                    text, ux, uy, 0);
        }
    }

    protected void drawIcon(PdfContentByte canvas, Rectangle position, Image icon) {
        if (icon != null) {
            try {
                int alignment = icon.getAlignment();

                float ax=0, ay=0;
                if(alignment==Element.ALIGN_LEFT || alignment==Element.ALIGN_RIGHT) {

                    /// convert scaled width/height from -1 to extend
                    float scaledHeight = icon.getScaledHeight();
                    if (scaledHeight < 0) {
                        // get row height
                        float rowHeight = position.getHeight();
                        float newHeight = rowHeight - paddingTop - paddingBottom;

                        /// get width
                        float scaledWidth = icon.getScaledWidth();
                        float newWidth = scaledWidth;
                        if (scaledWidth < 0) {
                            float scaled = icon.getWidth() / icon.getHeight();
                            newWidth = newHeight * scaled;
                        }

                        icon.scaleAbsolute(newWidth, newHeight);
                    }

                    /// draw icon
                    Point pos = getDockPosition(position, alignment);
                    ax = (float) pos.getX();
                    // fix vertical position
                    ay = (float) (pos.getY() - (icon.getScaledHeight() * 0.5f));


                    // fix ALIGN_RIGHT
                    if (alignment == Element.ALIGN_RIGHT) {
                        ax -= icon.getScaledWidth();
                    }


                    icon.setAbsolutePosition(ax, ay);

                    canvas.addImage(icon);

                }else if(alignment==Element.ALIGN_TOP){
                    /// convert scaled width/height from -1 to extend
                    float scaledWidth = icon.getScaledWidth();
                    if (scaledWidth < 0) {
                        // get row height
                        float rowWidth = position.getWidth();
                        float newWidth = rowWidth - paddingLeft - paddingRight;

                        /// get width
                        float scaledHeight = icon.getScaledHeight();
                        float newHeight = scaledHeight;
                        if (scaledHeight < 0) {
                            float scaled = icon.getHeight() / icon.getWidth();
                            newHeight = newWidth * scaled;
                        }

                        icon.scaleAbsolute(newWidth, newHeight);
                    }

                    /// draw icon
                    Point pos = getDockPosition(position, Element.ALIGN_TOP);

                    // fix horizontal position
                    ax = (float) (pos.getX() - (icon.getScaledWidth() * 0.5f));
                    ay = (float) pos.getY() - icon.getScaledHeight();


                    icon.setAbsolutePosition(ax, ay);

                    canvas.addImage(icon);

                }else {
                    throw new RuntimeException("fatal: Invalid icon alignment:" + alignment);
                }


            } catch (DocumentException e) {
                throw new RuntimeException(e);
            }
        }
    }

    private Point getDockPosition(Rectangle position, int alignment) {
        Point pos = new Point();
        switch (alignment) {
            case Element.ALIGN_LEFT: {
                float ux = getRowStart(position);
                float uy = getVerticalCenter(position);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_RIGHT: {
                float ux = getRowEnd(position);
                float uy = getVerticalCenter(position);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_BASELINE: {
                float ux = getRowStart(position);
                float uy = getRowTop(position);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_TOP: {
                float ux = getHorizontalCenter(position);
                float uy = getRowTop(position);
                pos.setLocation(ux, uy);
            }
            break;

            case Element.ALIGN_BOTTOM: {
                float ux = getHorizontalCenter(position);
                float uy = getRowBottom(position);
                pos.setLocation(ux, uy);
            }
            break;

            default:
                throw new RuntimeException("Alignment not support: " + alignment);
        }

        return pos;
    }

    private float getVerticalCenter(Rectangle position) {
        return (position.getTop() + paddingTop + position.getBottom() - paddingBottom) * 0.5f;
    }
    private float getHorizontalCenter(Rectangle position) {
        return (position.getLeft() + paddingLeft + position.getRight() - paddingRight) * 0.5f;
    }

    private float getRowTop(Rectangle position) {
        return position.getTop() - paddingTop;
    }
    private float getRowBottom(Rectangle position) {
        return position.getBottom() + paddingBottom;
    }
    private float getRowStart(Rectangle position) {
        return position.getLeft() + paddingLeft;
    }

    private float getRowEnd(Rectangle position) {
        return position.getRight() - paddingRight;
    }

    private float getInternalWidth(Rectangle position){
        return position.getWidth() - paddingLeft - paddingRight;
    }
    private float getInternalHeight(Rectangle position){
        return position.getHeight() - paddingTop - paddingBottom;
    }
}
