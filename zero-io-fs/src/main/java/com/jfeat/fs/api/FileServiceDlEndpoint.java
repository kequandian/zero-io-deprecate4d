package com.jfeat.fs.api;

import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.ErrorTip;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.fs.model.Bucket;
import com.jfeat.fs.properties.FSProperties;
import com.jfeat.fs.service.LoadFileCodeService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.io.BufferedInputStream;
import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Objects;

@Api(value = "fs-download")
@RestController
public class FileServiceDlEndpoint {

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
            if (!FSProperties.getBucketAppId().equals(bucket.getAppId()) || !FSProperties.getBucketAppSecret().equals(bucket.getAppSecret())) {
                return ErrorTip.create(BusinessCode.AuthorizationError);
            }

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
                    String relativePath = dir.getAbsolutePath().substring(new File("./").getAbsolutePath().length() - 1);
                    return SuccessTip.create(relativePath);
                }
            }
        }
        return ErrorTip.create(BusinessCode.BadRequest);
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
    public void loadFile(@ApiParam("文件名称（包括后缀）") @RequestParam String name,
                         @ApiParam("下载码") @RequestParam String code,
                         @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false, defaultValue = "") String bucket,
                         @ApiParam("不同应用上传文件至独立目录") @RequestHeader(value = "X-FS-APPID", required = false, defaultValue = "") String appid,
                         HttpServletResponse response) throws IOException {
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

        //拼接绝对路径
        String currentYear = new SimpleDateFormat("yyyy").format(new Date());
        String absolutePath1 = String.join(File.separator, rootPath, bucket, appid, name);
        String absolutePath2 = String.join(File.separator, rootPath, bucket, appid, currentYear, name);
        Assert.isTrue(new File(absolutePath1).exists() || new File(absolutePath2).exists(), absolutePath1 + " not exists!" );

        String absolutePath = new File(absolutePath1).exists() ? absolutePath1 : absolutePath2;

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
