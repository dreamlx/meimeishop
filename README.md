## pg 管理

1. docker-compose

        DATABASE_URL=postgres://postgres:postgres@db/meimei_production

        这里的meimei_production, 如果是开发环境, 可以改为meimei_development

2. 在容器内访问pg
        psql -h db -U postgres
        passwd: postgres

3. 创建test yml, 端口3001
        
        用法, 把test 改为docker-compose.yml

## 20201107 更新

增加rake:

        rake load_sku filename

1 读取 tmp/csv 
2 如果title 同名存在, 那么更新记录
3 如果title 不存在, 那么创建新记录
4 如果主分类存在, 那么设置主分类
5 如果主分类不存在, 那么创建主分类
6 如果子分类存在, 那么设置子分类
7 如果子分类不存在, 那么创建子分类,设置上级主分类
8 如果3级分类存在, 那么设置3级分类
9 如果3级分类不存在, 那么创建3级分类, 设置上级子分类
10 自动设置上传sku属于admin
11 检查价格,自动转换成金额
12 创建discrption 描述字段

## 导出数据库

进入 rails docker 主容器后

        pg_dump -F c -v -U postgres -h db postgres -f /tmp/meimeishop_production.psql

* 解释: db 就是docker file 里面定义的depends_on(link 和 depends_on的区别就是启动次序), 因为是动态加载所以不知道ip,直接用主机名:db 来访问


## docker 构建方式

docker-compose up --build # 重新构建
docker-compose down #停止
docker-compose up #启动
docker-compose run app rake db:migrate # 执行迁移
docker-compose run app rake db:seed # 数据加载

dockerfile 指定代理

        ARG http_proxy=http://127.0.0.1:2222
        ARG https_proxy=http://127.0.0.1:2222

国内debian源

        ADD sources.list /etc/apt/
        sources.list在dockerfile同目录下

osx 配置docker

          {
                "debug": true,
                "experimental": true,
                "registry-mirrors": [
                "https://dockerhub.azk8s.cn",
                "http://hub-mirror.c.163.com"
                ],
                "insecure-registries" : [ "47.92.240.100:5000" ]
                
          }

## Commit message 格式

        为了方便使用，我们避免了过于复杂的规定，格式较为简单且不限制中英文：
        <type>(<scope>): <subject>
        // 注意冒号 : 后有空格
        // 如 feat(miniprogram): 增加了小程序模板消息相关功能
        复制代码scope选填表示commit的作用范围，如数据层、视图层，也可以是目录名称
        subject必填用于对commit进行简短的描述
        type必填表示提交类型，值有以下几种：

        feat - 新功能 feature
        fix - 修复 bug
        docs - 文档注释
        style - 代码格式(不影响代码运行的变动)
        refactor - 重构、优化(既不增加新功能，也不是修复bug)
        perf - 性能优化
        test - 增加测试
        chore - 构建过程或辅助工具的变动
        revert - 回退
        build - 打包

