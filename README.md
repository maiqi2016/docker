## 开发环境

`Ubuntu` `Nginx` `Mysql` `PHP7`

## 安装步骤

* sudo docker-compose up --build

    > 提示! 如果你的 `build` 操作过慢，你可前往 [daocloud](https://www.daocloud.io) 注册并获取加速方式，如果你是 `linux`, 则类似
    >
    > ```
    > curl -sSL https://get.daocloud.io/daotools/set_mirror.sh | sh -s http://{YOU-SELF-ID}.m.daocloud.io
    > ```
    >
    > 警告! 本架构编译大概需要 `15` 分钟左右。
    > 如果因网络问题失败，请重新执行命令。

## 帮助脚本说明

* `library.sh` 包含一些帮助函数，如果不希望安装以下其他命令时也可以单独执行，将为你创建 `fpm`、`mysql` 和 `nginx` 三个容器的便捷入口命令，方便调试。

    * `mq-container-fpm bash` 便捷进入 `fpm` 容器，`bash` 可替换成任意 `linux` 命令执行
    * `mq-container-mysql bash` 便捷进入 `mysql` 容器，同上
    * `mq-container-nginx bash` 便捷进入 `nginx` 容器，同上

* `install-bash.sh` 生成命令：

    * `mq-bash` 可用于替代 `bash`。

* `install-composer.sh` 生成命令：

    * `mq-composer` 完全替代 `composer`。
    
        > 如若安装依赖有环境要求，可使用以下命令绕过要求  
        > `mq-composer [install | require] [package name] --ignore-platform-reqs`

* `install-front.sh` 生成前端相关命令：
    
    * `mq-node` 完全替代 `nodejs`
    * `mq-npm` 完全替代 `npm`
    * `mq-cnpm` 完全替代 `cnpm` （国内淘宝团队镜像）

* `install-mysql-client.sh` 数据库相关命令：

    * `mq-mysql` 完全替代 `mysql`
    * `mq-mysqldump` 完全替代 `mysqldump`
    
* `install-service.sh` 生成 `thrift` 启动脚本：

    * `mq-bash` 进入容器后执行 `/usr/local/init-service`
    
* 后续流程参照各项目 `README.md` 文档。
    
## 作者

* jiangxilee@gmail.com
* [GitHub](https://github.com/jtleon)