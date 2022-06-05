package com.jfeat.pdf.print.flow;

import com.itextpdf.text.pdf.*;
import com.jfeat.pdf.print.base.FlowElement;
import com.jfeat.pdf.print.util.BarCodes;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;

/**
 * Created by vincent on 2018/9/28.
 */
public class BarCodeFlow implements FlowElement {
    public static String BC_EAN = "BC_EAN";
    public static String BC_39 = "BC_39";
    public static String BC_128 = "BC_128";
    public static String QR_CODE = "QR_CODE";

    private String formatName;
    private String code;
    private boolean ignoreCode;


    public BarCodeFlow(String formatName, String code, boolean ignoreCode){
        this.formatName = formatName;
        this.code = code;
        this.ignoreCode = ignoreCode;
        Assert.isTrue(!StringUtils.isEmpty(formatName), "formatName cannot be empty !");
    }

    @Override
    public void draw(PdfContentByte canvas) {
        if(this.BC_39.equals(formatName)){
            BarCodes.createBarCodeEAN(canvas, code);
        }else if(this.BC_39.equals(formatName)){
            BarCodes.createBarCode39(canvas, code, ignoreCode);
        }else if(this.BC_128.equals(formatName)){
            BarCodes.createBarCode128(canvas, code);
        }else if(this.QR_CODE.equals(formatName)){
            BarCodes.createQrCode(canvas, code);
        }
    }
}
