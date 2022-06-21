package com.jfeat.pdf.print.util;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Image;
import com.itextpdf.text.pdf.*;

/**
 * Created by vincent on 2018/9/28.
 */
public class BarCodes {
    public static Image createBarCodeEAN(PdfContentByte canvas, String code){
        BarcodeEAN barcodeEAN = new BarcodeEAN();
        //barcodeEAN.setCode("3210123456789");
        barcodeEAN.setCode(code);
        barcodeEAN.setCodeType(Barcode.EAN13);
        Image codeEANImage = barcodeEAN.createImageWithBarcode(canvas, null, null);
        return codeEANImage;
    }

    public static Image createBarCode39(PdfContentByte canvas, String code, boolean ignoreCode){
        Barcode39 barcode39 = new Barcode39();
        //barcode39.setCode("123456789");
        barcode39.setCode(code);

        if(ignoreCode) {
            barcode39.setFont(null);
        }

        Image code39Image = barcode39.createImageWithBarcode(canvas, null, null);
        return code39Image;
    }

    public static Image createBarCode128(PdfContentByte canvas, String code){
        Barcode128 barcode128 = new Barcode128();
        //barcode128.setCode("memorynotfound.com");
        barcode128.setCode(code);

        barcode128.setCodeType(Barcode.CODE128);

        Image code128Image = barcode128.createImageWithBarcode(canvas, null, null);
        return code128Image;
    }

    public static Image createQrCode(PdfContentByte canvas, String content){
        try {
            BarcodeQRCode barcodeQRCode = new BarcodeQRCode(content, 1000, 1000, null);
            Image codeQrImage = null;

            codeQrImage = barcodeQRCode.getImage();

            codeQrImage.scaleAbsolute(100, 100);
            return codeQrImage;

        } catch (BadElementException e) {
            throw new RuntimeException(e);
        }
    }
}
