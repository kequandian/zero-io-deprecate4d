package com.jfeat.fs.api;

import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.crud.base.util.StrKit;
import com.jfeat.fs.properties.FSProperties;
import com.jfeat.fs.service.LoadFileCodeService;
import com.jfeat.fs.model.FileInfo;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

/**
 * Created by jackyhuang on 2017/7/4.
 * appid and bucket must be prepared during deploy
 */
@Api(value = "fs-upload")
@RestController
public class FileServiceEndpoint {

    protected final static Logger logger = LoggerFactory.getLogger(FileServiceEndpoint.class);

    @Autowired
    FSProperties FSProperties;

    @Autowired
    LoadFileCodeService loadFileCodeService;

    @ApiOperation(value = "上传文件", response = FileInfo.class)
    @PostMapping("/api/fs/uploadfile")
    public Tip fileUpload(@RequestHeader(value = "authorization", required = false) String token,
                          @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false, defaultValue = "") String bucket,
                          @ApiParam("不同应用上传文件至独立目录") @RequestHeader(value = "X-FS-APPID", required = false, defaultValue = "") String appid,
                          @RequestPart("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new BusinessException(BusinessCode.BadRequest, "file is empty");
        }
        String fileHost = FSProperties.getFileHost();
        String fileSavePath = FSProperties.getFileUploadPath();

        try {
            logger.info("============== upload start ===============");
            FileInfo fileInfo = loadFileCodeService.uploadFile(file, fileSavePath, bucket, appid, fileHost);
            return SuccessTip.create(fileInfo);

        } catch (Exception e) {
            logger.info("============== exception {} ===============");
            logger.info(e.getMessage());
            logger.info(e.getLocalizedMessage());
//            logger.info(e.toString());
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
    @PostMapping("/api/fs/upload64")
    @ResponseBody
    public Tip base64Upload(@RequestHeader(value = "authorization", required = false) String token,
                            @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false, defaultValue = "") String bucket,
                            @ApiParam("不同应用上传文件至独立目录") @RequestHeader(value = "X-FS-APPID", required = false, defaultValue = "") String appid,
                            @RequestParam(name = "blur", defaultValue = "false") Boolean blur, HttpServletRequest request) throws IOException {

        String base64Data = IOUtils.toString(request.getInputStream(), "UTF-8");
        if (StrKit.isBlank(base64Data)) {
            throw new BusinessException(BusinessCode.UploadFileError);
        }
        String fileHost = FSProperties.getFileHost();
        String fileSavePath = FSProperties.getFileUploadPath();

        try {
            logger.info("============== upload start ===============");
            FileInfo fileInfo = loadFileCodeService.upload64(base64Data, blur, fileSavePath, bucket, appid, fileHost);
            return SuccessTip.create(fileInfo);

        } catch (Exception e) {
            logger.info("============== exception {} ===============");
            logger.info(e.getMessage());
            logger.info(e.getLocalizedMessage());
            throw new BusinessException(BusinessCode.UploadFileError);
        }
    }


//    /**
//     * form-data 方式上传图片
//     *
//     * @param picture
//     * @return
//     */
//    @ApiOperation(value = "multipart方式上传图片", response = FileInfo.class)
//    @PostMapping("/api/fs/uploadx")
//    @ResponseBody
//    public Tip formUpload(@RequestHeader(value = "authorization", required = false) String token,
//                          @RequestParam(name = "blur", defaultValue = "false") Boolean blur,
//                          @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false) String bucket,
//                          @ApiParam("不同应用上传文件至独立目录") @RequestHeader(value = "X-FS-APPID", required = false) String appid,
//                          @RequestPart("file") MultipartFile picture) {
//        if (picture.isEmpty()) {
//            throw new BusinessException(BusinessCode.BadRequest, "picture is empty");
//        }
//
//        String originalFileName = picture.getOriginalFilename();
//        String extensionName = FilenameUtils.getExtension(originalFileName);
//        String pictureName = UUID.randomUUID().toString() + "." + extensionName;
//        String blurryName = "";
//        try {
//            String fileSavePath = FSProperties.getFileUploadPath();
//            {
//                File fileSaveFile = new File(fileSavePath);
//                if (!fileSaveFile.exists()) {
//                    fileSaveFile.mkdirs();
//                }
//            }
//
//            File target = new File(fileSavePath + pictureName);
//            target.setReadable(true);
//            FileUtils.copyInputStreamToFile(picture.getInputStream(), target);
//            logger.info("file uploaded to: {}", target.getAbsolutePath());
//            File reducedFile = ImageUtil.reduce(target);
//            logger.info("file reduced to: {}", reducedFile.getAbsolutePath());
//            pictureName = reducedFile.getName();
//            if (blur) {
//                File blurryFile = ImageUtil.reduce(ImageUtil.gaos(target));
//                blurryFile.setReadable(true);
//                blurryName = blurryFile.getName();
//            }
//            return SuccessTip.create(FileInfo.create(FSProperties.getFileHost(), pictureName, blurryName));
//
//        } catch (Exception e) {
//            logger.info("============== exception {} ===============");
//            logger.info(e.getMessage());
//            logger.info(e.getLocalizedMessage());
//            throw new BusinessException(BusinessCode.UploadFileError);
//        }
//    }

}
