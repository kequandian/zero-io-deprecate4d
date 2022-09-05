package com.jfeat.pdf.services.domain.filter;

import com.jfeat.crud.plus.CRUDFilter;
import com.jfeat.pdf.services.gen.persistence.model.PdfTable;


/**
 * Created by Code Generator on 2020-03-13
 */
public class PdfTableFilter implements CRUDFilter<PdfTable> {

    private String[] ignoreFields = new String[]{};
    private String[] updateIgnoreFields = new String[]{};

    @Override
    public void filter(PdfTable entity, boolean insertOrUpdate) {

        //if insertOrUpdate is true,means for insert, do this
        if (insertOrUpdate) {

            //then insertOrUpdate is false,means for update,do this
        } else {

        }

    }

    @Override
    public String[] ignore(boolean retrieveOrUpdate) {
        //if retrieveOrUpdate is true,means for retrieve ,do this
        if (retrieveOrUpdate) {
            return ignoreFields;
            //then retrieveOrUpdate  if false ,means for update,do this
        } else {
            return updateIgnoreFields;
        }
    }
}
