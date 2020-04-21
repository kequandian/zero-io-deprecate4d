package com.jfeat.pdf.print;

import com.itextpdf.text.*;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfReader;
import com.itextpdf.text.pdf.PdfStamper;
import com.itextpdf.text.pdf.PdfWriter;

import java.io.*;

/**
 * Created by vincenthuang on 26/09/2018.
 */
public class PdfExporter {

    /**
     * 输出模板文件
     */
    String template;

    private Document _document;
    private PdfStamper _stamper;
    private PdfReader _pdfReader;

    private PdfContentByte _canvas;


    public PdfExporter(){

    }

    public PdfContentByte canvas(){
        return this._canvas;
    }

    public Document document(){
        return _document;
    }

    public void addElement(Element element){
        try {
            _document.add(element);

        } catch (DocumentException e) {
            throw new RuntimeException(e);
        }
    }

    public Rectangle getPageSize(){
        return _document.getPageSize();
    }

    public void setTemplate(String template){
        this.template = template;
    }

    public PdfExporter close(){

        if(this.template==null) {
            _document.close();

        }else{

            try {
                _stamper.setFormFlattening(true);
                _stamper.close();
                _pdfReader.close();

            }catch (IOException e){
                throw new RuntimeException(e);

            }catch (DocumentException e){
                throw new RuntimeException(e);

            }
        }

        return this;
    }


    public PdfExporter export(OutputStream outputStream, Rectangle pageSize, float marginLeft, float marginRight, float marginTop, float marginBottom) throws DocumentException {

        if(this.template==null) {

            /// 没有模板，新建文档

            _document = new Document(pageSize);
            _document.setMargins(marginLeft, marginRight, marginTop, marginBottom);

            PdfWriter writer = PdfWriter.getInstance(_document, outputStream);
            _document.open();

            _canvas = writer.getDirectContent();

            //HeaderFlowReport reporter = builder.build();
            //reporter.draw(canvas);

            //document.close();

        }else{

            if(new File(template).exists()) {
                try {

                    _pdfReader = new PdfReader(this.template);

                    // 修改pdf
                    _stamper = new PdfStamper(_pdfReader, outputStream);

                    /// draw
                    PdfContentByte canvas = _stamper.getOverContent(1);
                    //HeaderFlowReport reporter = builder.build();
                    //reporter.draw(canvas);
                    // end draw

                    // 如果为false那么生成的PDF文件还能编辑，一定要设为true
                    //_stamper.setFormFlattening(true);

                    //pdfStamper.close();
                    //pdfReader.close();

                }catch (IOException e){
                    throw new RuntimeException(e.getMessage());
                }

            }else{
                throw new RuntimeException("BadRequest: invalid template ! file not exits:" + this.template);
            }
        }

        return this;
    }

    public PdfExporter export(String filePath, float margins) throws FileNotFoundException, DocumentException {
        return export(new FileOutputStream(filePath), PageSize.A4, margins, margins, margins, margins);
    }

    public PdfExporter export(String filePath, Rectangle pageSize, float margins) throws FileNotFoundException, DocumentException {
        return export(new FileOutputStream(filePath), pageSize, margins, margins, margins, margins);
    }


    public PdfExporter export(String filePath) throws FileNotFoundException, DocumentException {
        return export(new FileOutputStream(filePath), PageSize.A4, 0, 0, 0, 0);
    }

}
