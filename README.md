# 用法说明

### 导入 Excel
source为文件地址, target中有一个list类型的colums, 单表服务时， list中只有一个数据；多表时有多个;

```java
{
    "level": 1,    // 1 为单表导入， 2 为多表导入  （需前端指定）
    "duplicate": 1, //是否允许添加与数据库中完全相同的数据，1允许存在完全相同数据，0为不允许
    "unique":  //是否为相应的表添加唯一索引，空值为不添加
     [  
       {
          "table": "table_name" //添加唯一索引的表
          "fields":["name"], //添加唯一索引的字段
       }
    ], 
    "source": "/pathto/商家信息.xlsx", 
    "target": {
        "columns": 
          [   //文件中所涉及的表，一张表为一个对象
            {
                "fields": ["field1","field2"], //表中的字段
                "table": "table_name"   //表名
            }
         ]
    }
}

```

### 如何输出打印PDF/Excel
```java
@GetMapping("/io/excel/out")
    @ResponseBody
    public void exportExcelFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*static {
            // permit table to be exported
            ExporterParameters.me().permitTable("user");
        }*/
        new IOExportApiUtil().export(request, response);
}


Interface IOExportApiUtil {
     int export(HttpServletRequest request, HttpServletResponse response) throws IOException;
}


public int export(HttpServletRequest request, HttpServletResponse response) throws IOException {

        /// get parameters
        /*Map<String, String[]> parameterMap = request.getParameterMap();
        Map<String, String> queries = new LinkedHashMap<>();
        if (parameterMap != null) {
            for (Map.Entry<String, String[]> entry : parameterMap.entrySet()) {
                if (entry.getValue() != null && entry.getValue().length > 0) {
                    queries.put(entry.getKey(), entry.getValue()[0]);
                }
            }
       }*/

       int success = 0;

       OutputStream os = null;
       try {
           String  fileName = getExportFileName();
            response.setContentType("application/octet-stream");
            response.addHeader("Content-Disposition", "attachment; fileName=" + fileName + ".pdf");
            os = response.getOutputStream();

       } catch (Exception e) {
            e.printStackTrace();
       } finally {
            if (os != null) {
                os.close();
            }
      }

        success = Math.max(1, success);
        return success;
}

public String getExportFileName(){
    // get file name via timestamp or specific name
}
```
