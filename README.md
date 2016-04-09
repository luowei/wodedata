#Spring-abc

#环境要求
* Java8+ 
* Maven3+ 
* MariaDB10+(Mysql5.6+) 
* Tomcat7+

#安装
1. 下载源码，执行```database.sql```
2. 解压后修改```src/main/resources/application.properties```里面的jdbc设置
3. 申请一个['七牛云存储']()的空间,然后配置```application.properties```的qiuniu配置
4. 终端执行命令```mvn install```构建，配置依赖编译
5. 把编译完成的内容，替换```$TOMCAT_HOME/webapps/ROOT```文件
6. 执行```$TOMCAT_HOME/bin/startup.sh```，浏览器打开```htttp://localhost:8080/```访问
7. 使用Nginx监听```80```端口转发请求
>七牛云存储有一定量免费流量，可以配置一个免费的空间存储文件，按照信息填写配置。否则文件上传功能不可用

#使用
1. 默认账户 springabc springabc
2. ```$youpath/back/``后台,配置分类节点，导航等

work_imac mysql:root/root

v1.1.0 :添加/修改话题页面,上传文件是可直接插入正文的形式;
v1.2 : 删除在话题正文上传文件按钮及相关逻辑;添加图片音频直接上传七牛并预览;

