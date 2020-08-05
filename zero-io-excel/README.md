# zero-io-excel
>自动报表的EXCEL导出API

## 导出
GET `/api/io/excel/{field}`

field: 自动报表字段，导出excel的文件名

prefix: 自动报表api前缀

`private static final String API_PREFIX = "/api/adm/stat/meta";`

访问接口后会将/api/adm/stat/meta/{field} 自动报表API中的返回数据导出成EXCEl

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
  import-map:
    equipment:
      template-name: "equipment.json"
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



接收`name`参数后，通过yaml配置文件的`template-directory`和`template-name`读取到模版文件，然后处理`multipartFile`中的Excel数据，从而进行**批量更新数据库**的操作。