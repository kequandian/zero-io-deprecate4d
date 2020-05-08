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