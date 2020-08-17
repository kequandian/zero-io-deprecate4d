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

