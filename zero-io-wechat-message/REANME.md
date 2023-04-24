# 微信小程序发送订阅消息工具<br>zero-io-wechat-message

---
> 该工具使用微信官方api，官方修改了api后可能会失效  
> 在 src/main/resource 下存放着微信官方发送订阅消息的api路径

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
    * @param page 跳转页面（可省略）
    * @param miniProgramState 跳转小程序类型（可省略，默认为正式版）
    * @param lang 进入小程序查看的语言类型（可省略，默认为中文）
*参数获取方法请查询：[微信官方说明文档](https://developers.weixin.qq.com/miniprogram/dev/framework/open-ability/subscribe-message.html#%E8%AE%A2%E9%98%85%E6%B6%88%E6%81%AF%E8%AF%AD%E9%9F%B3%E6%8F%90%E9%86%92)*
