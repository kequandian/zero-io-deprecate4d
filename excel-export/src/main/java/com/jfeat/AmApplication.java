package com.jfeat;

import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created on 2020/4/27.
 *
 * @author Wen Hao
 */
@SpringBootApplication
@RestController
@Slf4j
public class AmApplication {

    protected final static Logger logger = LoggerFactory.getLogger(AmApplication.class);

//    @Autowired
//    ExcelProperties excelProperties;
//
//    @GetMapping("/test")
//    public void getTest(HttpServletRequest request, HttpServletResponse response) throws IOException {
//        log.info("excelProperties : {}", excelProperties);
//
//        String templateDirectory = excelProperties.getTemplateDirectory();
//        String templateName = excelProperties.getExport().get("test").getTemplateName();
////        templateDirectory = "excel-templates/template.xlsx";
//        templateDirectory = templateDirectory + "/" + templateName;
//        log.info("templateName: {}", templateDirectory);
//        TemplateExportParams params = new TemplateExportParams(templateDirectory);
//        Map<String, Object> map = new HashMap<>();
//
//        List<Map<String, String>> listMap = new ArrayList<>();
//        for (int i = 0; i < 4; i++) {
//            Map<String, String> lm = new HashMap<>();
//            lm.put("id", i + 1 + "");
//            lm.put("name", "A00" + i + "");
//            lm.put("desc", i * 10000 + "");
//            listMap.add(lm);
//        }
//        log.info("malList: {}", listMap);
//        map.put("mapList", listMap);
//        Workbook workbook = ExcelExportUtil.exportExcel(params, map);
//
//
//        ByteArrayOutputStream baos = new ByteArrayOutputStream();
//        workbook.write(baos);
//        response.setContentType("application/octet-stream");
//        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", "test"));
//        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
//        response.getOutputStream().write(baos.toByteArray());
//    }


    public static void main(String[] args) {
        SpringApplication.run(AmApplication.class, args);
        logger.info("AmApplication is running success");
    }

}