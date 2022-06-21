package com.jfeat.pdf.print.util;

import com.itextpdf.awt.geom.Point;
import com.itextpdf.text.*;
import com.itextpdf.text.log.Logger;
import com.itextpdf.text.log.LoggerFactory;
import com.itextpdf.text.pdf.*;

import static com.jfeat.pdf.print.base.RelativeBoxBounding.getDockPosition;
import static com.jfeat.pdf.print.base.RelativeBoxBounding.getInternalWidth;

public class ElementDrawUtil {
    private static final Logger logger = LoggerFactory.getLogger(ElementDrawUtil.class);

    public static  void drawLines(PdfContentByte canvas, Rectangle position, Phrase[] lines,
                             float paddingLeft, float paddingTop, float paddingRight, float paddingBottom,
                             int alignment,
                             float indent, float lineSpacing) {
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
                float localPaddingTop = capHeight - fontSize;
                cell.setPaddingTop(localPaddingTop);
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
                Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, Element.ALIGN_BASELINE);
                ux = (float) pos.getX();
                uy = (float) pos.getY();

            }else if(alignment==Element.ALIGN_LEFT){
                Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, Element.ALIGN_LEFT);
                ux = (float) pos.getX();
                uy = (float) pos.getY();

                float offset = totalHeight * 0.5f;
                uy += offset;
            }else{
                throw new RuntimeException("Not support for Alignment: "+ alignment);
            }

            table.setTotalWidth(getInternalWidth(position, paddingLeft, paddingRight));
            table.writeSelectedRows(0, -1, ux, uy, canvas);

            /// debug
            //float th = table.getTotalHeight();
            //float h1 = table.getRowHeight(0);
            //float h2 = table.getRowHeight(1);

        }catch (Exception e){
            throw new RuntimeException(e);
        }
    }

    public static  void drawText(PdfContentByte canvas, String text) {
        if(text!=null) {
            drawText(canvas, new Rectangle(0,0,0,0), new Phrase(text),
                    20, 20, 20, 20, Rectangle.ALIGN_BASELINE);
        }
    }

    public static  void drawText(PdfContentByte canvas, Rectangle position, String text) {
        if(text!=null) {
            drawText(canvas, position, new Phrase(text),
                    0, 0, 0, 0, 0);
        }
    }

    public static  void drawText(PdfContentByte canvas, Rectangle position, String text, Font font,
                            float paddingLeft, float paddingTop, float paddingRight, float paddingBottom,
                            int alignment) {
        if(text!=null) {
            drawText(canvas, position,
                    font == null ? new Phrase(text) : new Phrase(text, font),
                    paddingLeft, paddingTop, paddingRight, paddingBottom, alignment);
        }
    }

    public static  void drawText(PdfContentByte canvas, Rectangle position, Phrase text,
                            float paddingLeft, float paddingTop, float paddingRight, float paddingBottom,
                            int alignment) {

        if(text!=null) {

            Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, alignment);
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

    public static void drawImage(PdfContentByte canvas, String imageUrl, Rectangle position, int alignment,
                                 float paddingLeft, float paddingTop, float paddingRight, float paddingBottom){
        Image image = Image.getInstance(ImageUtil.getImage(imageUrl));
        image.setAlignment(alignment);
        image.scaleToFit(-1, -1);

        drawImage(canvas, image, position, paddingLeft, paddingTop, paddingRight, paddingBottom);
    }   

    public static void drawImage(PdfContentByte canvas, Image image, Rectangle position,
                                 float paddingLeft, float paddingTop, float paddingRight, float paddingBottom) {
        if (image != null) {
            try {
                int alignment = image.getAlignment();

                double ax=0, ay=0;
                if(alignment==Element.ALIGN_LEFT || alignment==Element.ALIGN_RIGHT) {

                    /// convert scaled width/height from -1 to extend
                    float scaledHeight = image.getScaledHeight();
                    if (scaledHeight < 0) {
                        // get row height
                        float rowHeight = position.getHeight();
                        float newHeight = rowHeight - paddingTop - paddingBottom;

                        /// get width
                        float scaledWidth = image.getScaledWidth();
                        float newWidth = scaledWidth;
                        if (scaledWidth < 0) {
                            float scaled = image.getWidth() / image.getHeight();
                            newWidth = newHeight * scaled;
                        }

                        image.scaleToFit(newWidth, newHeight);
//                        image.scaleAbsolute(newWidth, newHeight);

                    }else if(image.getScaledWidth() > position.getWidth() ||
                             image.getScaledHeight() > position.getHeight()){
                        image.scaleToFit(position.getWidth() - paddingLeft - paddingRight,
                                position.getHeight() - paddingTop - paddingBottom);
                    }

                    /// draw icon
                    Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, alignment);
                    ax = (float) pos.getX();
                    // fix vertical position
                    ay = (float) (pos.getY() - (image.getScaledHeight() * 0.5f));


                    // fix ALIGN_RIGHT
                    if (alignment == Element.ALIGN_RIGHT) {
                        ax -= image.getScaledWidth();
                    }
                    
//                    // correct padding
//                    ax += paddingLeft;
//                    ay -= paddingBottom;

                    image.setAbsolutePosition((float)ax, (float)ay);

                    canvas.addImage(image);

                }else if(alignment==Element.ALIGN_TOP) {
                    /// convert scaled width/height from -1 to extend
                    float scaledWidth = image.getScaledWidth();
                    if (scaledWidth < 0) {
                        // get row height
                        float rowWidth = position.getWidth();
                        float newWidth = rowWidth - paddingLeft - paddingRight;

                        /// get width
                        float scaledHeight = image.getScaledHeight();
                        float newHeight = scaledHeight;
                        if (scaledHeight < 0) {
                            float scaled = image.getHeight() / image.getWidth();
                            newHeight = newWidth * scaled;
                        }

                        image.scaleToFit(newWidth, newHeight);
//                        image.scaleAbsolute(newWidth, newHeight);

                    } else if (image.getScaledWidth() > position.getWidth() ||
                            image.getScaledHeight() > position.getHeight()) {
                        image.scaleToFit(position.getWidth() - paddingLeft - paddingRight,
                                position.getHeight() - paddingTop - paddingBottom);
                    }

                    /// draw image
                    Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, Element.ALIGN_TOP);

                    // fix horizontal position
                    ax = (pos.getX() - (image.getScaledWidth() * 0.5f));
                    ay =  pos.getY() - image.getScaledHeight();

//                    // correct padding
//                    ax += paddingLeft;
//                    ay -= paddingBottom;

                    image.setAbsolutePosition((float)ax, (float)ay);

                    canvas.addImage(image);

                }else if(alignment == Element.ALIGN_CENTER || alignment == Element.ALIGN_MIDDLE) {
                    
                    float scaledWidth = image.getScaledWidth();
                    if (scaledWidth < 0) {
                        // get row height
                        float rowWidth = position.getWidth();
                        float newWidth = rowWidth - paddingLeft - paddingRight;

                        /// get width
                        float scaledHeight = image.getScaledHeight();
                        float newHeight = scaledHeight;
                        if (scaledHeight < 0) {
                            float scaled = image.getHeight() / image.getWidth();
                            newHeight = newWidth * scaled;
                        }

                        image.scaleToFit(newWidth, newHeight);
//                        image.scaleAbsolute(newWidth, newHeight);

                    } else if (image.getScaledWidth() > position.getWidth() ||
                            image.getScaledHeight() > position.getHeight()) {
                        // scale to fix
                        image.scaleToFit(position.getWidth() - paddingLeft - paddingRight,
                                        position.getHeight() - paddingTop - paddingBottom);
                    }

                    /// draw image
//                    Point pos = getDockPosition(position, paddingLeft, paddingTop, paddingRight, paddingBottom, Element.ALIGN_CENTER);
                    Point pos = new Point(position.getLeft() + paddingLeft , position.getBottom() - paddingBottom);
                    ax = pos.getX();
                    ay = pos.getY();

                    image.setAbsolutePosition((float)ax, (float)ay);

                    canvas.addImage(image);
                }else {
                    throw new RuntimeException("fatal: Invalid icon alignment:" + alignment);
                }


            } catch (DocumentException e) {
                throw new RuntimeException(e);
            }
        }
    }
}
