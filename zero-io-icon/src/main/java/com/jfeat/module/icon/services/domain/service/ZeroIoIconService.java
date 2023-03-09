package com.jfeat.module.icon.services.domain.service;

import com.jfeat.module.icon.services.gen.crud.service.CRUDZeroIoIconService;
import com.jfeat.module.icon.services.gen.persistence.model.ZeroIoIcon;

import java.util.List;

/**
 * Created by vincent on 2017/10/19.
 */
public interface ZeroIoIconService extends CRUDZeroIoIconService {

    List<ZeroIoIcon> getFileInfo();

    Integer synFileInfoTODatabase();

    Integer deleteFile(Long id);
}