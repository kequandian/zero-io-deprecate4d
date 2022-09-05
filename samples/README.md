# 广告主模块导出例子

## 导出

> 支持API和SQL两种形式的Excel导出

POST `/api/io/excel/export/{exportName}`
`exportName`为导出报表的名称,和模板文件名称要对应

### API方式

> 需要同时配置下述数据字典转换模板，以及easypoi定义的excel文件类型(*.xlsx)导出模板
>
>需要配置对应的模板，实例如下
>
>url:获取数据源的api

```json
{
  "api": {
    "url": "/api/crud/advertiser/advertisers"
  },
  "status": {
    "PASS": "使用中",
    "PENDING_APPROVAL": "待审核",
    "REFUSE": "已拒绝"
  },
  "comeFrom": {
    "0": "系统创建",
    "1": "用户注册"
  }
}
```

advertisers表单excel文件类型(*.xlsx)导出模板：就是excel-templates文件夹下面的advertisers.xlsx文件
> 上述的数据字典转模板以及对应的excel文件模板都在excel-templates文件夹里了

**项目启动后访问swagger-ui后找到相应的api，api需要一个参数一个是exportName**
> api:`/api/io/excel/export/{advertisers}`，advertisers要和模板文件名对应
>
>访问后就可以了

### SQL方式

**sql文件和对应的json配置放在excel-templates文件夹里了**
> sql方式的exportName输入advertiserReport，advertiserReport要和模板文件名对应
>
>advertiserReport.json里的参数列表：

|  **参数**  |               **描述**                |
 | :--------: | :-----------------------------------: |
|    type    |               值为`SQL`               |
|   search   | 搜索过滤参数，用于替换SQL中的模版字段 |

> api:`/api/io/excel/export/{advertiserReport}`,advertiserReport要和模板文件名对应

> body：

```json
{
    "type": "SQL",
    "search": {           
        "status": "IN_USE"   // SQL替换字段
    }
}
```

> 上述字段"search"的例子,但是在本案例里没有用到，这里只是大概介绍一下
>
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

### Web端测试

> 在samples模块下面有一个web文件夹，里面（react-pdfs）是该模块的导入导出的web端代码，
> 运行该前端代码既可以测试广告主模块的导出功能了


