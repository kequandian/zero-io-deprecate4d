# zero-io-sandbox 部署
快速部署zero-io的导入导出功能，需要接入已有的docker容器的网络

#### 准备 zero-io包

在[zero-io-all](./zero-io-all) 项目下执行`mvn package`，将生成的 `zero-io-all-1.0.0-standalone.jar` 放入`io-api`目录下。

```
$ ls ./io-api
config   templates   zero-io-all-1.0.0-standalone.jar
```

#### 准备模版文件
将模版文件放入 `io-api/templates`目录。
```
$ ls ./io-api/templates
template.json
```

#### nginx 配置文件

将`io.conf` 配置文件拷贝到接入网络的nginx服务的`conf.d`目录

#### 运行配置文件

> `network`参数为接入的docker网络名称

```
$ sh io-config.sh
Usage: io-config.sh <network> <mysqlurl> <database>
Option:
      network   - docker network name you want to connect
      mysqlurl  - mysql server url
      database  - database name
```

#### 启动docker容器

```
$ docker-compose up -d
```

