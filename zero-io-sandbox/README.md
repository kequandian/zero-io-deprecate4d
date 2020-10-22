# zero-io-sandbox 部署
快速部署zero-io的导入导出功能，需要接入已有的docker容器的网络

#### 准备 zero-io包

在[zero-io-all](../zero-io-all) 项目下执行`mvn package`，将生成的 `zero-io-all-1.0.0-standalone.jar` 放入`io-api`目录下。

```
$ ls ./io-api
config   templates   zero-io-all-1.0.0-standalone.jar
```

#### 准备模版文件
> 不同业务所需模板不同
将模版文件放入 `io-api/templates`目录。
```
$ ls ./io-api/templates
template.json
```

#### 运行配置文件
> `network`参数为接入的docker网络名称

```
$ sh config.sh
Usage: config.sh <network>
Option:
      network   - docker network name you want to connect
```

#### 启动docker容器

```
$ docker-compose up -d
```


## 部署常见问题
> 除了部署更新代码库，需同时考虑部署
* 需同时同步导入导出配置文件
* 需同时同步数据库表

