# 用法说明

#### Pdf 模版打印

##### 模版打印方法类PdfTemplatePrinter：

```java
/**
 *  模版打印pdf
 * @param template json格式模版
 * @param request 自定义参数
 * @return 字节流
 */
public static ByteArrayOutputStream print(JSONObject template, JSONObject request) {
    ByteArrayOutputStream baos = new ByteArrayOutputStream();
    JSONObject pdfJsonRequest = processTemplate(template, request);
    print(baos, pdfJsonRequest);
    return baos;
}
```

##### 简单模版格式例子:

```json
{
  "flows": [
    {
      "name": "linear",
      "columnWidths": [
        1.0,
        1.0,
        1.0
      ],
      "elements": [
        {
          "name": "text",
          "data": "text A",
          "height": 25
        },
        {
          "name": "text",
          "data": "text B",
          "height": 25
        },
        {
          "name": "table",
          "type": "api",
          "columnWidths": [
            "1",
            "1"
          ],
          "columnKeyBindings": [
            {
              "column": "ID",
              "key": "id"
            },
            {
              "column": "名字",
              "key": "name"
            }
          ],
          "header": [],
          "data": "${rows}",
          "converts": {
            "id": {
              "{}": "No.{}"
            },
            "name": {
              "name": "名字"
            }
          },
          "rowHeight": 50,
          "headerHeight": 40,

          "headerFormat": {
            "size":"9"
          }
        }
      ]
    },
    {
      "name": "content",
      "columnWidths": ["1", "2"],
      "title": [ "姓名:","地址："],
      "data": ["某某","黄埔区"],
      "height": "25"
    },
    {
      "name": "linear",
      "columnWidths": [1, 1, 1],
      "elements": [
        {
          "name": "text",
          "data": "text B",
          "height": 25
        },
        {
          "name": "rectangle",
          "height": 70,
          "width": null,
          "color": "YELLOW"
        },
        {
          "name": "rectangle",
          "height": 70,
          "width": null,
          "color": "GREEN"
        }
      ]
    },
    {
      "name": "rectangle",
      "height": 30,
      "width": 30,
      "color": "BLACK"
    }
  ],

  "page":  {
    "pageName": "A4",
    "rotate": true,
    "margin": "40"
  }
}
```

显示效果:

![](https://github.com/kequandian/zero-io/blob/master/zero-io/simple-template.png)

### 模版 flows 属性:

> > > [ ]中能够嵌入模板元素，可以设置或修改需要打印的内容

```
{ 
	"flows": [] //flows中代表各个PDF元素，以垂直流布局的形式排列
	...
}
```

### 模版 page 属性:

> > > 可以设置页面整体布局，默认是竖向打印，可设置横向打印，设置页面边距时，数值越大，距离边框越远，整体内容越集中，内容与内容之间间距越小。可设置页面打印背景，输入网上的图片地址即可，如不需要设置背景图，则把"backgroundImageUrl"删除

```
{ 
   ...
   "page": {
      "pageName": "A4",        // PDF页面大小
      "rotate": true,		// 是否横向打印PDF(true表示横向打印，false表示竖向打印)
      "margin": "40"		// PDF页面边距
      "backgroundImageUrl": ""  // 背景底图,需网上的图片URL,不能本地上传
   }
}
```

### 模版元素:

#### 文本元素：

> > > "data"输入内容时则可以表示该部分内容的标题，不输入内容可以表示与上一部分内容分隔开来（例如：两个不同表格之间则可以用此来分开表示），高度输入的值越大，内容与内容之间的间距就越大

``` 
{
  "name": "title",       // 元素名，表示文本元素
  "data": "内容",        // 文本的内容，可填可不填
  "height": 10          // 高度
},
```

#### 详情页元素:

> > > 可以设置详情页内容的布局、大小、间距、也可以修改字段展示不同的内容等，其中：
> > >
> > > 1-高度数值越大，行与行之间的间距越大
> > >
> > > 2-"horizontalAlign"只能设置左对齐跟右对齐，不能设置居中对齐，且是针对标题的左右，跟内容无关
> > >
> > > 3-"columnWidths"表示左中右宽度的比例，左边数值越大，左边内容显示的空间越多，而右边内容显示的空间越小；中间数值越大，则中间显示的空间越大，左右显示的空间越小；右边数值越大，右边内容显示的空间越多，而左边内容显示的空间越小；当左中右数值相同时，中间显示的空间越大，而左右两边显示的空间越小，这时无论输入的数值多大，左中右显示的距离都固定一样的显示效果
> > >
> > > 4-"subColumnWidths"表示标题与内容的宽度，当标题数值越小，内容数值越大，标题和内容之间间距越接近；当标题数值越大，内容数值越小，标题与内容之间间距越远；当标题数值与内容数值相等时，标题与内容距离较远且固定，这时无论输入的值多大的都是相同的距离
> > >
> > > 5-"left"和"right"则表示左右两则的内容，可通过"title"里的字段进行修改标题，"data"可修改对应标题的内容

```
{
      "name": "detail",             // 元素名, 表示详情页元素
      "height": 20,                 // 高度
      "horizontalAlign": "RIGHT",   // 水平对齐 ： 右对齐｜左对齐
       "columnWidths": [1, 0, 1],   // 左中右宽度比例
      "subColumnWidths": [1, 3],    // 标题和内容宽度比例
      "left": {                     // 左边的详情
        "title": ["单号", "申请人", "申请时间", "封存日期", "单据状态"],     // 标题
        "data": ["${number}", "${applicant}", "${applyTime}", "${sealedTime}", "${status}"] //内容
      },
      "right": {                    // 右边的详情
        "title": ["封存部门", "执行人", "计划启用日期", "",""],
        "data": ["${sealDepartmentName}", "${executor}", "${plannedUnsealTime}", "", ""]
      },
      "converts": {                 // 内容格式化转换
        "${status}": {              // 被转换的 key
          "DRAFT": "未审核",         // 转换值
          "VERIFYING": "审核中",
          "VERIFIED": "已审核",
          "EXECUTED": "已执行",
          "CLOSED": "已作废"
        }
      }
 }
```

#### 内容列表元素：

> > > 补充详情页的内容，只能展示两列的内容，即标题和内容，title输入的内容以列的形式展示，data对应title输入的内容展示
> > >
> > > 1-"columnWidths"表示列与列之间宽度的间距距离，左边数值越大，两列之间距离越远，左边显示的空间越多；右边数值越大，两列之间的距离越近，右边显示的空间越多，数值相同时，两列显示的空间距离一样且居左显示
> > >
> > > 2-"height"可以设置每一行的高度，数值越大，两行之间距离越大，数值越小，两行之间距离越小
> > >
> > > 3-可以添加"verticalAlign"，表示上下对齐，标题和内容同时变动，默认center，可以设置top
> > >
> > > 4-还可以添加"horizontalAlign"，表示设置左右对齐，但不能设置居中，且是针对标题的左右，跟内容无关

``` 
{
  "name": "content",		// 元素名，表示内容列表元素
  "columnWidths": ["1", "2"],	// 列宽度比例， 代表两列内容的比例 （只有两列）
  "title": [ "姓名:","地址："],  // 左边竖向的标题
  "data": ["某某","黄埔区"],	// 右边的数据
  "height": "25"		// 每行高度
},
```

#### 表格元素：

> > > 可以设置页面的表格和表格里面的内容，"columnKeyBindings"表示api返回的数据显示的字段，可根据显示的内容进行定义需要打印哪一字段，其中"columnWidth"表示列宽，数值越大，列的宽度越大。"data"表示列数据，"columnKeyBindings"就是在"data"中取的字段。"rowHeight"表示每一行的高度，数值越大，行高越高，"headerHeight"表示表头的高度，即表格开头标题一行的高度，数值越大，越高，"converts"值的转换，例如，api返回的结果是英文，但页面则显示中文，这时可以用"converts"进行值的转换，具体表格的配置如下图：
> > >
> > > <img src=https://github.com/kequandian/zero-io/blob/master/zero-io-core/%E8%A1%A8%E6%A0%BC%E5%85%83%E7%B4%A0%E7%A4%BA%E4%BE%8B%E5%9B%BE.png />

``` 
{
  "name": "table",              // 元素名，表示表格元素
  "columnKeyBindings": [       // api返回数据key与表头列的对应关系
    {
      "column": "名字",		// 表头列名
      "key": "name"		// api key
      "visible": true         // 是否显示（true表示显示该列内容，false表示不显示该列内容）
      "columnWidth": 1          //列宽比例 
    }, 
    ...
  ],
  "data": "${rows}",    // 列数据，${}格式表示在储存在request的变量
  "converts": {         // 列数据转换
    "name": {          // key为name的列，如值为name，则转换为 "名字"
        "name": "名字"
    },
    ...
  },
  "rowHeight": 50,	 // 列的高度
  "headerHeight": 40,   // 表头的高度
},
```

#### 矩形元素：

> > > 可以起到占位的作用，也可以作为内容与内容显示之间的分隔，"height"表示矩形的高度，"width"表示矩形的宽度，"color"表示矩形的颜色，如不需要则可以不填该内容，注意：矩形的高度宽度会根据其他内容的高度宽度进行自动填充，且矩形默认是居中显示。

``` 
{
	"name": "rectangle",     // 元素名
	"height": 50,           // 矩形高度
	"width": 100,           // 矩形宽度， 如果为null，则横向自适应
	"color": "BLACK"        // 矩形颜色， BLACK, WHITE, YELLOW, RED ...
}
```

#### 图片元素:

> > > 可以插入图片进行打印， "url"输入的是图片的网址，不能插入本地图片，"data"表示图片的内容，以二进制形式输入 ，"width"表示图片的宽度，"height"表示图片的高度，注意：图片默认是居左显示

```
{
    "name": "image"         // 元素名
    "url": "http://xxxx"    // 图片url
    "data": ""              // 图片内容，字节格式
    "width": "50",          // 图片的宽度
	"height": "70",         //图片的高度
}
```

#### 嵌套布局元素：

> > > 可以填入更多内容或图片，填入的内容或图片以水平横向的方式显示，"columnWidths"表示嵌套的布局比例，如两张图片，则输入[1,1]，嵌套多少内容[]内就输入多少，一一对应"elements"填入的嵌套的内容，可以输入模板元素的内容，也可以输入别的内容，等等。

```
{
    "name": "linear",           // 元素名
    "columnWidths": [1,1,1],    // 嵌套布局比例
    "elements":[                // 布局所嵌套的元素
        ...
    ]
}
```

[^1]: 
