## 导出

### 自动报表导出

#### 方法访问路径：

GET `/api/io/excel/{field}`

##### 参数列表：

| **参数** |    **描述**    |
| :------: | :------------: |
|  field   | 自动报表字段名 |

##### 字段说明

`{field}` 对应 `st_statistics_meta` 表中的`field` 字段


#### 实现步骤：

1.在前端可配置框架中`actions `配置域增加如下配置

```js
{
  actions: [
        {
          title: '导出 Excel',
          type: 'export-excel',
          options: {
            API: '/api/io/excel/[自动报表-field]',
          }
        }
  ]
}
```
