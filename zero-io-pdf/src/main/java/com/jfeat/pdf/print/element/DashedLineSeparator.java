package com.jfeat.pdf.print.element;

import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.draw.DottedLineSeparator;

/**
 * Created by vincenthuang on 28/09/2018.
 * <p>
 * <p>
 * CustomDashedLineSeparator separator = new CustomDashedLineSeparator();
 * separator.setDash(10);
 * separator.setGap(7);
 * separator.setLineWidth(3);
 * separator.setLineColor(lineColor);
 * Chunk linebreak = new Chunk(separator);
 */
public class DashedLineSeparator extends DottedLineSeparator {
    protected float dash = 5;
    protected float phase = 2.5f;

    public float getDash() {
        return dash;
    }

    public float getPhase() {
        return phase;
    }

    public void setDash(float dash) {
        this.dash = dash;
    }

    public void setPhase(float phase) {
        this.phase = phase;
    }

    public void draw(PdfContentByte canvas,
                     float llx, float lly, float urx, float ury, float y) {
        canvas.saveState();
        canvas.setLineWidth(lineWidth);
        canvas.setLineDash(dash, gap, phase);
        drawLine(canvas, llx, urx, y);
        canvas.restoreState();
    }
}