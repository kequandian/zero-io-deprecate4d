package com.jfeat.pdf.print.util;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Rectangle;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;
import org.springframework.util.Assert;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

/**
 * 用于新建文档还是在模板上合并文档
 */
public class PdfDocumentUtil {

    /**
     * document draw interface
     */
    public interface PdfWriteListener {
        void onDraw(Document document, PdfContentByte canvas) throws DocumentException;
    }


    /**
     * write document
     */
    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, String pdfFile) throws IOException, DocumentException {
        writeDocument(writer, outputStream, new PdfReader(pdfFile));
    }

    public static void writeDocument(PdfWriteListener writer, String newPdfFile, PdfReader pdfReader) throws IOException, DocumentException {
        writeDocument(writer, new FileOutputStream(newPdfFile), pdfReader);
    }

    public static void writeDocument(PdfWriteListener writer, String newPdfFile, String pdfFile) throws IOException, DocumentException {
        writeDocument(writer, new FileOutputStream(newPdfFile), new PdfReader(pdfFile));
    }

    public static void writeDocument(PdfWriteListener writer, String newPdfFile, float marginLeft, float marginRight, float marginTop, float marginBottom) throws IOException, DocumentException {
        writeDocument(writer, new FileOutputStream(newPdfFile), marginLeft, marginRight, marginTop, marginBottom);
    }

    public static void writeDocument(PdfWriteListener writer, String newPdfFile) throws IOException, DocumentException {
        writeDocument(writer, new FileOutputStream(newPdfFile), 0, 0, 0, 0);
    }

    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, float marginLeft, float marginRight, float marginTop, float marginBottom) throws DocumentException {
        writeDocument(writer, outputStream, PageSize.A4, marginLeft, marginRight, marginTop, marginBottom);
    }

    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, String pdfFile, float marginLeft, float marginRight, float marginTop, float marginBottom) throws IOException, DocumentException {
        Assert.isTrue(pdfFile==null || new File(pdfFile).exists(), pdfFile + " not exists !");
        writeDocument(writer, outputStream, pdfFile!=null? new PdfReader(pdfFile) : null, PageSize.A4, marginLeft, marginRight, marginTop, marginBottom);
    }


    /**
     *
     * @param writer
     * @param outputStream
     * @param pdfReader
     * @param pageSize
     * @param marginLeft
     * @param marginRight
     * @param marginTop
     * @param marginBottom
     * @throws DocumentException
     */
    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, PdfReader pdfReader, Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom) throws IOException, DocumentException {
        if(pdfReader!=null) {
            writeDocument(writer, outputStream, pdfReader);
        }else{
            writeDocument(writer, outputStream, pageSize, marginLeft, marginRight, marginTop, marginBottom);
        }
    }

    /**
     * 输出内容到 PdfReader 文档
     * PdfReader pdfReader = new PdfReader(pdfFile);
     *
     * @param writer       onDraw listener
     * @param outputStream output stream
     * @param pdfReader    input pdf template
     */
    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, PdfReader pdfReader) throws IOException, DocumentException {
        PdfStamper pdfStamper = new PdfStamper(pdfReader, outputStream);

        PdfContentByte canvas = pdfStamper.getOverContent(1);
        writer.onDraw(null, canvas);

        // 如果为false那么生成的PDF文件还能编辑，一定要设为true
        pdfStamper.setFormFlattening(true);

        pdfStamper.close();
        pdfReader.close();
    }

    /**
     * 新建文档输出
     *
     * @param writer       onDraw listener
     * @param outputStream
     * @param marginLeft
     * @param marginRight
     * @param marginTop
     * @param marginBottom
     * @throws DocumentException
     */
    public static void writeDocument(PdfWriteListener writer, OutputStream outputStream, Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom) throws DocumentException {
        /// 没有模板，新建文档
        Document document = new Document(pageSize, marginLeft, marginRight, marginTop, marginBottom);

        PdfWriter pdfWriter = PdfWriter.getInstance(document, outputStream);
        document.open();

        PdfContentByte canvas = pdfWriter.getDirectContent();
        writer.onDraw(document, canvas);

        document.close();
    }
}
