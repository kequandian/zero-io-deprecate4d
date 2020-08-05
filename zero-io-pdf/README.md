# zero-io-pdf
> 通过数据库存储的pdf模版以及获取API中数据进行 pdf的导出。

### 数据库

```sql
CREATE TABLE `io_pdf_table` (
  `id` bigint(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL COMMENT '列表名',
  `editable` tinyint(1) DEFAULT NULL COMMENT '是否可编辑',
  `type` varchar(50) DEFAULT NULL COMMENT '类别(api 或 statistics)',
  `api` varchar(255) DEFAULT NULL COMMENT '绑定api',
  `api_field` varchar(255) DEFAULT NULL COMMENT 'api 中字段',
  `api_list` varchar(255) DEFAULT NULL COMMENT 'api 中的列表字段',
  `header_field` varchar(255) DEFAULT NULL COMMENT 'api返回数据的键值',
  `field` varchar(50) DEFAULT NULL COMMENT '自动报表的field',
  `template_content` text COMMENT '模版内容',
  `origin_config` text COMMENT '前端模版内容',
  `sub_apis` json DEFAULT NULL COMMENT '子api'
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
```

数据库中存储对应的PDF打印模版，以及对应的API，打印类型。


## 列表导出
GET `/api/io/pdf/export/{tableName}`

**tableName**对应数据库中`name`字段, 通过`name`在数据库中获取到打印的模版，从而打印PDF。模版格式参考[zero-io-core](../zero-io-core)，根据导出数据的来源有API和报表两种打印方式。

- API打印

通过访问通用的API获取导出的数据。

- 报表打印

> 自动报表数据格式参考 statistics 包。

通过访问**自动报表**API获取导出的数据，自动报表返回数据格式较为固定，更易于编写导出模版。

## 详情页导出

GET `/api/io/pdf/export/multiple/{tableName}`

因为是详情页导出原因，还需要传入`id`参数

#### 多API情况
详情页数据来自多个API，所以需要获取多个API中的数据。数据库中`sub_api`字段对应多个API的json数组信息。

sub_api例子：

```json
[
    {
        "api": "http://39.108.14.206:8070/api/wf/histories?formId=", 
        "mapName": "${histories}",  // 将API获取字段的数据映射为变量
        "fieldName": ""             // 从API中获取的字段
    }
]
```

