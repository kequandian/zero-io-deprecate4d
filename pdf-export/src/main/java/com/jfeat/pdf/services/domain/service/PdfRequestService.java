package com.jfeat.pdf.services.domain.service;

import com.alibaba.fastjson.JSONObject;

/**
 * Created on 2020/4/10.
 *
 * @author Wen Hao
 */
public interface PdfRequestService {

    JSONObject getApiRequest(JSONObject apiData);

    JSONObject getStatisticsRequest(String field, JSONObject template);
}
