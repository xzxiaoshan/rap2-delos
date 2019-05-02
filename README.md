# rap2-delos

阿里rap2-delos

### 一、手工创建数据库

手工创建数据库：rap2_delos_app

字符集：utf8 -- UTF-8 Unicode

排序规则：utf8_general_ci

### 二、启动docker

**环境变量说明：**

MYSQL_URL  数据库的Host

MYSQL_PORT  数据库的端口

MYSQL_USERNAME  数据库登录名

MYSQL_PASSWD  数据库登录密码

MYSQL_SCHEMA  数据库名称(手工创建)

REDIS_URL  Redis的Host

REDIS_PORT  Redis的端口

启动docker命令
```
docker run -itd -name xzxiaoshan-rap2-delos -e TZ='Asia/Shanghai' -e MYSQL_URL='192.168.20.16' -e MYSQL_PORT='3306' -e MYSQL_USERNAME='root' -e MYSQL_PASSWD='123456' -e MYSQL_SCHEMA='rap2_delos_app' -e REDIS_URL='192.168.20.11' -e REDIS_PORT='6379' -p 8083:8080 xzxiaoshan/rap2-delos:latest 
```

### 三、确认是否启动成功

查看docker启动日志
```
docker logs xzxiaoshan-rap2-delos
```
输出如下内容，证明成功！
```
[PM2] Spawning PM2 daemon with pm2_home=/root/.pm2
[PM2] PM2 Successfully daemonized
[PM2] Starting /app/rap2-delos/dist/dispatch.js in fork_mode (1 instance)
[PM2] Done.
┌──────────────────┬────┬─────────┬──────┬─────┬────────┬─────────┬────────┬─────┬───────────┬──────┬──────────┐
│ App name         │ id │ version │ mode │ pid │ status │ restart │ uptime │ cpu │ mem       │ user │ watching │
├──────────────────┼────┼─────────┼──────┼─────┼────────┼─────────┼────────┼─────┼───────────┼──────┼──────────┤
│ rap-server-delos │ 0  │ 1.0.0   │ fork │ 39  │ online │ 0       │ 0s     │ 0%  │ 17.5 MB   │ root │ disabled │
└──────────────────┴────┴─────────┴──────┴─────┴────────┴─────────┴────────┴─────┴───────────┴──────┴──────────┘
 Use `pm2 show <id|name>` to get more details about an app
```
然后访问 http://192.168.20.50:8083 可看到提示。

### 四、初始化数据库

进入docker然后初始化数据库
```
# 进入docker容器
[root@localhost rap2-dolores]# docker exec -it xzxiaoshan-rap2-delos /bin/sh
# 初始化数据库
/app/rap2-delos # npm run create-db
```
然后查看MYSQL的数据库中，确认数据库表是否初始化完成。

（结束）




