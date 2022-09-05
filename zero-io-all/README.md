# zero-io-all

> 将PDF 和 Excel 的功能聚合成一个项目，减少部署服务器的消耗。

### 部署

docker-compsoe.yml:

```yaml
# 例子
version: "3"
services:
  am-io:
    image: zelejs/allin-web:jdk11
    container_name: am-io 
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - ./io-all:/webapps
    environment:
      DL_STANDALONE: "zero-io-all-1.0.0-standalone.jar"
```

application.yml

```yaml
# 例子
spring:
  profiles: produce
  datasource:
      url: jdbc:mysql://some-mysql-url/am?autoReconnect=true&useUnicode=true&characterEncoding=utf8&zeroDateTimeBehavior=convertToNull&allowMultiQueries=true
      username: xx
      password: xxx
      filters: log4j,wall,mergeStat
      sql-script-encoding: UTF-8
      schema: classpath*:sql/*-schema.sql
      data: classpath*:sql/*-cinema-data.sql
      initialize: false
---
io:
  excel-template-dir: "excel-templates"

logging:
  level: warn 
  config: config/logback-spring.xml
```

