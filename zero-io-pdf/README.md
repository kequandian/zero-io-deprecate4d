# zero-io-pdf
> 通过数据库存储的pdf模版以及获取API中数据进行 pdf的导出。

### ~~数据库~~
~~数据库中存储对应的PDF打印模版，以及对应的API，打印类型。~~
### JSON
现在使用本地的JSON文件作为模版来打印PDF。
> 通过配置文件中的 `pdf.template-directory`属性，配置JSON模版文件的存放目录。 

> 生成PDF库比较 [pdf-vs-pdfmake-vs-phantomjs-vs-react-pdf](https://www.npmtrends.com/pdf-vs-pdfmake-vs-phantomjs-vs-react-pdf)

## 列表导出
GET `/api/io/pdf/export/{tableName}`

**tableName**对应JSON文件名称, 通过JSON文件名读取本地JSON文件中的模版，从而打印PDF。根据导出数据的来源有API和报表两种打印方式。

- **API打印**
> 注意：因为对API返回数据格式有要求，所以仅限于CRUD框架下的API，且是列表API。

通过访问通用的API获取导出的数据。 

- **报表打印**

> 自动报表数据格式参考 statistics 包。

通过访问**自动报表**API获取导出的数据，自动报表返回数据格式较为固定，更易于编写导出模版。

JSON例子：
```javascript
{
  "api": "",                // 获取数据的api，支持相对路径（api类型）
  "type": "",               // 类型 API、STATISTICS
  "field": "",              // 自动报表的field
  "templateContent": "",    // pdf模版内容
  "originConfig": ""        // 前端所需（保留）
}
```
> templateContent属性的格式参考 [zero-io-core](../zero-io-core)

### 测试例


API方式pdf打印测试接口: `/api/io/pdf/export/test/test_api`

测试所使用的json文件:  [test_api.json](../pdf-templates/test_api.json)