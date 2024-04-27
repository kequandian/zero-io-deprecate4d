# zero-io-excel

> 导出EXCEL使用说明

##### 引用开源框架easypoi

> 详细配置方法参考以下开源链接

- [easypoi](https://gitee.com/lemur/easypoi)


## 导出

1. 如果，type的类型是 `SQL`，那么该`api`需要的参数是导出报表字段名（注意：在`excel-templates`文件夹下需要有一份 `.sql` 语句，该sql语句是获取导出的数据的）
2. 如果type的类型为 `API` 方式导出，那么api需要的参数是导出报表的字段名（注意：在`excel-templates`文件夹下 下需要有一份对应的字典json和导出的excel模板才可以）

#### 首先在`application.yml`中配置资源路径

```yaml
io:
  excel-template-dir: "excel-templates"
```


##### 参数列表：

| **参数** |    **描述**    |
| :------: | :------------: |
|  exportName   | 导出报表字段名，获取在配置目录上的文件名 |


POST `/api/io/excel/export/{exportName}`



### API方式

> 需要同时配置下述数据字典转换模板，以及easypoi定义的excel文件类型(*.xlsx)导出模板

导出api参数说明：

|  **参数**  |     **描述**     |
| :--------: | :--------------: |
|    type    |   固值为 `API`     |
|    api     | 用于获取导出数据的 api |
|   search   | 搜索和分页的参数 |

请求参数例子:

```json
{
    "type": "API",
    "api": "/api/adm/equipment/equipments",
    "search": {
        "categoryId": "",
        "activeKey": "list",
        "pageSize": 99
    }
}
```


**字段转换字典配置:**

> 为了转换API中的返回的字段值，需要额外在模版目录`excel-template-dir`中放入文件名为 `exportName.json` 的转换文件。

##### 字典json文件配置：

> 提示：如有`status`等字段，需要中英文转换，则需要配置字典


配置文件`exportName.json`例子:

```json
{
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
```

**基于easypoi的导出excel文件类型(*.xlsx)模板例子:**

> 同样放进 `excel-template-dir` 定义的目录

|  **编号**  |               **名称**                |               **说明**                 |
| :--------: | :-----------------------------------: | :-----------------------------------: | 
|   {{ $fe: list t.entityNumber  |              t.name    |              t.note}} | 

> 配置例子可参考
[equipment.xlsx](./src/main/resources/equipment.xlsx)

### SQL方式

参数列表：

|  **参数**  |               **描述**                |
| :--------: | :-----------------------------------: |
|    type    |               值为`SQL`               |
|   search   | 搜索过滤参数，用于替换SQL中的模版字段 |

请求参数例子:

```js
{
    "type": "SQL",
    "search": {           
        "status": "IN_USE"   // SQL替换字段
    }
}
```

> Sql文件存放在配置文件的 `excel-template-dir`文件夹下，文件名与导出名称 `exportName` 相同 (e.g. exportName.sql)。

sql例子：

> `search`字段中的值会替换SQL中`#{}`格式的变量并取消注释, 注释的格式规定为`--`。

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
WHERE 1=1
--AND status = '#{status}'

```



## 导入

> 通过传入导入的名称和excel文件，对数据库进行**批量更新**。

POST  `/api/io/excel/import/{importName}`


参数列表：

|   **参数**    |              **描述**              |
| :-----------: | :--------------------------------: |
| multipartFile |          导入的excel文件           |

application.yml配置如下：

```yaml
io:
  excel-template-dir: "excel-templates"
```

模版文件 importName.json：

```json
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
      "valueConverterMap": { //字典转换
            "status": {
                "IN_USE": "在用",
                "STAND_BY": "已下发",
                "LOST": "丢失"
                },
            "change_status": {
                "SCRAPPED": "报废",
                "SEALED": "封存",
                "DISABLED": "停用"
                },
            "stock_status": {
                "TO_STOCKTAKE": "待盘点",
                "TO_STOCK_ADJUST": "待调整"
            }},
      "values": []
    }
  ],
  "unique": [             // 唯一字段， 用于设置更新 
    {
      "fields": [        // 字段名 目前unique 在type为postfix情况下 仅支持设置一个fields
        "code"          // 多个fields,  表达由多个field决定唯一性  例如  "fields": [ "code","num" ]
      ],
      "table": "equipment",
      "valueConverterMap": {},
      "option": {           
        "postfix": "%%{1...}",   //postfix类型下的后缀  {1...} 表示自增序号为数字从1开始
        "type": "POSTFIX"  //类型 目前支持POSTFIX 和 UPDATE 无option情况下默认为UPDATE
                           //POSTFIX 类型时 ：发现相同项时，通过添加后缀插入项代替更新项
      }
      "values": []
    }
  ]
}

```

接收`name`参数后，通过yaml配置文件的`excel-template-dir`和 `importName` 读取到模版文件 `importName.json`，然后处理`multipartFile`中的Excel数据，从而进行**
批量更新数据库**的操作。

## 需要注意的问题

* API方式导出时出现 `No route to host (Host unreachable)` 的问题，可能是由于防火墙导致的。

  ```
  # 查看防火墙状态
  $ firewall-cmd --state
  $ systemctl status firewalld
  # 关闭防火墙
  $ systemctl stop firewalld
  ```

  
##### 导入excel文件的配置可参考

> 提示：在导入excel文件的字段下添加需要导入的内容 大致的流程：
> api需要的参数是
> importName：导入表单的名字，
> multipartFile：excel文件，需要在excel里面 添加对应的字段内容，该表单需要在数据库里面存在，要不然就会报错，程序启动的时候会扫描resources 下面的excel-templates文件夹里面对应的json文件和excel文件，如果存在即可以把数据导入到数据库


### 另一个配置例子
``` json
{
    "duplicate": 0,      
    "header": 1,         
    "level": 1,          
    "overwrite": 1,      
    "relationOnly": 0,   
    "target": [         
      {
        "fields": [		 
          "projectCode",
          "projectName",
          "code",
          "batchNumber",
          "name",
          "categoryName",
          "installationSite",
          "warehouseName",
          "status",
          "changeStatus",
          "stockStatus",
          "factory",
          "system",
          "spec",
          "material",
          "machineCode",
          "brand",
          "supplier",
          "supplier",
          "startTime",
          "produceTime",
          "serviceLife",
          "note "
        ],
        "table": "equipment",
        "valueConverterMap": {
          "status": {
            "IN_USE": "在用",
            "STAND_BY": "已下发",
            "LOST": "丢失"
          },
          "change_status": {
            "SCRAPPED": "报废",
            "SEALED": "封存",
            "DISABLED": "停用"
          },
          "stock_status": {
            "TO_STOCKTAKE": "待盘点",
            "TO_STOCK_ADJUST": "待调整"
          }
        },
        "values": []
      }
    ]
  }
}
```
