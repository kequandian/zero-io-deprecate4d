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

###  模版 flows 属性:
```
{ 
	"flows": [] //flows中代表各个PDF元素，以垂直流布局的形式排列
	...
}
```
###  模版 page 属性:
``` 
{ 
	...
	"page": {
		"pageName": "A4", // PDF页面大小
    "rotate": true,		// 是否横向打印PDF
    "margin": "40"		// PDF页面边距
	}
}
```

###  模版元素:

#### 文本元素：
``` 
{
  "name": "text",		// 元素名，表示文本元素
  "data": "内容",		// 文本的内容
  "height": 10		 //	高度
},
```

#### 内容列表元素：
``` 
{
  "name": "content",					// 元素名，表示内容列表元素
  "columnWidths": ["1", "2"],	// 列宽度比例， 代表两列内容的比例 （只有两列）
  "title": [ "姓名:","地址："], // 左边竖向的标题
  "data": ["某某","黄埔区"],		 // 右边的数据
  "height": "25"							// 每行高度
},
```
#### 表格元素：
``` 
{
  "name": "table",					  // 元素名，表示表格元素
  "columnWidths": ["1", "1"],	// 列宽度比例，代表列内容的比例
  "columnKeyBindings": [			// api返回数据key与表头列的对应关系
  	{
      "column": "名字",					// 表头列名
      "key": "name"						 // api key
    }, 
    ...
  ],
 	"header": [],								// 表头数组
 	"data": "${rows}",					// 列数据，${}格式表示在储存在request的变量
 	"converts": {								// 列数据转换
 		"name": {									// key为name的列，如值为name，则转换为 "名字"
     	"name": "名字"
  	},
  	...
 	},
 	"rowHeight": 50,						// 列的高度
 	"headerHeight": 40,					// 表头的高度
},
```
####  矩形元素：
``` 
{
	"name": "rectangle",			// 元素名
	"height": 50,							// 矩形高度
	"width": 100,							// 矩形宽度， 如果为null，则横向自适应
	"color": "BLACK"					// 矩形颜色， BLACK, WHITE, YELLOW, RED ...
}
```