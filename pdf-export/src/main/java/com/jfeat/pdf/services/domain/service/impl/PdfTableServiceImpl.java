package com.jfeat.pdf.services.domain.service.impl;

import com.jfeat.pdf.services.domain.service.PdfTableService;
import com.jfeat.pdf.services.gen.crud.service.impl.CRUDPdfTableServiceImpl;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author admin
 * @since 2017-10-16
 */
@Service("pdfTableService")
public class PdfTableServiceImpl extends CRUDPdfTableServiceImpl implements PdfTableService {
    @Override
    public PdfTable findByName(String tableName) {
        return this.pdfTableMapper.selectOne(new PdfTable().setName(tableName));
    }
}