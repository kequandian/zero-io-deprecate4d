# 自动报表导出

## 一.调用方法介绍：

GET `/api/io/pdf/export/{field}`

**  参数列表：**

| **参数** |    **描述**    |
| :------: | :--------------------:  |
|  name    | 对应导出pdf模板配置的name |

<br>

## 二.自动报表PDF导出的实现步骤：

1.在前端进行调用 2.在io_pdf_table表中配置导出相关信息

### 步骤详解

#### 步骤1-在前端进行调用

> 在前端的自动报表页面 配置导出pdf的配置

``` 
//前端框架配置 【框架自动传递滤条件】
//前端这里的type和导出excel相同
   actions: [
           {
             title: '导出 pdf', type: 'export-excel',
             options: {
               API: '/api/io/pdf/export/{name}',
               method: 'get',
             },
           },
         ],
```

步骤1完成

<br>
#### 步骤2-在io_pdf_table表中配置导出相关信息 
** 一.数据库字段介绍 **

| **参数** |    **描述**    |
| :------: | :------------: |
|  id   | 唯一标识 |
|  name   | 列表名，调用方法的时候使用此字段确定要调用的模板 |
|  editable   | 是否可编辑 0否 / 1是   |
|  type   | 类型：api 或 statistics（自动报表）  |
|  api   | 模板要访问的api，type为api时使用这个字段|
|  field   | 自动报表字段名，type为statistics时使用这个字段|
|  template_content   | 后端配置模板 |
|  origin_config   | 前端存储用 null即可 |
|  ~~api_field~~   | api中的字段 暂时无用 |
| ~~api_list~~  | api列表中的字段 暂时无用 |
|  ~~header_field~~   | 表头字段 暂时无用 |

** 二.主要配置字段template_content介绍 **
&nbsp;&nbsp;&nbsp;&nbsp;template_content为主要配置导出效果的字段，存储的是json格式的数据，以下将对这个模板的配置进行介绍

&nbsp;&nbsp;&nbsp;&nbsp;template_content分为两个部分 flows和page flows配置内容 page配置页面

```json
{
"flows":[],
"page":{}
}
```

** 1. flows介绍 **
flows目前根据name的不同有两种配置方式目前name分为<kbd>linear</kbd>和<kbd>table</kbd>
table在自动报表中未用到，此处不做介绍

- 当name为linear时

```
 {
      "name": "linear",
      "columnWidths": [1.0],
      "elements": []
}
```

- columnWidths用于配置各个组件所占宽度比例
- elements下有个配置：name，根据name分为<kbd>content</kbd>和<kbd>table</kbd>
  <br>

elements下name为content时，用于显示表格头部信息 例如：打印人 打印时间 等信息
<br>
> 具体配置示例：

```
      "elements": [
        {
          "name": "content",
          "columnWidths": [1,2],
          "height": 20,
          "title": ["项目名称:","备注:", ""],
          "data": [ "报销清单","", ""]
        },
        {
          "name": "text",
          "data": "",
          "height": 25
        },
        {
          "name": "content",
          "columnWidths": [1,2],
          "height": 20,
          "title": ["打印日期:", "负责人:", "确认人:"],
          "data": ["${createDate}", "", ""]
        }
      ]
```

> 示例中elements里面有3个组件 最终导出每个组件占用一列
> - height：高度
> - title :左侧字段
> - data:右侧数据 ${createDate}可用于显示当前时间

<br>


elements下name为table时 用于显示自动报表的表格信息
> 具体配置示例：

```
      "elements": [
        {
          "name": "table",
          "columnWidths": [ "1", "1", "1", "1","1", "1.2" ],
          "columnKeyBindings": [
            {
              "column": "结算年度",
              "key": "结算年度"
            },
            {
              "column": "合作伙伴",
              "key": "合作伙伴"
            },
            {
              "column": "股东净利润",
              "key": "股东净利润"
            },
            {
              "column": "股东毛利",
              "key": "股东毛利"
            },
            {
              "column": "合同金额",
              "key": "合同金额"
            },
            {
              "column": "实际应收款总金额",
              "key": "实际应收款总金额"
            }
          ],
          "header": [],
          "data": "${rows}",
          "converts": {
            "股东净利润": { "{}": "¥ {}" },
            "股东毛利": {"{}": "¥ {}" },
            "合同金额": { "{}": "¥ {}"},
            "实际应收款总金额": { "{}": "¥ {}" }
          },
          "rowHeight": 25,
          "headerHeight": 40
        }
      ]
```

> columnWidths:每个字段占用的宽度
> columnKeyBindings:自动报表的字段对应打印出来的字段映射
> data:数据源 ${rows}从rows中获得
> converts:额外配置 key填需要配置的字段，value填映射规则
>> 例如原本自动报表传1000经过  "{}": "¥ {}"配置后打印为 ¥1000

> rowHeight:行高
> headerHeight:表头高度

完整例子参考同目录下pdfExport.json











