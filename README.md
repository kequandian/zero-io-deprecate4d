# 导入 Excel
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
