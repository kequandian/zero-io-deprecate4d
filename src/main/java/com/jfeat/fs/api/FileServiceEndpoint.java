package com.jfeat.fs.api;


import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.ErrorTip;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.util.StrKit;
import com.jfeat.fs.model.Bucket;
import com.jfeat.fs.properties.BucketProperties;
import com.jfeat.fs.properties.FSProperties;
import com.jfeat.fs.service.LoadFileCodeService;
import com.jfeat.fs.util.FileInfo;
import com.jfeat.fs.util.ImageUtil;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.util.*;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.GraphicsConfiguration;
import java.awt.GraphicsDevice;
import java.awt.GraphicsEnvironment;
import java.awt.HeadlessException;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.awt.image.ImageObserver;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.*;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.ImageIcon;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * Created by jackyhuang on 2017/7/4.
 */
@Api(value = "Service")
@RestController
public class FileServiceEndpoint {
    protected final static Logger logger = LoggerFactory.getLogger(FileServiceEndpoint.class);

    private final static List<String> PERMITTED_FILE_TYPE = List.of("mp4", "mp3", "mov", "mkv", "avi", "jpeg", "jpg", "png");

    @Autowired
    FSProperties FSProperties;

    @Autowired
    LoadFileCodeService loadFileCodeService;

    @Autowired
    private BucketProperties bucketProperties;

    @ApiOperation(value = "创建存储桶", response = String.class, notes = "根据Token中的APPID创建对应的存储桶")
    @ApiParam(name = "name", value = "存储桶名称")
    @PostMapping("/api/fs/buckets")
    public Tip generateBucket(@RequestHeader(value = "authorization", required = false) String token,
                              @RequestBody Bucket bucket) {
        if (Objects.nonNull(bucket)) {
            // 校验APP-ID / APP-KEY
            if (!bucketProperties.getAppId().equals(bucket.getAppId()) || !bucketProperties.getAppSecret().equals(bucket.getAppSecret())) {
                return ErrorTip.create(BusinessCode.AuthorizationError);
            }

            // 获取APP-ID用于创建对应的APP目录
            String appId = bucketProperties.getAppId();
            // 获取常规保存路径
            String savePath = getFileUploadPath();

            if (!StringUtils.isEmpty(bucket.getBucket())) {
                // 创建Bucket路径
                File dir = new File(String.join(File.separator, savePath, appId, bucket.getBucket()));
                if (dir.exists() || (!dir.exists() && dir.mkdirs())) {
                    return SuccessTip.create(bucket);
                }
            }
        }
        return ErrorTip.create(BusinessCode.BadRequest);
    }

    @ApiOperation(value = "上传文件", response = FileInfo.class)
    @PostMapping("/api/fs/uploadfile")
    public Tip fileUpload(@RequestHeader(value = "authorization", required = false) String token,
                          @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false) String bucket,
                          @RequestPart("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new BusinessException(BusinessCode.BadRequest, "file is empty");
        }
        if (bucket == null) bucket = "";

        String originalFileName = file.getOriginalFilename();
        String extensionName = getExtensionName(originalFileName);

        if (!isPermittedFileType(extensionName)) {
            throw new BusinessException(BusinessCode.BadRequest, "NOT SUPPORTED file type");
        }

        String fileHost = getFileHost();
        Long fileSize = file.getSize();
        String fileName = UUID.randomUUID() + "." + extensionName;

        logger.info("============== upload start ===============");
        try {
            String fileSavePath = getFileUploadPath();

            // check bucket exists
            if (!StringUtils.isEmpty(bucket)) {
                File bucketFile = new File(String.join(File.separator, fileSavePath, bucket));
                Assert.isTrue(bucketFile.exists(), "bucket (X-FS-BUCKET) not exists: " + bucketFile.getPath());
            }

            File targetFile = new File(String.join(File.separator, fileSavePath, bucket, fileName));

            //boolean readable = target.setReadable(true);
            //if(readable){
            logger.info("file uploading to: {}", targetFile.getAbsolutePath());
            FileUtils.copyInputStreamToFile(file.getInputStream(), targetFile);
            logger.info("file uploaded to: {}", targetFile.getAbsolutePath());
            /*}else{
                throw new BusinessException(BusinessCode.UploadFileError, "file is not readable");
            }*/

            return SuccessTip.create(FileInfo.create(fileHost, fileName, extensionName, originalFileName, fileSize, targetFile.getAbsolutePath()));

        } catch (Exception e) {
            logger.info("============== exception {} ===============");
            logger.info(e.getMessage());
            logger.info(e.getLocalizedMessage());
            logger.info(e.toString());
            throw new BusinessException(BusinessCode.UploadFileError);
        }
    }

    /**
     * form-data 方式上传图片
     *
     * @param picture
     * @return
     */
    @ApiOperation(value = "multipart方式上传图片", response = FileInfo.class)
    @PostMapping("/api/fs/uploadx")
    @ResponseBody
    public Tip formUpload(@RequestHeader(value = "authorization", required = false) String token,
                          @RequestParam(name = "blur", defaultValue = "false") Boolean blur,
                          @RequestPart("file") MultipartFile picture) {
        String originalFileName = picture.getOriginalFilename();
        String extensionName = getExtensionName(originalFileName);
        String pictureName = UUID.randomUUID().toString() + "." + extensionName;
        String blurryName = "";
        try {
            String fileSavePath = getFileUploadPath();
            File target = new File(fileSavePath + pictureName);
            target.setReadable(true);
            FileUtils.copyInputStreamToFile(picture.getInputStream(), target);
            logger.info("file uploaded to: {}", target.getAbsolutePath());
            File reducedFile = ImageUtil.reduce(target);
            logger.info("file reduced to: {}", reducedFile.getAbsolutePath());
            pictureName = reducedFile.getName();
            if (blur) {
                File blurryFile = ImageUtil.reduce(ImageUtil.gaos(target));
                blurryFile.setReadable(true);
                blurryName = blurryFile.getName();
            }
        } catch (Exception e) {
            throw new BusinessException(BusinessCode.UploadFileError);
        }
        return SuccessTip.create(FileInfo.create(getFileHost(), pictureName, blurryName));
    }

    /**
     * 数据格式
     * data:image/jpeg;base64,/9j/4AAQSkZJRgABAQ
     *
     * @return
     * @throws IOException
     */
    @ApiOperation(value = "Base64格式上传图片", response = FileInfo.class)
    @PostMapping("/api/fs/upload64")
    @ResponseBody
    public Tip base64Upload(@RequestHeader(value = "authorization", required = false) String token,
                            @RequestParam(name = "blur", defaultValue = "false") Boolean blur, HttpServletRequest request) throws IOException {
        String base64Data = IOUtils.toString(request.getInputStream(), "UTF-8");
        if (StrKit.isBlank(base64Data)) {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        String dataPrix = "";
        String data = "";
        String[] d = base64Data.split("base64,");
        if (d != null && d.length == 2) {
            dataPrix = d[0];
            data = d[1];
        } else {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        String suffix = "";
        if ("data:image/jpeg;".equalsIgnoreCase(dataPrix)) {
            suffix = ".jpg";
        } else if ("data:image/x-icon;".equalsIgnoreCase(dataPrix)) {
            suffix = ".ico";
        } else if ("data:image/gif;".equalsIgnoreCase(dataPrix)) {
            suffix = ".gif";
        } else if ("data:image/png;".equalsIgnoreCase(dataPrix)) {
            suffix = ".png";
        } else {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        byte[] dataBytes = Base64Utils.decodeFromString(data);

        String pictureName = UUID.randomUUID().toString() + suffix;
        String blurryName = "";
        try {
            String fileSavePath = getFileUploadPath();
            File target = new File(fileSavePath, pictureName);
            target.setReadable(true);
            FileUtils.writeByteArrayToFile(target, dataBytes);
            logger.info("file uploaded to: {}", target.getAbsolutePath());
            File reducedFile = ImageUtil.reduce(target);
            logger.info("file reduced to: {}", reducedFile.getAbsolutePath());
            pictureName = reducedFile.getName();

            File thumbFile = thumb(reducedFile);
            logger.info("file thumb to: {}", thumbFile.getAbsoluteFile());

            if (blur) {
                File blurryFile = ImageUtil.reduce(ImageUtil.gaos(reducedFile));
                blurryFile.setReadable(true);
                blurryName = blurryFile.getName();

                File blurryThumbFile = thumb(blurryFile);
                logger.info("blurry file thumb to: {}", blurryThumbFile.getAbsoluteFile());
            }
        } catch (Exception ee) {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        return SuccessTip.create(FileInfo.create(getFileHost(), pictureName, blurryName));
    }


    @ApiOperation(value = "获取下载码", response = String.class, notes = "登陆后自动生成的一个下载码")
    @ApiParam(name = "name", value = "文件名称")
    @GetMapping("/api/fs/dlcode")
    public Tip getCode(@RequestParam String name) {
        String code = loadFileCodeService.genAndGetCode(name);
        return SuccessTip.create(code);
    }

    // @ApiOperation(value = "下载文件")
    @GetMapping("/api/pub/fs/loadfile")
    @ResponseBody
    public void loadFile(@RequestParam String name,
                         @RequestParam String code, HttpServletResponse response) throws IOException {
        if (loadFileCodeService.checkCode(code) == false) {
            throw new BusinessException(BusinessCode.BadRequest);
        }

        //获得rootPath
        String rootPath = getFileUploadPath();
        //拼接绝对路径(目录)
        String absolutePath = rootPath + name;
        //获得资源对象
        FileSystemResource fsr = new FileSystemResource(absolutePath);

        //输出文件
        final int buffInt = 1024;
        byte[] buff = new byte[buffInt];
        OutputStream os = null;
        BufferedInputStream bis = null;
        try { //NOSONAR
//            HttpServletResponse response = getHttpServletResponse();
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment; " + name);
            os = response.getOutputStream();
            bis = new BufferedInputStream(fsr.getInputStream());
            int i = bis.read(buff);
            while (i != -1) {
                os.write(buff, 0, buff.length);
                os.flush();
                i = bis.read(buff);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (bis != null) {
                bis.close();
            }
            if (os != null) {
                os.close();
            }
        }
    }

    private String getFileHost() {
        String fileHost = FSProperties.getFileHost();

        // TODO 租户
        /*String tenant = String tenant = JWTKit.getTenantId(getHttpServletRequest()) + "";;
        if (!fileHost.endsWith("/")) {
            host = host + "/" + tenant;
        } else {
            host = host + tenant;
        }*/
        return fileHost;
    }

    private String getFileUploadPath() {
        String fileSavePath = FSProperties.getFileUploadPath();
        //String uploadPath = fileSavePath;

        logger.info("fileSavePath:{}", fileSavePath);
        //logger.info("uploadPath:{}",uploadPath);

        // TODO 租户
        /*String tenant = JWTKit.getTenantId(getHttpServletRequest()) + "";
        if (!fileSavePath.endsWith(File.separator)) {
            uploadPath = uploadPath + File.separator + tenant + File.separator;
        } else {
            uploadPath = uploadPath + tenant + File.separator;
        }*/

        File file = new File(fileSavePath);
        if (!file.exists()) {
            file.mkdirs();
        }

        return fileSavePath;
    }

    public static String getExtensionName(String filename) {
        if (!StringUtils.isEmpty(filename)) {
            int dot = filename.lastIndexOf('.');
            if ((dot > -1) && (dot < (filename.length() - 1))) {
                return filename.substring(dot + 1);
            }
        }
        return filename;
    }

    private boolean isPermittedFileType(String fileType) {
        return PERMITTED_FILE_TYPE.contains(fileType.toLowerCase(Locale.ROOT));
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

    public static int[] getImgWidth(File file) throws IOException {
        InputStream is = null;
        BufferedImage src = null;
        int[] result = new int[]{0, 0};
        is = new FileInputStream(file);
        src = ImageIO.read(is);
        result[0] = src.getWidth((ImageObserver) null);
        result[1] = src.getHeight((ImageObserver) null);
        is.close();
        return result;
    }
}
