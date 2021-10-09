## 专用于aliyun的服务对接

#### application.yml 配置文件

```yaml
io:
   file-upload-path: /images
   file-host: images
```

## 文件上传可能触发的 **跨域问题** 解决方案

> /api的配置文件里面限制了上传大小为80M，然后上传出错时返回的错误页面被ngnix认为是跨域了，这可能就是文件大小和跨域的问题

```yml
spring:
   profiles: prod
   http:
     multipart:
        max-file-size: 80MB
        max-request-size: 80MB
```


### 'vscode' 测试说明 

```http
@endpoint=http://localhost:8080

### 测试文件上传
POST {{endpoint}}/api/fs/uploadfile
Content-Type: multipart/form-data; boundary=WebKitFormBoundaryAFRaG58f2nIb0mPB

--WebKitFormBoundaryAFRaG58f2nIb0mPB
Content-Disposition: form-data; name="file"; filename="logo_128x128.png"
Content-Type: image/png

< ./logo_128x128.png
--WebKitFormBoundaryAFRaG58f2nIb0mPB--

```
