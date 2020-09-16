## docker 构建方式
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

