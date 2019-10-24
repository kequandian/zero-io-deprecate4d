# 用法说明

### 导入 Excel
source为文件地址, target中有一个list类型的colums, 单表服务时， list中只有一个数据；多表时有多个;

```java
{
    "level": 0,//1 为单表导入， 2 为多表导入  （需前端指定）
    "duplicate": 0,//是否允许添加与数据库中完全相同的数据，1允许存在完全相同数据，0为不允许
    "header": 0,//excel是否有表头0是没有，1是有
    "overwrite": 0,//对导入复复项，是否重写, 默认重复导入可更新
    "relationOnly": 0,//是否仅建立多表关系，仅用于多表关联，跳过查入检查时间
    "source": "string",
    "target": [ //导入到数据库的表目的字段,支持多数据库导入
        {
            "fields": [  //数据导入对应的字段
                "username",
                "name",
                "sex"
            ],
            "table": "user",//表名
        }
    ],
    "unique": [ //是否为相应的表添加唯一索引，空值为不添加
        {
            "fields": [ //组成唯一索引的字段
                "username"//以用户名作为唯一索引
            ],
            "table": "user",//表名
        }
    ],
    "notnull": [//对于Excel表没有的字段，但数据库又是必填字段，即需要定义notnull字段对其进行实始化
        {
            "fields": [//不能为空的字段名
                "username"，
                "name",
                "sex"
            ],
            "table": "user",//表名
            "values": [//不能为空的值需要的默认值
                "1001"，
                "蔡徐坤"，
                "男"
            ]
        }
    ],
    "convert": [ //需要根据值转换为另一个值，如excel中的性别男要转变为0，女变为1
        {
            "field": "sex",//需要转换的字段名
            "newValue": "0",//转换后的值
            "oldValue": "男",//转换前的值
            "table": "user"//表名
        }
    ],
    "relation": [
        {
            "groupKeyField": "string",
            "keyField": "string",
            "multiLevel": {
                "columns": [
                    0
                ],
                "field": "string",
                "relativeField": "string",
                "table": "string"
            },
            "peerKeyField": "string",
            "peerTable": "string",
            "relation": "string",
            "relativeKeyField": "string",
            "relativePeerKeyField": "string",
            "relativeTable": "string",
            "table": "string"
        }
    ]
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

### Excel导入导出代码参考
```java
@RestController
@RequestMapping("/api")
public class ClientExcelEndpoint extends BaseController {

    @Resource
    UserService userService;

    @GetMapping("/pub/export/customer/export/template")
    @Permission(ClientPermission.CLIENT_VIEW)
    @ResponseBody
    public void exportExcelFile(HttpServletRequest request, HttpServletResponse response) throws IOException {
        /*static {
            // permit table to be exported
            ExporterParameters.me().permitTable("user");
        }*/
        String sql = "SELECT '' AS '姓名','' AS '创建时间','' AS '性别','' AS '生日','' AS '座机','' AS '手机','' AS '邮箱','' AS '传真','' AS '称呼','' AS '地区：国家','' AS '地区：省/州','' AS '地区：城市','' AS '地区：区/县','' AS '职位','' AS '客户来源','' AS '客户阶段','' AS '公司','' AS '行业：一级行业','' AS '行业：二级行业','' AS '标签','' AS '网址','' AS '地址','' AS 'QQ','' AS '跟进人','' AS '部门','' AS '备注','' AS '资料来源'";
        new PoiAgentExporterApiUtil().export(sql, response);
    }

    @GetMapping("/pub/export/customer/export/data")
    @Permission(ClientPermission.CLIENT_VIEW)
    @ResponseBody
    public void exportExcelFile1(HttpServletRequest request, HttpServletResponse response) throws IOException {


        /*static {
            // permit table to be exported
            ExporterParameters.me().permitTable("user");
        }*/
        String followUp = request.getParameter("followUp");
        String deptName = request.getParameter("deptName");
        String startTime = request.getParameter("startTime");
        String endTime = request.getParameter("endTime");

        StringBuilder baseSql = new StringBuilder("SELECT\n" +
                "\tcl_client_record.client_name AS '姓名',\n" +
                "\tDATE_FORMAT(\n" +
                "\t\tcl_client_record.create_time,\n" +
                "\t\t'%m-%d-%Y %T'\n" +
                "\t) AS '创建时间',\n" +
                "\tCASE cl_client_record.sex\n" +
                "WHEN 0 THEN\n" +
                "\t'男'\n" +
                "WHEN 1 THEN\n" +
                "\t'女'\n" +
                "ELSE\n" +
                "\t'--'\n" +
                "END AS '性别',\n" +
                " DATE_FORMAT(\n" +
                "\tcl_client_record.birthday,\n" +
                "\t'%m-%d-%Y'\n" +
                ") AS '生日',\n" +
                " cl_client_record.fphone AS '座机',\n" +
                " cl_client_record.phone AS '手机',\n" +
                " cl_client_record.email AS '邮箱',\n" +
                " cl_client_record.fax AS '传真',\n" +
                " cl_client_record.nickname AS '称呼',\n" +
                " cl_client_record.country AS '地区：国家',\n" +
                " cl_client_record.province AS '地区：省/州',\n" +
                " cl_client_record.city AS '地区：城市',\n" +
                " cl_client_record.district AS '地区：区/县',\n" +
                " cl_client_record.position AS '职位',\n" +
                " cl_client_record.source AS '客户来源',\n" +
                " cl_client_record.`status` AS '客户阶段',\n" +
                " cl_client_record.com_name AS '公司',\n" +
                " cl_client_record.com_industry AS '行业：一级行业',\n" +
                " cl_client_record.com_second_industry AS '行业：二级行业',\n" +
                " cl_client_record.com_site AS '网址',\n" +
                " cl_client_record.com_address AS '地址',\n" +
                " cl_client_record.qq AS 'QQ',\n" +
                " cl_client_record.follow_up AS '跟进人',\n" +
                " t_department.`name` AS '跟进人部门',\n" +
                " cl_client_record.status_running AS '合同执行阶段',\n" +
                " cl_client_record.remark AS '备注'\n" +
                "FROM\n" +
                "\tcl_client_record\n" +
                "LEFT JOIN t_staff ON t_staff.id = cl_client_record.follow_id\n" +
                "LEFT JOIN t_department ON t_department.id = t_staff.dept_id\n" +
                "WHERE 1=1");
        if (StrKit.notBlank(followUp)){
            baseSql.append(" AND cl_client_record.follow_up LIKE '%" + followUp + "%'");
        }
        if (StrKit.notBlank(deptName)){
            baseSql.append(" AND t_department.`name` = '" + deptName + "'");
        }
        if (StrKit.notBlank(startTime) && StrKit.notBlank(endTime)){
            baseSql.append(" AND cl_client_record.create_time BETWEEN " + "'" + startTime + "'" + " AND " + "'" + endTime + "'");
        }
        System.out.println("测试" + baseSql);


        new PoiAgentExporterApiUtil().export(baseSql.toString(), response);
    }

    @PostMapping("/pub/import/customer")
    @Permission(ClientPermission.CLIENT_EDIT)
    public void importExcel(@RequestBody Source source) throws SQLException {
        final String clientTable = "cl_client_record";
        final String staffTable = "t_staff";

        PoiAgentImporterRequest request = new PoiAgentImporterRequest();

        request.setLevel(2);
        request.setDuplicate(0);    /// 未指定unique的情况下，是否允许有完本重复项
        request.setHeader(1);       /// 导入的excel 是否有表头， 通常有表头
        request.setOverwrite(1);    /// 对重复项是否覆盖 (skip update)

        // not null
        request.notnull(clientTable,ClientRecord.STAT,1);
        request.notnull(clientTable, ClientRecord.FOLLOW_ID, 0);

        // relation
        /// 跟进人客户一对多关系 masterTable=staff, keyField=id, relativeTable=client_record, relativeKeyField=follow_id
        request.relationMany(staffTable, "id", clientTable, "follow_id");

        /// target
        request.target(clientTable, ClientRecord.CLIENT_NAME);  //姓名
        request.target(clientTable, ClientRecord.CREATE_TIME);  //创建时间
        request.target(clientTable, ClientRecord.SEX);  //性别
        request.target(clientTable, "");  //生日
        request.target(clientTable, ClientRecord.FPHONE);  //座机
        request.target(clientTable, ClientRecord.PHONE);  //手机
        request.target(clientTable, ClientRecord.EMAIL);  //邮箱
        request.target(clientTable, ClientRecord.FAX);  //传真
        request.target(clientTable, ClientRecord.NICKNAME);  //称呼
        request.target(clientTable, ClientRecord.COUNTRY);  //地区，国
        request.target(clientTable, ClientRecord.PROVINCE);  //地区，省
        request.target(clientTable, ClientRecord.CITY);  //地区，市
        request.target(clientTable, ClientRecord.DISTRICT);  //地区，县
        request.target(clientTable, ClientRecord.POSITION);  //职位
        request.target(clientTable, ClientRecord.SOURCE);  //客户来源
        request.target(clientTable, ClientRecord.STATUS);  //客户阶段
        request.target(clientTable, ClientRecord.COM_NAME);  //公司
        request.target(clientTable, ClientRecord.COM_INDUSTRY);  //行业，一级行业
        request.target(clientTable, ClientRecord.COM_SECOND_INDUSTRY);  //行业，二级行业
        request.target(clientTable, ClientRecord.TAG);  //标签
        request.target(clientTable, ClientRecord.COM_SITE);  //网址
        request.target(clientTable, ClientRecord.COM_ADDRESS); //地址
        request.target(clientTable, ClientRecord.QQ);  // QQ
        request.target(clientTable, ClientRecord.FOLLOW_UP);  //跟进人
        request.target(clientTable, ClientRecord.FOLLOWER_DEPT);  //部门
        request.target(clientTable, ClientRecord.REMARK);  //备注
        request.target(clientTable, ClientRecord.DSOURCE);  //资料来源


        /// convert
        request.convert(clientTable, ClientRecord.SEX, "男", "0");
        request.convert(clientTable, ClientRecord.SEX, "女", "1");
        request.convert(clientTable, ClientRecord.SEX, "--", "2");

        /// unique, 四个字段决定唯一性
        request.unique(clientTable, "client_name", "fphone", "phone", "com_name");
        request.unique(staffTable, "name");

        request.setSource(source.getSource());

        new PoiAgentImporterUtil()
                .data(request)
                .performImport();
    }
    ···
