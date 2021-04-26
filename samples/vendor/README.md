# 广告主模块导出例子
## 导出
> 支持API和SQL两种形式的Excel导出

POST `/api/io/excel/export/{exportName}`
`exportName为导出报表的名称`
###  API方式
> 需要同时配置下述数据字典转换模板，以及easypoi定义的excel文件类型(*.xlsx)导出模板
>上述的数据字典转模板以及对应的excel文件模板都在excel-templates文件夹里了

**项目启动后访问swagger-ui后找到相应的api，api需要两个参数一个是exportName,一个是exportParam。**
>api方式的exportName输入advertisers，
exportParam输入：
{
  "api": "http://localhost:8081/api/crud/advertiser/advertisers",
  "dict": {},
  "search": {},
  "type": "API"
}
访问即可

### SQL方式
**sql文件放在excel-templates文件夹里了**
>sql方式的exportName输入advertiserReport，
exportParam输入：
{
  "search": {},
  "type": "SQL"
}


