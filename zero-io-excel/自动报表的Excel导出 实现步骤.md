## 导出
### 自动报表导出
#### 方法访问路径：
GET `/api/io/excel/{field}`

##### 参数列表：
| **参数** |    **描述**    |
| :------: | :------------: |
|  field   | 自动报表字段名 |

##### 字段说明
对应st_statistics_meta表中的field

#### 实现步骤：
1.在前端进行调用

``` 
//前端框架配置 【框架自动传递滤条件】
 actions: [
          {
            title: '导出 Excel', type: 'export-excel',
            options: {
              API: '/api/io/excel/[自动报表-field]',
            },
          },
        ],
```

#### 通过api方式导出excel文档配置：

#### 方法访问路径：
POST /api/io/excel/export/{exportName}

##### 参数列表：
| **参数** |    **描述**    |
| :------: | :------------: |
|  exportName   | 导出报表字段名 |

##### 字典json文件配置：
> 提示：如有`status`等字段，需要中英文转换，则需要配置字典
``` json
{
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
}
```

##### 导出excel文件的配置可参考
[equipment.xlsx](./src/main/resources/excel-templates\equipment.xlsx)

##### 在前端需传入参数

``` 
{
     "type": "API",  #类型是通过API调用
     "api": "/api/adm/equipment/equipments"  #需要导出excel文档的列表api
 }
```

#### 通过api方式导出excel文档配置：

#### 方法访问路径：
POST /api/io/excel/import/{importName}

##### 参数列表：
| **参数** |    **描述**    |
| :------: | :------------: |
|  importName   | 导入报表字段名 |

##### 字典json文件配置：
> 提示：如有`status`等字段，需要中英文转换，则需要配置字典。在键值`valueConverterMap`处配置
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
##### 导入excel文件的配置可参考
> 提示：在导入excel文件的字段下添加需要导入的内容

[equipment-import.xlsx](./src/main/resources/excel-templates\equipment-import.xlsx)