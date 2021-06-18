package com.jfeat.zero.pdf;

import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.*;
import com.itextpdf.text.pdf.parser.*;
import com.itextpdf.text.pdf.security.PdfPKCS7;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.security.cert.Certificate;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

/**
 * Created by vincent on 2018/4/24.
 */
public class PdfAnnotations {


    public static void main(String args[]) {
        try {
            // Reads and parses a PDF document
            PdfReader reader = new PdfReader("海珠区人民政府一卡通系统数据分析与修复服务合同4-24.pdf");
            getSignaturePosition(reader);
            verifyPdf(reader);

            AcroFields fields = reader.getAcroFields();
            ArrayList<String> names = fields.getSignatureNames();
            for (String name : names) {
                System.out.println("===== " + name + " =====");
                System.out.println("Signature covers whole document: " + fields.signatureCoversWholeDocument(name));
                System.out.println("Document revision: " + fields.getRevision(name) + " of " + fields.getTotalRevisions());
                PdfPKCS7 pkcs7 = fields.verifySignature(name);
                System.out.println("Integrity check OK? " + pkcs7.verify());
            }
            System.out.println();

            // For each PDF page
            for (int i = 1; i <= reader.getNumberOfPages(); i++) {

                // Get a page a PDF page
                PdfDictionary page = reader.getPageN(i);
                // Get all the annotations of page i
                PdfArray annotsArray = page.getAsArray(PdfName.ANNOTS);

                // If page does not have annotations
                if (page.getAsArray(PdfName.ANNOTS) == null) {
                    continue;
                }

                // For each annotation
                for (int j = 0; j < annotsArray.size(); ++j) {
                    // For current annotation
                    PdfDictionary curAnnot = annotsArray.getAsDict(j);
                    // Check the annotation subtype and print its text if not null
                    writeAnnotation(curAnnot, reader, i);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void getSignaturePosition(PdfReader reader){
        AcroFields fields = reader.getAcroFields();

        for(String signame : fields.getBlankSignatureNames()) {
            List<AcroFields.FieldPosition> positions = fields.getFieldPositions(signame);
            Rectangle rect = positions.get(0).position; // In points:
            float left   = rect.getLeft();
            float bTop   = rect.getTop();
            float width  = rect.getWidth();
            float height = rect.getHeight();

            int page = positions.get(0).page;
            Rectangle pageSize = reader.getPageSize(page);
            float pageHeight = pageSize.getTop();
            float top = pageHeight - bTop;

            System.out.print(signame + "::" + page + "::" + left + "::" + top + "::" + width + "::" + height + "\n");
        }
    }

    public static final boolean verifyPdf(PdfReader reader)
            throws IOException, DocumentException, Exception
    {
        AcroFields af = reader.getAcroFields();

        // Search of the whole signature
        ArrayList names = af.getSignatureNames();

        // For every signature :
        for (int k = 0; k < names.size(); ++k) {
            String name = (String)names.get(k);
            // Affichage du nom
            System.out.println("Signature name: " + name);
            System.out.println("Signature covers whole document: "
                    + af.signatureCoversWholeDocument(name));
            // Affichage sur les revision - version
            System.out.println("Document revision: " + af.getRevision(name) + " of "
                    + af.getTotalRevisions());
            // Debut de l'extraction de la "revision"
            FileOutputStream out = new FileOutputStream("d:\\revision_"
                    + af.getRevision(name) + ".pdf");
            byte bb[] = new byte[8192];
            InputStream ip = af.extractRevision(name);
            int n = 0;
            while ((n = ip.read(bb)) > 0) out.write(bb, 0, n);
            out.close();
            ip.close();
            // Fin extraction revision

            PdfPKCS7 pk = af.verifySignature(name);
            Calendar cal = pk.getSignDate();
            Certificate pkc[] = pk.getCertificates();
            // Information about the certificat, le signataire
            "".toString();
        }
        return true ;
    }

    /**
     * Check the annotation subtype and print its text.
     *
     * @param annot annotation to write.
     * @param reader pdf document containing the annotation.
     * @param pageNumber pdf page number containing the annotation.
     */
    public static void writeAnnotation(PdfDictionary annot, PdfReader reader, int pageNumber) throws IOException {

        if(annot == null) {
            return;
        }


//        System.out.print(annot.get(PdfName.SUBTYPE));
//        System.out.print(" -> Rect: " + annot.get(PdfName.RECT));

        PdfString text = null;
        boolean mayHaveTextAnnotated = false;

        // Highlights with comments (balloons) and Highliths
        if (PdfName.HIGHLIGHT.equals(annot.get(PdfName.SUBTYPE))) {
            // Only Highlights with comments may have text
            text = (PdfString) annot.get(PdfName.CONTENTS);
            mayHaveTextAnnotated = true;
        } else if (PdfName.UNDERLINE.equals(annot.get(PdfName.SUBTYPE))) {
            text = annot.getAsString(PdfName.CONTENTS);
            mayHaveTextAnnotated = true;
            // A comment (a balloon with a comment)
        } else if (PdfName.TEXT.equals(annot.get(PdfName.SUBTYPE))) {
            text = annot.getAsString(PdfName.CONTENTS);
            PdfArray rect = (PdfArray) annot.get(PdfName.RECT);

            "".toString();
        } else {
            text = annot.getAsString(PdfName.CONTENTS);
        }

        if(text != null) {
            System.out.println(" -> " + text);
        }

        if(mayHaveTextAnnotated) {
            PdfArray rectangle = (PdfArray) annot.get(PdfName.RECT); // ex: [82.1569, 757.575, 124.395, 769.305]
            String textHighlighted = getTextFromRectangle(rectangle, reader, pageNumber);
            if(textHighlighted != null) {
                System.out.println(" Annotated text -> " + textHighlighted);
            }
        }
    }


    /**
     * Extracts the text {@code rectangle}, located on page {@code pageNumber}
     * of the pdf {@code reader}.
     * <p>The text extracted by this method is not perfect. Usually extracts an
     * unnecessary (not desirable) extra character. For instance, for an annotations
     * like "[This is an annotated] text", the method will extract
     * "This is an annotated t". </p> The extra character may appear before or
     * after the annotated text.
     *
     * @param reader
     * @param pageNumber
     * @param rectangle ex: [82.1569, 757.575, 124.395, 769.305]
     * @return the extracted text or null.
     */
    public static String getTextFromRectangle(PdfArray rectangle,
                                              PdfReader reader, int pageNumber) throws IOException {

        if(rectangle == null) {
            return null;
        }

        // Get the retangle coodinates
        float llx = rectangle.getAsNumber(0).floatValue();
        float lly = rectangle.getAsNumber(1).floatValue();
        float urx = rectangle.getAsNumber(2).floatValue();
        float ury = rectangle.getAsNumber(3).floatValue();

        Rectangle rect = new Rectangle(llx, lly, urx, ury);
        RenderFilter filter = new RegionTextRenderFilter(rect);
        TextExtractionStrategy strategy =
                new FilteredTextRenderListener(
                        new LocationTextExtractionStrategy(), filter);

        return PdfTextExtractor.getTextFromPage(reader, pageNumber, strategy);
    }



}