# zero-io-excel
>自动报表的EXCEL导出API

## 导出
### 自动报表导出

GET `/api/io/excel/{field}`

field: 自动报表字段，导出excel的文件名

prefix: 自动报表api前缀

`private static final String API_PREFIX = "/api/adm/stat/meta";`

访问接口后会将/api/adm/stat/meta/{field} 自动报表API中的返回数据导出成EXCEl

###  API和SQL方式导出

POST `/api/io/excel/export`

> 支持API和SQL两种形式的Excel导出

参数列表：


|  **参数**  |     **描述**     |
| :--------: | :--------------: |
| exportName |     导出名称     |
|    type    | 值为`API`或`SQL` |
|    api     |       API        |
|   search   | 搜索和分页的参数 |
|    dict    |     转换字典     |

参数例子:

```json
{
    "exportName": "equipment",
    "type": "API",
    "api": "http://39.108.14.206:8070/api/adm/equipment/equipments",
    "search": {
        "categoryId": "",
        "activeKey": "list",
        "pageSize": 99
    },
    "dict": {
        "status": {
            "IN_USE": "使用中",
            "STAND_BY": "待用"
        },
        "changeStatus": {
            "": "无",
            "SCRAPPED": "报废",
            "SEALED": "封存",
            "DISABLED": "停用"
        },
        "stockStatus": {
            "TO_STOCKTAKE": "待盘点",
            "TO_STOCK_ADJUST": "待调整"
        }
    }
}
```

sql例子：

```sql
SELECT
	(@i:=@i+1) AS "序号",
	id AS '编号',
	CASE status
	WHEN 'IN_USE' THEN
		'使用中'
	WHEN 'STAND_BY' THEN
		'待机中'
	END AS '状态'
FROM
	equipment ,(select @i:=0)t

```



## 导入

> 通过传入导入的名称和excel文件，对数据库进行**批量更新**。

POST  `/api/io/excel/import`

参数列表：

|   **参数**    |              **描述**              |
| :-----------: | :--------------------------------: |
|     name      | 导入名称，对应yml配置中`equipment` |
| multipartFile |          导入的excel文件           |

application.yml配置如下：

```yaml
excel:
  template-directory: "excel-templates"
```

模版文件 equipment.json：

```
{
  "convert": [	// 字段转换
    {
      "field": "status",     // 字段名称
      "newValue": "IN_USE",  // 转换结果
      "oldValue": "使用中",   // 转换值
      "table": "equipment"   // 表名
    },
    {
      "field": "status",
      "newValue": "STAND_BY",
      "oldValue": "待用",
      "table": "equipment"
    },
    ...
  ],
  "duplicate": 0,      // 是否允许添加与数据库中完全相同的数据，1允许存在完全相同数据，0为不允许
  "header": 1,         // excel是否包含表头
  "level": 1,          // 1=单表，2=多表
  "overwrite": 1,      // 对导入复复项，是否重写, 默认重复导入可更新
  "relationOnly": 0,   // 是否仅建立多表关系，仅用于多表关联，跳过查入检查时间
  "target": [          // 导入到数据库的表目的字段
    {
      "fields": [		//导入字段
        "project_code",
        "project_name",
        "code",
        "batch_number",
        "name",
        ...
      ],
      "table": "equipment",	// 导入表名
      "valueConverterMap": {},
      "values": []
    }
  ],
  "unique": [             // 唯一字段， 用于设置更新
    {
      "fields": [        // 字段名
        "code"
      ],
      "table": "equipment",
      "valueConverterMap": {},
      "values": []
    }
  ]
}

```



接收`name`参数后，通过yaml配置文件的`template-directory`和`name`读取到模版文件，然后处理`multipartFile`中的Excel数据，从而进行**批量更新数据库**的操作。