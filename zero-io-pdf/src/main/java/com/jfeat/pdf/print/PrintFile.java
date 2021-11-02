package com.jfeat.pdf.print;

/**
 * Created by vincent on 2018/9/20.
 */
import javax.print.*;
import javax.print.attribute.DocAttributeSet;
import javax.print.attribute.HashDocAttributeSet;
import javax.print.attribute.HashPrintRequestAttributeSet;
import javax.print.attribute.PrintRequestAttributeSet;
import javax.print.attribute.standard.Copies;
import javax.print.attribute.standard.Sides;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Map;

/**
 * 调用打印机打印文件
 * @author 寇
 *
 */
public class PrintFile {

    /**
     * 调用打印机进行打印
     * @param printFilePath 打印文件路径
     * @param printFilePath 打印参数
     */
    public void print(String printFilePath, Map<Object, Object> map) {

        try {
            // 构建打印请求属性集
            PrintRequestAttributeSet pras = new HashPrintRequestAttributeSet();
            // 设置打印格式，因为未确定文件类型，这里选择AUTOSENSE
            DocFlavor flavor = DocFlavor.INPUT_STREAM.AUTOSENSE;
            // 查找所有的可用打印服务
            // [发送至 OneNote 2013, NPI82AACC (HP LaserJet M1536dnf MFP), Microsoft XPS Document Writer, Fax, CutePDF Writer]
            PrintService printService[] = PrintServiceLookup.lookupPrintServices(flavor, pras);
            // 定位默认的打印服务
            PrintService defaultService = null;
            // 获取打印机
            String printer = (String)map.get("printer");
            // 判断打印机是否为空
            if (printer==null || printer.length()==0) {
                // 获取默认配置文件打印机
                //printer = Global.getPrinterA4();
            }

            for (int i = 0; i < printService.length; i++) {
                if (printService[i].getName().contains(printer)) {
                    defaultService = printService[i];
                    break;
                }
            }

            if (defaultService != null) {

                //A4纸张
                //pras.add(MediaSize.A4);

                // 创建打印作业
                DocPrintJob job = defaultService.createPrintJob();
                // 构造待打印的文件流
                FileInputStream fis = new FileInputStream(printFilePath);
                DocAttributeSet das = new HashDocAttributeSet();
                // 建立打印文件格式
                Doc doc = new SimpleDoc(fis, flavor, das);
                // 打印份数
                if (map.get("Copies") != null) {
                    pras.add(new Copies((int) map.get("Copies")));
                } else {
                    pras.add(new Copies(1));
                }
                //双面打印
                //pras.add(Sides.DUPLEX);
                if (map.get("duplex") != null) {
                    if ((boolean)map.get("duplex")) {
                        pras.add(Sides.DUPLEX);
                    }
                } else {
                    pras.add(Sides.DUPLEX);
                }
                // 进行文件的打印
                job.print(doc, pras);
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (PrintException e) {
            e.printStackTrace();
        }
    }
}