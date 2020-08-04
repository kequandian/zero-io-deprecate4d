package com.jfeat.pdf.services.gen.crud.service.impl;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.jfeat.crud.plus.impl.CRUDServiceOnlyImpl;
import com.jfeat.pdf.services.gen.crud.service.CRUDPdfTableService;
import com.jfeat.pdf.services.gen.persistence.dao.PdfTableMapper;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * <p>
 *  implementation
 * </p>
 *CRUDPdfTableService
 * @author Code Generator
 * @since 2020-03-13
 */

@Service
public class CRUDPdfTableServiceImpl  extends CRUDServiceOnlyImpl<PdfTable> implements CRUDPdfTableService {





        @Resource
        protected PdfTableMapper pdfTableMapper;

        @Override
        protected BaseMapper<PdfTable> getMasterMapper() {
                return pdfTableMapper;
        }







}


