package com.jfeat.am.module.cinema.services.domain.filter;

import com.jfeat.crud.plus.CRUDFilter;
import com.jfeat.am.module.cinema.services.gen.persistence.model.Advertiser;


/**
 * Created by Code generator on 2020-09-10
 */
public class AdvertiserFilter implements CRUDFilter<Advertiser> {

    private String[] ignoreFields = new String[]{};
    private String[] updateIgnoreFields = new String[]{};

    @Override
    public void filter(Advertiser entity, boolean insertOrUpdate) {

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
