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



##### 模版格式:
```json
{
  "flows": [
    {
      "name": "title",
      "element": {
        "formatName": "title",
        "alignment": "ALIGN_CENTER",
        "content": "title"
      }
    },
    {
      "name": "table",
      "element": {
        "layout": {
          "columnWidths": [1,1,2,1,1,1,1,1,1,1,1]
        },
        "header": [
          "报销人",
          "出工名",
          "项目",
          "工作时长",
          "出工费用",
          "里程数/km",
          "路费",
          "其他费用",
          "共计",
          "时间",
          "备注"
        ],
        "rows": "${rows}",
        "format": {
          "rowFormat": {
            "formatName": "default",
            "height": 90.0
          },
          "firstRowFormat": {
            "formatName": "table-firstrow",
            "height": 40
          }
        }
      },
      "convert": {
        "headerFields": [
          "name",
          "activityName",
          "projectName",
          "workTime",
          "activityFree",
          "kmCount",
          "outOfKmFree",
          "othersFree",
          "allFree",
          "createTime",
          "note"
        ],
        "converts": {
          "workTime": {
            "0.5000": "上午",
            "0.6250": "下午",
            "1.0000": "整天"
          },
          "activityFree": {
            "{}": "¥ {}"
          },
          "outOfKmFree": {
            "{}": "¥ {}"
          },
          "othersFree": {
            "{}": "¥ {}"
          },
          "allFree": {
            "{}": "¥ {}"
          }
        }
      }
    }
  ],
  "page": {
    "marginRight": 20.0,
    "pageSize": {
      "border": -1,
      "borderWidthBottom": -1.0,
      "bottom": 0.0,
      "chunks": [],
      "rotation": 0,
      "right": 595.0,
      "content": true,
      "borderWidthLeft": -1.0,
      "borderWidthRight": -1.0,
      "top": 842.0,
      "left": 0.0,
      "useVariableBorders": false,
      "borderWidth": -1.0,
      "grayFill": 0.0,
      "nestable": false,
      "width": 595.0,
      "borderWidthTop": -1.0,
      "height": 842.0
    },
    "marginBottom": 20.0,
    "pageHeight": 842.0,
    "pageName": "A4",
    "marginTop": 20.0,
    "pageWidth": 595.0,
    "marginLeft": 20.0
  },
  "definitions": {
    "borders": {
      "table-border": {
        "color": {
          "red": 0,
          "green": 0,
          "blue": 0
        },
        "width": 2.0,
        "colorname": "BLACK"
      },
      "line": {
        "color": {
          "red": 0,
          "green": 0,
          "blue": 0
        },
        "width": 2.0,
        "style": "TOP",
        "colorname": "BLACK"
      },
      "right": {
        "width": 10.0,
        "style": "RIGHT",
        "colorname": "BLACK"
      }
    },
    "fonts": {
      "default": {
        "size": 9.0,
        "familyname": "",
        "style": "NORMAL",
        "baseColor": {
          "red": 0,
          "green": 0,
          "blue": 0
        }
      },
      "table-firstrow": {
        "size": 12.0,
        "familyname": "宋体",
        "style": "BOLD",
        "baseColor": {
          "red": 0,
          "green": 0,
          "blue": 0
        }
      },
      "table-header": {
        "size": 14.0,
        "familyname": "宋体",
        "style": "BOLD",
        "baseColor": {
          "red": 0,
          "green": 0,
          "blue": 0
        }
      },
      "title": {
        "size": 16.0,
        "familyname": "宋体",
        "style": "NORMAL",
        "baseColor": {
          "red": 0,
          "green": 0,
          "blue": 0
        }
      },
      "table-row": {
        "size": 10.0,
        "familyname": "宋体",
        "style": "NORMAL",
        "baseColor": {
          "red": 0,
          "green": 0,
          "blue": 0
        }
      }
    },
    "background": "${background}"
  }
}
```
