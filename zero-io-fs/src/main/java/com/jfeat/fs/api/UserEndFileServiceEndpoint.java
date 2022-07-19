package com.jfeat.fs.api;

import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.util.StrKit;
import com.jfeat.fs.properties.FSProperties;
import com.jfeat.fs.util.FileInfo;
import com.jfeat.fs.util.ImageUtil;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.Assert;
import org.springframework.util.Base64Utils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

/**
 * Created by vincent on 2022/1/8.
 */
@Api(value = "Service")
@RestController
public class UserEndFileServiceEndpoint {

    protected final static Logger logger = LoggerFactory.getLogger(UserEndFileServiceEndpoint.class);

    @Autowired
    FSProperties FSProperties;

    @ApiOperation(value = "上传文件", response = FileInfo.class)
    @PostMapping("/api/u/fs/uploadfile")
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
            if(extensionName.equals("exe")||extensionName.equals("java")||extensionName.equals("jsp")||extensionName.equals("php")||extensionName.equals("asp")){
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
     * 数据格式
     * data:image/jpeg;base64,/9j/4AAQSkZJRgABAQ
     *
     * @return
     * @throws IOException
     */
    @ApiOperation(value = "Base64格式上传图片", response = FileInfo.class)
    @PostMapping("/api/u/fs/upload64")
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
}
