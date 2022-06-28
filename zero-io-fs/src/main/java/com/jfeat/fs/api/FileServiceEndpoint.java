package com.jfeat.fs.api;

import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.ErrorTip;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.util.StrKit;
import com.jfeat.fs.model.Bucket;
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
import org.springframework.util.Assert;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Objects;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

    @Autowired
    FSProperties FSProperties;

    @Autowired
    LoadFileCodeService loadFileCodeService;

    @ApiOperation(value = "创建存储桶", response = String.class, notes = "根据Token中的APPID创建对应的存储桶")
    @ApiParam(name = "name", value = "存储桶名称")
    @PostMapping("/api/fs/buckets")
    public Tip generateBucket(@RequestBody Bucket bucket) {
        if (Objects.nonNull(bucket)) {
            // 校验APP-ID / APP-KEY
            if (!FSProperties.getBucketAppId().equals(bucket.getAppId()) || ! FSProperties.getBucketAppSecret().equals(bucket.getAppSecret())) {
                return ErrorTip.create(BusinessCode.AuthorizationError);
            }

            // 获取APP-ID用于创建对应的APP目录
            String appId = FSProperties.getBucketAppId();
            // 获取常规保存路径
            String savePath = FSProperties.getFileUploadPath();
            File file = new File(savePath);
            if (!file.exists()) {
                file.mkdirs();
            }

            if (!StringUtils.isEmpty(bucket.getBucket())) {
                // 创建Bucket路径
                File dir = new File(String.join(File.separator, savePath, bucket.getBucket()));

                if (dir.exists() || (!dir.exists() && dir.mkdirs())) {
                    // return relative path
                    String relativePath = dir.getAbsolutePath().substring(new File("./").getAbsolutePath().length()-1);
                    return SuccessTip.create(relativePath);
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
            throw new BusinessException(BusinessCode.BadRequest,  "file is empty");
        }
        if(bucket==null) bucket="";
        logger.info("============== upload start ===============");
        String originalFileName = file.getOriginalFilename();
        String extensionName = FilenameUtils.getExtension(originalFileName);
        if(extensionName != null){
            if(extensionName.equals("html")||extensionName.equals("js")||extensionName.equals("htm")){
                throw new BusinessException(BusinessCode.BadRequest,  "文件类型有误 不能为：" + extensionName +"类型的文件");
            }
        }
        String fileHost = FSProperties.getFileHost();
        Long fileSize = file.getSize();
        String fileName = UUID.randomUUID() + "." + extensionName;

        try {
            String fileSavePath = FSProperties.getFileUploadPath();
            {
                File fileSaveFile = new File(fileSavePath);
                if (!fileSaveFile.exists()) {
                    fileSaveFile.mkdirs();
                }
            }

            // check bucket exists
            if(!StringUtils.isEmpty(bucket)){
                File bucketFile = new File(String.join(File.separator, fileSavePath, bucket));
                Assert.isTrue(bucketFile.exists(), "bucket (X-FS-BUCKET) not exists: " + bucketFile.getPath() );
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

            // get relative path
            String relativePath = targetFile.getAbsolutePath().substring(new File("./").getAbsolutePath().length()-1);
            return SuccessTip.create(FileInfo.create(fileHost, bucket, fileName, extensionName, originalFileName, fileSize, relativePath));

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
        String extensionName = FilenameUtils.getExtension(originalFileName);
        String pictureName = UUID.randomUUID().toString() + "." + extensionName;
        String blurryName = "";
        try {
            String fileSavePath = FSProperties.getFileUploadPath();
            {
                File fileSaveFile = new File(fileSavePath);
                if (!fileSaveFile.exists()) {
                    fileSaveFile.mkdirs();
                }
            }

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
        return SuccessTip.create(FileInfo.create(FSProperties.getFileHost(), pictureName, blurryName));
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
            String fileSavePath = FSProperties.getFileUploadPath();
            {
                File fileSaveFile = new File(fileSavePath);
                if (!fileSaveFile.exists()) {
                    fileSaveFile.mkdirs();
                }
            }

            File target = new File(fileSavePath, pictureName);
            target.setReadable(true);
            FileUtils.writeByteArrayToFile(target, dataBytes);
            logger.info("file uploaded to: {}", target.getAbsolutePath());
            File reducedFile = ImageUtil.reduce(target);
            logger.info("file reduced to: {}", reducedFile.getAbsolutePath());
            pictureName = reducedFile.getName();

            File thumbFile = ImageUtil.thumb(reducedFile);
            logger.info("file thumb to: {}", thumbFile.getAbsoluteFile());

            if (blur) {
                File blurryFile = ImageUtil.reduce(ImageUtil.gaos(reducedFile));
                blurryFile.setReadable(true);
                blurryName = blurryFile.getName();

                File blurryThumbFile = ImageUtil.thumb(blurryFile);
                logger.info("blurry file thumb to: {}", blurryThumbFile.getAbsoluteFile());
            }
        } catch (Exception ee) {
            throw new BusinessException(BusinessCode.UploadFileError);
        }

        return SuccessTip.create(FileInfo.create(FSProperties.getFileHost(), pictureName, blurryName));
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
        String rootPath = FSProperties.getFileUploadPath();
        {
            File fileSaveFile = new File(rootPath);
            if (!fileSaveFile.exists()) {
                fileSaveFile.mkdirs();
            }
        }

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
}
