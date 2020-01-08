# 用法说明

### 导出Excel/Pdf

####  Excel API 
> /api/io/excel/{field}
```java
@GetMapping(value = "/{field}")
    public void exportExcelFile(@PathVariable String field, HttpServletRequest request,HttpServletResponse response) throws IOException {
        Map<String, String[]> parameterMap = request.getParameterMap();
        logger.info("parameterMap --> {}", toPrintMap(parameterMap));
        response.setContentType("application/octet-stream");
        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, String.format("attachment; filename=%s.xlsx", field));
        response.setHeader(HttpHeaders.ACCESS_CONTROL_EXPOSE_HEADERS, HttpHeaders.CONTENT_DISPOSITION);
        response.getOutputStream().write(excelService.exportExcelFile(field, parameterMap).readAllBytes());

    }
```
####  Pdf API 
> /api/io/pdf/

### docker-compose
```yaml
  mall-io:
    container_name: mall-io
    image: 'app-openjre11:dev'
    volumes:
       - /etc/localtime:/etc/localtime:ro
       - ./mall-io:/webapps
    environment:
      TZ: "Asia/Shanghai"
      URL_SHORT: mall-mysql:3306/alliance
      USERNAME: root
      PASSWORD: root
```