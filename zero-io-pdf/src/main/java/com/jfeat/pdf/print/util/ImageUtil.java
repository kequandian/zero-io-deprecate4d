package com.jfeat.pdf.print.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.*;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by craftperson on 2018/2/27.
 */
public class ImageUtil {

    /**
     *  获取文件字节流
     * @param filePath
     * @return
     **/
    public static byte[] getBytes(String filePath){
        byte[] buffer = null;
        try (FileInputStream fis = new FileInputStream(filePath);
             ByteArrayOutputStream bos = new ByteArrayOutputStream(1000)) {

            byte[] b = new byte[1000];
            int n;
            while ((n = fis.read(b)) != -1) {
                bos.write(b, 0, n);
            }
            fis.close();
            bos.close();
            buffer = bos.toByteArray();
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return buffer;
    }


    public static Image getImage(String urlString) throws IOException {
        if (isFromWeb(urlString)) {
            URL url = new URL(urlString);
//            URLConnection urlConnection = url.openConnection();
//            urlConnection.setRequestProperty("Accept","image/webp,image/*,*/*;q=0.8");
//            urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
//            urlConnection.setRequestProperty("Connection","keep-alive");
//            InputStream inputStream = urlConnection.getInputStream();
            Image image = ImageIO.read(url);
            return image;
        } else {
            File imageFile = new File(urlString);
            return ImageIO.read(imageFile);
        }
    }

    private static boolean isFromWeb(String url) {
        String pattern = "^(https|http|ftp|rtsp|mms)://";
        Pattern pat = Pattern.compile(pattern);
        Matcher matcher = pat.matcher(url);
        if (matcher.find()) {
            return true;
        }

        if (new File(url).exists()) {
            return false;
        }
        throw new IllegalArgumentException("无法判断，未知资源");
    }

//     private static Image getImageFromWeb(String urlString) throws IOException {
//         URL url = new URL(urlString);
// //            URLConnection urlConnection = url.openConnection();
// //            urlConnection.setRequestProperty("Accept","image/webp,image/*,*/*;q=0.8");
// //            urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
// //            urlConnection.setRequestProperty("Connection","keep-alive");
// //            InputStream inputStream = urlConnection.getInputStream();
//         Image image = ImageIO.read(url);
//         return image;
//     }

    // private boolean isImageUrl(String url){
    //     if(url==null) {
    //         url = "";
    //     }

    //     String[] suffixes = new String[] {".jpg", "png", ".jpeg"};

    //     for(String fix : suffixes){
    //         if(url.endsWith(fix)){
    //             return true;
    //         }
    //     }
    //     return false;
    // }

    // protected Image getRowImage(String url) throws IOException{
    //     Image image=null;

    //     if(isImageUrl(url)) {
    //         Image img = getImage(url);
    //         if (img != null) {
    //             image = Image.getInstance(img, Color.BLACK);
    //         }
    //     }else{
    //         image = new BarcodeQRCode(url, 10, 10, null)
    //                 .getImage();
    //     }
    //     return image;
    // }

}
