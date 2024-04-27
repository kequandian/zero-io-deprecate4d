package com.jfeat.fs.util;

import com.jhlabs.image.BoxBlurFilter;
import org.apache.commons.io.FilenameUtils;

import javax.imageio.ImageIO;
import javax.swing.*;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * Created by jackyhuang on 2017/6/29.
 */
public class ImageUtil {

    public static final String FORMAT_PNG = "png";
    public static final String FORMAT_JPEG = "jpeg";

    /**
     * 高斯模糊
     *
     * @param sourceFile
     * @return
     * @throws IOException
     */
    public static File gaos(File sourceFile) throws IOException {
        if (!sourceFile.isFile()) {
            throw new FileNotFoundException("Not a file");
        }
        String extension = FilenameUtils.getExtension(sourceFile.getName());
        BufferedImage source = ImageIO.read(sourceFile);
        String name = UUID.randomUUID().toString() + "." + extension;
        File targetFile = new File(sourceFile.getParent(), name);

        BoxBlurFilter filter = new BoxBlurFilter(10, 10, 10);
        BufferedImage target = filter.filter(source, null);
        ImageIO.write(target, extension, targetFile);
        return targetFile;
    }

    public static File reduce(File sourceFile) throws IOException {
        int[] originalSize = getImgWidth(sourceFile);
        int width = originalSize[0];
        int height = originalSize[1];
        String extension = FilenameUtils.getExtension(sourceFile.getName());
        String name = UUID.randomUUID().toString() + "_" + width + "_" + height + "." + extension;
        return reduce(sourceFile, name, width, height, false);
    }

    public static File reduce(File sourceFile, String name, int outputWidth, int outputHeight, boolean proportion) throws IOException {
        int width, height;
        if (proportion) {
            int[] originalSize = getImgWidth(sourceFile);
            int originalWidth = originalSize[0];
            int originalHeight = originalSize[1];
            double rate1 = (double) originalWidth / (double) outputWidth;
            double rate2 = (double) originalHeight / (double) outputHeight;
            double rate = rate1 < rate2 ? rate1 : rate2;
            width = (int) (originalWidth / rate);
            height = (int) (originalHeight / rate);
        } else {
            width = outputWidth;
            height = outputHeight;
        }

        // 开始读取文件并进行压缩
        BufferedImage src = ImageIO.read(sourceFile);
        BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D reducedG = tag.createGraphics();
        String format = FORMAT_JPEG;
        List<Integer> pngTypes = new ArrayList<>(Arrays.asList(
                BufferedImage.TYPE_INT_ARGB, BufferedImage.TYPE_4BYTE_ABGR, BufferedImage.TYPE_4BYTE_ABGR_PRE, BufferedImage.TYPE_INT_ARGB_PRE
        ));
        if (pngTypes.contains(src.getType())) {
            tag = reducedG.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
            reducedG.dispose();
            reducedG = tag.createGraphics();
            format = FORMAT_PNG;
        }
        reducedG.drawImage(src.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
        reducedG.dispose();
        //注释下行代码 后 会同时生成2个图片 分别为 压缩前 压缩后
        name = sourceFile.getName();

        File targetFile = new File(sourceFile.getParent(), name);
        ImageIO.write(tag, format, targetFile);
        return targetFile;
    }

    /**
     * 得到图片宽度和高度
     *
     * @param file
     * @return
     */
//    public static int[] getImgWidth(File file) throws IOException {
//        int result[] = {0, 0};
//        BufferedImage src = ImageIO.read(file);
//        result[0] = src.getWidth(null); // 得到源图宽
//        result[1] = src.getHeight(null); // 得到源图高
//        return result;
//    }
    public static int[] getImgWidth(File file) throws IOException {
        int[] result = new int[]{0, 0};
        InputStream is = new FileInputStream(file);
        BufferedImage src = ImageIO.read(is);
        result[0] = src.getWidth((ImageObserver) null);
        result[1] = src.getHeight((ImageObserver) null);
        is.close();
        return result;
    }

    public static File thumb(File sourceFile) throws IOException {
        int width, height;
        int[] originalSize = getImgWidth(sourceFile);
        int originalWidth = originalSize[0];
        int originalHeight = originalSize[1];
        double rate1 = (double) originalWidth / (double) 160;
        double rate2 = (double) originalHeight / (double) 160;
        double rate = rate1 < rate2 ? rate1 : rate2;
        width = (int) (originalWidth / rate);
        height = (int) (originalHeight / rate);

        // 开始读取文件并进行压缩
        // https://blog.csdn.net/kobejayandy/article/details/44346809
        // fix 图片红色问题
        Image image = Toolkit.getDefaultToolkit().createImage(sourceFile.getPath());
        BufferedImage src = toBufferedImage(image);
        BufferedImage tag = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
        Graphics2D reducedG = tag.createGraphics();
        String format = "jpeg";
        List<Integer> pngTypes = new ArrayList<>(Arrays.asList(
                BufferedImage.TYPE_INT_ARGB, BufferedImage.TYPE_4BYTE_ABGR, BufferedImage.TYPE_4BYTE_ABGR_PRE, BufferedImage.TYPE_INT_ARGB_PRE
        ));
        if (pngTypes.contains(src.getType())) {
            tag = reducedG.getDeviceConfiguration().createCompatibleImage(width, height, Transparency.TRANSLUCENT);
            reducedG.dispose();
            reducedG = tag.createGraphics();
            format = "jpeg";
        }
        reducedG.drawImage(src.getScaledInstance(width, height, Image.SCALE_SMOOTH), 0, 0, null);
        reducedG.dispose();

        String extension = FilenameUtils.getExtension(sourceFile.getName());
        String baseName = FilenameUtils.getBaseName(sourceFile.getName());
        String fileName = baseName + "-thumb." + extension;

        File targetFile = new File(sourceFile.getParent(), fileName);
        ImageIO.write(tag, format, targetFile);
        return targetFile;
    }

    private static BufferedImage toBufferedImage(Image image) {
        if (image instanceof BufferedImage) {
            return (BufferedImage) image;
        }
        // This code ensures that all the pixels in the image are loaded
        image = new ImageIcon(image).getImage();
        BufferedImage bimage = null;
        GraphicsEnvironment ge = GraphicsEnvironment
                .getLocalGraphicsEnvironment();
        try {
            int transparency = Transparency.OPAQUE;
            GraphicsDevice gs = ge.getDefaultScreenDevice();
            GraphicsConfiguration gc = gs.getDefaultConfiguration();
            bimage = gc.createCompatibleImage(image.getWidth(null),
                    image.getHeight(null), transparency);
        } catch (HeadlessException e) {
            // The system does not have a screen
        }
        if (bimage == null) {
            // Create a buffered image using the default color model
            int type = BufferedImage.TYPE_INT_RGB;
            bimage = new BufferedImage(image.getWidth(null),
                    image.getHeight(null), type);
        }
        // Copy image to buffered image
        Graphics g = bimage.createGraphics();
        // Paint the image onto the buffered image
        g.drawImage(image, 0, 0, null);
        g.dispose();
        return bimage;
    }
}