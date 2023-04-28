# 微信小程序发送订阅消息工具<br>zero-io-wechat-message

---
> 注意！  
> 该工具使用微信官方api，官方修改了api后可能会失效。  
> 在 src/main/resource/application.properties 下存放着微信官方发送订阅消息的api路径。  
> 别的项目引用该工具后会以别的项目中的application.properties为优先，所以请复制本工具中的properties中的内容添加到您的项目properties中即可

[微信官方说明文档](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/subscribe-message.html#%E8%AE%A2%E9%98%85%E6%B6%88%E6%81%AF%E8%AF%AD%E9%9F%B3%E6%8F%90%E9%86%92)

---
## 使用说明


<br>

### 提供的操作对象：
`WeChatMiniProgramMessage`

<br>

### 提供的方法：
- `getAccessToken()` 获取官方凭证，已在`sendMessage()`中调用
- `sendMessage()` 发送微信小程序订阅消息,该方法提供了两组入参，
一个是提供全参数配置，更加灵活。一个是只需要必要的参数，其余的均使用默认配置

<br>

### sendMessage() 所需参数：
    * @param appAppid 小程序appid
    * @param appSecret 小程序appSecret
    * @param openid 用户openid
    * @param templateId 订阅模版id
    * @param data 模版内容
    * @param page 跳转页面（省略则不跳转）
    * @param miniProgramState 跳转小程序类型（可省略，默认为正式版）
    * @param lang 进入小程序查看的语言类型（可省略，默认为中文）
*参数获取方法请查询：[微信官方说明文档](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/subscribe-message.html#%E8%AE%A2%E9%98%85%E6%B6%88%E6%81%AF%E8%AF%AD%E9%9F%B3%E6%8F%90%E9%86%92)*

<br>

### 例子：
现在以微信中的一次性订阅模版："订单进度提醒" 作为例子
获取微信通知模版位置：登录微信公众平台 - 订阅消息。

#### "订单进度提醒"要求的data格式:
开始时间 {{time3.DATA}}  
订单进度 {{thing4.DATA}}  
订单编号 {{character_string5.DATA}}  
产品名称 {{thing10.DATA}}  
```json
"data": {
      "name01": {
          "value": "某某"
      },
      "amount01": {
          "value": "￥100"
      },
      "thing01": {
          "value": "广州至北京"
      } ,
      "date01": {
          "value": "2018-01-01"
      }
  }
}
```

<br>

#### 代码例子：
模拟数据发送通知，正式使用时请使用真实数据
```java
    // 将操作对象注入
    @Resource
    WeChatMiniProgramMessage weChatMiniProgramMessage;

    // 调用 sendMessage()
    public void should_retuanHttpEntity_when_sendMessage() {
        
    // 封装消息内容 data
    JSONObject messageContent = new JSONObject();
    // 获取当前时间
    DateTimeFormatter dateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
    String dateTime = LocalDateTime.now().format(dateTimeFormatter);
    JSONObject time3 = new JSONObject();
    time3.put("value",dateTime);
    messageContent.put("time3",time3);
    // 订单进度
    JSONObject thing4 = new JSONObject();
    thing4.put("value","待确认");
    messageContent.put("thing4",thing4);
    // 订单编号
    JSONObject character_string5 = new JSONObject();
    character_string5.put("value","1111111111111");
    messageContent.put("character_string5",character_string5);
    // 产品名称
    JSONObject thing10 = new JSONObject();
    thing10.put("value","团购商品");
    messageContent.put("thing10",thing10);

    weChatMiniProgramMessage.sendMessage(appid,appSecret,openid,templateId,messageContent);
    }
```
