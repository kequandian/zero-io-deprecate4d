package com.jfeat.pdf.print.util;

import com.itextpdf.text.BadElementException;
import com.itextpdf.text.Image;

import javax.imageio.ImageIO;
import java.io.*;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by craftperson on 2018/2/27.
 */
public class ImageUtil {

    public static float getImageRatio(String url) throws IOException{
        Image img = getImage(url);
        return img.getHeight()/img.getWidth();
    }

    public static Image getImage(String url){
        Image image=null;

        if(isImageUrl(url)) {
            java.awt.Image img = null;
            try {
                img = getAwtImage(url);
            } catch (IOException e) {
                e.printStackTrace();
            }
            if (img != null) {
                try {
                    image = Image.getInstance(img,  java.awt.Color.BLACK);
                } catch (BadElementException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
        // else{
        //     image = new BarcodeQRCode(url, 10, 10, null)
        //             .getImage();
        // }
        return image;
    }

    public static java.awt.Image getAwtImage(String urlString) throws IOException {
        if (isFromWeb(urlString)) {
            URL url = new URL(urlString);
//            URLConnection urlConnection = url.openConnection();
//            urlConnection.setRequestProperty("Accept","image/webp,image/*,*/*;q=0.8");
//            urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
//            urlConnection.setRequestProperty("Connection","keep-alive");
//            InputStream inputStream = urlConnection.getInputStream();
            java.awt.Image image = ImageIO.read(url);
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

    private static boolean isImageUrl(String url){
        if(url==null) {
            url = "";
        }
        String[] suffixes = new String[] {".jpg", "png", ".jpeg"};
        for(String fix : suffixes){
            if(url.endsWith(fix)){
                return true;
            }
        }
        return false;
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

}
