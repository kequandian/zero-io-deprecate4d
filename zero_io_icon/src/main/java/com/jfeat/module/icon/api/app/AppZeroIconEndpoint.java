package com.jfeat.module.icon.api.app;


import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.jfeat.am.common.annotation.Permission;
import com.jfeat.crud.base.annotation.BusinessLog;
import com.jfeat.crud.base.exception.BusinessCode;
import com.jfeat.crud.base.exception.BusinessException;
import com.jfeat.crud.base.tips.SuccessTip;
import com.jfeat.crud.base.tips.Tip;
import com.jfeat.fs.util.FileInfo;
import com.jfeat.module.icon.api.permission.ZeroIoIconPermission;
import com.jfeat.module.icon.properties.IconFileProperties;
import com.jfeat.module.icon.services.domain.dao.QueryZeroIoIconDao;
import com.jfeat.module.icon.services.domain.model.ZeroIoIconRecord;
import com.jfeat.module.icon.services.domain.service.ZeroIoIconService;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;
import com.jfeat.module.icon.util.FileUtil;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiImplicitParams;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.util.Assert;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.util.Date;
import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("/api/u/zero/icon")
public class AppZeroIconEndpoint {

    @Resource
    ZeroIoIconService zeroIoIconService;

    @Resource
    QueryZeroIoIconDao queryZeroIoIconDao;

    @Resource
    IconFileProperties iconFileProperties;


    private Logger logger = LoggerFactory.getLogger(AppZeroIconEndpoint.class);

    @PostMapping("/synIconInfo")
    public Tip synIconInfo() {
        return SuccessTip.create(zeroIoIconService.synFileInfoTODatabase());
    }


    @ApiOperation(value = "上传文件", response = FileInfo.class)
    @PostMapping("/fs/uploadfile")
    public Tip fileUpload(@RequestHeader(value = "authorization", required = false) String token,
                          @ApiParam("上传文件至不同的分组") @RequestHeader(value = "X-FS-BUCKET", required = false) String bucket,
                          @RequestPart("file") MultipartFile file) {
        if (file.isEmpty()) {
            throw new BusinessException(BusinessCode.BadRequest, "file is empty");
        }
        if (bucket == null) bucket = "";
        logger.info("============== upload start ===============");
        String originalFileName = file.getOriginalFilename();
        String extensionName = FilenameUtils.getExtension(originalFileName);
        if (extensionName != null) {
            if (extensionName.equals("html") || extensionName.equals("js") || extensionName.equals("htm")) {
                throw new BusinessException(BusinessCode.BadRequest, "文件类型有误 不能为：" + extensionName + "类型的文件");
            }
        }
        String fileHost = iconFileProperties.getFileIconHost();
        Long fileSize = file.getSize();
        String fileName = UUID.randomUUID() + "." + extensionName;

        try {
            String fileSavePath = iconFileProperties.getFileIconUploadPath();
            {
                File fileSaveFile = new File(fileSavePath);
                if (!fileSaveFile.exists()) {
                    fileSaveFile.mkdirs();
                }
            }

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

            // get relative path
            String relativePath = targetFile.getAbsolutePath().substring(new File("./").getAbsolutePath().length() - 1);

            FileInfo fileInfo =  FileInfo.create(fileHost, bucket, fileName, extensionName, originalFileName, fileSize, relativePath);

//            添加数据库
            ZeroIoIcon zeroIoIcon = new ZeroIoIcon();
            zeroIoIcon.setPath(fileInfo.getUrl());
            zeroIoIcon.setName(fileInfo.getName());
            zeroIoIcon.setCheckSum(FileUtil.md5HashCode32(new FileInputStream(targetFile)));
            zeroIoIconService.createMaster(zeroIoIcon);

            return SuccessTip.create(fileInfo);

        } catch (Exception e) {
            logger.info("============== exception {} ===============");
            logger.info(e.getMessage());
            logger.info(e.getLocalizedMessage());
            logger.info(e.toString());
            throw new BusinessException(BusinessCode.UploadFileError);
        }
    }


    @GetMapping("/{id}")
    @ApiOperation(value = "查看 ZeroIoIcon", response = ZeroIoIcon.class)
    public Tip getZeroIoIcon(@PathVariable Long id) {
        return SuccessTip.create(zeroIoIconService.queryMasterModel(queryZeroIoIconDao, id));
    }


    @PutMapping("/{id}")
    @ApiOperation(value = "修改 ZeroIoIcon", response = ZeroIoIcon.class)
    public Tip updateZeroIoIcon(@PathVariable Long id, @RequestBody ZeroIoIcon entity) {
        entity.setId(id);
        return SuccessTip.create(zeroIoIconService.updateMaster(entity));
    }

    @BusinessLog(name = "ZeroIoIcon", value = "delete ZeroIoIcon")
    @DeleteMapping("/{id}")
    @ApiOperation("删除 ZeroIoIcon")
    public Tip deleteZeroIoIcon(@PathVariable Long id) {
        return SuccessTip.create(zeroIoIconService.deleteFile(id));
    }


    @ApiOperation(value = "ZeroIoIcon 列表信息", response = ZeroIoIconRecord.class)
    @GetMapping
    @ApiImplicitParams({
            @ApiImplicitParam(name = "pageNum", dataType = "Integer"),
            @ApiImplicitParam(name = "pageSize", dataType = "Integer"),
            @ApiImplicitParam(name = "search", dataType = "String"),
            @ApiImplicitParam(name = "id", dataType = "Long"),
            @ApiImplicitParam(name = "name", dataType = "String"),
            @ApiImplicitParam(name = "title", dataType = "String"),
            @ApiImplicitParam(name = "note", dataType = "String"),
            @ApiImplicitParam(name = "path", dataType = "String"),
            @ApiImplicitParam(name = "checkSum", dataType = "String"),
            @ApiImplicitParam(name = "flag", dataType = "Integer"),
            @ApiImplicitParam(name = "createTime", dataType = "Date"),
            @ApiImplicitParam(name = "updateTime", dataType = "Date"),
            @ApiImplicitParam(name = "orderBy", dataType = "String"),
            @ApiImplicitParam(name = "sort", dataType = "String")
    })
    public Tip queryZeroIoIconPage(Page<ZeroIoIconRecord> page,
                                   @RequestParam(name = "pageNum", required = false, defaultValue = "1") Integer pageNum,
                                   @RequestParam(name = "pageSize", required = false, defaultValue = "10") Integer pageSize,
                                   // for tag feature query
                                   @RequestParam(name = "tag", required = false) String tag,
                                   // end tag
                                   @RequestParam(name = "search", required = false) String search,

                                   @RequestParam(name = "name", required = false) String name,

                                   @RequestParam(name = "title", required = false) String title,

                                   @RequestParam(name = "note", required = false) String note,

                                   @RequestParam(name = "path", required = false) String path,

                                   @RequestParam(name = "checkSum", required = false) String checkSum,

                                   @RequestParam(name = "flag", required = false) Integer flag,

                                   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                                   @RequestParam(name = "createTime", required = false) Date createTime,

                                   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
                                   @RequestParam(name = "updateTime", required = false) Date updateTime,
                                   @RequestParam(name = "orderBy", required = false) String orderBy,
                                   @RequestParam(name = "sort", required = false) String sort) {

        if (orderBy != null && orderBy.length() > 0) {
            if (sort != null && sort.length() > 0) {
                String sortPattern = "(ASC|DESC|asc|desc)";
                if (!sort.matches(sortPattern)) {
                    throw new BusinessException(BusinessCode.BadRequest.getCode(), "sort must be ASC or DESC");//此处异常类型根据实际情况而定
                }
            } else {
                sort = "ASC";
            }
            orderBy = "`" + orderBy + "`" + " " + sort;
        }
        page.setCurrent(pageNum);
        page.setSize(pageSize);

        ZeroIoIconRecord record = new ZeroIoIconRecord();
        record.setName(name);
        record.setTitle(title);
        record.setNote(note);
        record.setPath(path);
        record.setCheckSum(checkSum);
        record.setFlag(flag);
        record.setCreateTime(createTime);
        record.setUpdateTime(updateTime);
        List<ZeroIoIconRecord> zeroIoIconPage = queryZeroIoIconDao.findZeroIoIconPage(page, record, tag, search, orderBy, null, null);
        page.setRecords(zeroIoIconPage);
        return SuccessTip.create(page);
    }
}
