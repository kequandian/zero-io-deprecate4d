package com.jfeat.zero.pdf.print.util;

import javax.imageio.ImageIO;
import java.awt.*;
import java.io.File;
import java.io.IOException;
import java.net.URL;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by craftperson on 2018/2/27.
 */
public class ImageUtil {
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

    private static Image getImageFromWeb(String urlString) throws IOException {
        URL url = new URL(urlString);
//            URLConnection urlConnection = url.openConnection();
//            urlConnection.setRequestProperty("Accept","image/webp,image/*,*/*;q=0.8");
//            urlConnection.setRequestProperty("User-Agent","Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.104 Safari/537.36 Core/1.53.4549.400 QQBrowser/9.7.12900.400");
//            urlConnection.setRequestProperty("Connection","keep-alive");
//            InputStream inputStream = urlConnection.getInputStream();
        Image image = ImageIO.read(url);
        return image;
    }

}
