# lidongchengsay - 话题讨论社区系统

一个基于 Spring + JPA + Hibernate 构建的话题讨论社区平台，支持话题发布、评论互动、用户关注、收藏等功能。

## 项目简介

lidongchengsay是一个完整的社区论坛系统，提供了话题发布、评论回复、用户系统、节点分类、文件上传等功能。项目采用经典的 SSM（Spring + Spring MVC + Hibernate）架构，使用 Spring Data JPA 进行数据持久化，集成七牛云存储服务处理文件上传。

## 技术栈

### 后端技术
- **Spring Framework 4.2.5** - IoC容器和AOP支持
- **Spring MVC 4.2.5** - Web MVC框架
- **Spring Data JPA 1.9.4** - 数据访问层
- **Hibernate 5.1.0** - ORM框架
- **Hibernate Validator 5.2.4** - 数据验证

### 数据库
- **MySQL 5.6+** / **MariaDB 10+** - 关系型数据库
- **Druid 0.2.19** - 数据库连接池
- **Ehcache 2.6.11** - 二级缓存

### 前端技术
- **JSP + JSTL** - 视图层模板引擎
- **Bootstrap** - UI框架
- **jQuery** - JavaScript库

### 第三方服务
- **七牛云存储** - 文件/图片/音频上传
- **JavaMail 1.5.4** - 邮件发送服务

### 其他技术
- **Maven** - 项目构建管理
- **Log4j + SLF4J** - 日志管理
- **Jackson 2.7.3** - JSON序列化
- **AspectJ** - AOP切面编程
- **Apache Commons FileUpload** - 文件上传处理

## 功能模块

### 1. 用户系统
- 用户注册、登录、退出
- 个人资料编辑（昵称、邮箱、头像、公司、位置、GitHub、主页等）
- 密码重置和找回
- 用户关注/取消关注
- 查看用户主页和动态

### 2. 话题管理
- 话题发布（支持Markdown格式）
- 话题编辑和删除
- 话题浏览和详情查看
- 话题收藏/取消收藏
- 话题点赞统计
- 话题浏览量统计
- 话题评论数统计

### 3. 评论系统
- 评论发布和编辑
- 楼层显示
- 评论点赞
- @用户提醒

### 4. 节点分类
- 节点（专辑）管理
- 分区（Section）管理
- 节点关注功能
- 按节点浏览话题

### 5. 通知系统
- 评论通知
- @提醒通知
- 系统消息
- 未读消息提示

### 6. 文件上传
- 图片上传（集成七牛云）
- 音频上传（集成七牛云）
- 文件预览
- 最大文件大小：50MB

### 7. 后台管理
- 用户管理
- 话题管理
- 评论管理
- 节点管理
- 分区管理
- 页面管理
- 系统配置
- 邮件发送
- 文件管理

### 8. 其他功能
- 页面缓存（Ehcache）
- 富文本编辑器
- Markdown预览
- 响应式布局

## 数据库设计

系统包含以下核心数据表：

| 表名 | 说明 |
|------|------|
| user | 用户表 |
| topic | 话题表 |
| comment | 评论表 |
| node | 节点（专辑）表 |
| section | 分区表 |
| collection | 收藏表 |
| follow | 关注表 |
| focus | 节点关注表 |
| notification | 通知表 |
| page | 页面表 |
| property | 属性配置表 |
| field | 字段表 |
| up_fileinfo | 上传文件信息表 |
| comment_user | 评论点赞关联表 |

## 环境要求

- **JDK 8+**
- **Maven 3+**
- **MySQL 5.6+** 或 **MariaDB 10+**
- **Tomcat 7+**

## 安装部署

### 1. 克隆项目
```bash
git clone <repository-url>
cd wodedata
```

### 2. 数据库配置
执行数据库初始化脚本：
```bash
mysql -u root -p < src/main/resources/database_init(noconstraint).sql
```

### 3. 配置文件修改
编辑 `src/main/resources/application.properties`，修改以下配置：

#### 数据库配置
```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/lidongchengsay?useUnicode=true&characterEncoding=utf-8
jdbc.user=root
jdbc.password=your_password
```

#### 七牛云存储配置
申请[七牛云存储](https://www.qiniu.com/)账号并创建空间，然后配置：
```properties
qiniu.accessKey=your_access_key
qiniu.secretKey=your_secret_key
qiniu.space=your_space_name
qiniu.domain=your_domain
```

> **注意**：七牛云存储有免费额度，建议配置后使用。否则文件上传功能将不可用。

#### 邮件服务配置（可选）
```properties
email.host=smtp.example.com
email.port=587
email.username=your_email@example.com
email.password=your_email_password
```

### 4. 编译打包
```bash
mvn clean install
```

### 5. 部署到Tomcat
将编译后的war包部署到Tomcat：
```bash
# 方法1：直接替换ROOT
cp target/wodedata.war $TOMCAT_HOME/webapps/ROOT.war
rm -rf $TOMCAT_HOME/webapps/ROOT

# 方法2：作为独立应用部署
cp target/wodedata.war $TOMCAT_HOME/webapps/
```

### 6. 启动服务
```bash
$TOMCAT_HOME/bin/startup.sh
```

访问：`http://localhost:8080/`

### 7. 生产环境配置（推荐）
使用Nginx反向代理监听80端口：
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }
}
```

## 使用说明

### 默认账号
- **用户名**：`springabc`
- **密码**：`springabc`

### 后台管理
访问 `http://your-domain/back/` 进入后台管理界面，可以配置：
- 分类节点
- 导航菜单
- 系统参数
- 内容审核

### 话题发布
1. 登录系统
2. 点击"发布话题"按钮
3. 填写标题和内容（支持Markdown格式）
4. 选择合适的节点分类
5. 可上传图片、音频文件（会直接上传到七牛云并生成预览）
6. 点击发布

### Markdown支持
编辑器支持 [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown) 语法，可以点击"preview"预览渲染效果。

## 项目结构

```
wodedata/
├── src/main/
│   ├── java/com/wodedata/
│   │   ├── domin/           # 实体类（JPA Entity）
│   │   ├── repository/      # 数据访问层（Repository）
│   │   ├── service/         # 业务逻辑层（Service）
│   │   ├── web/             # Web控制层
│   │   │   ├── back/        # 后台管理控制器
│   │   │   ├── front/       # 前台控制器
│   │   │   ├── form/        # 表单对象
│   │   │   ├── viewmodel/   # 视图模型
│   │   │   ├── helper/      # 辅助类
│   │   │   ├── interceptor/ # 拦截器
│   │   │   ├── listener/    # 监听器
│   │   │   └── taglib/      # 自定义标签
│   │   └── error/           # 异常处理
│   ├── resources/
│   │   ├── applicationContext.xml  # Spring配置
│   │   ├── mvc.xml                 # Spring MVC配置
│   │   ├── application.properties  # 应用配置
│   │   ├── ehcache.xml            # Ehcache配置
│   │   ├── log4j.properties       # 日志配置
│   │   └── database_init(noconstraint).sql  # 数据库初始化脚本
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── jsp/         # JSP页面
│       │   │   ├── home/    # 首页相关
│       │   │   ├── topics/  # 话题相关
│       │   │   ├── users/   # 用户相关
│       │   │   ├── nodes/   # 节点相关
│       │   │   ├── comments/# 评论相关
│       │   │   └── BACK/    # 后台管理页面
│       │   └── web.xml      # Web配置
│       ├── css/             # 样式文件
│       ├── js/              # JavaScript文件
│       ├── img/             # 图片资源
│       └── fonts/           # 字体文件
└── pom.xml                  # Maven配置
```

## 版本历史

### v1.2
- 删除在话题正文上传文件按钮及相关逻辑
- 添加图片音频直接上传七牛并预览功能

### v1.1.0
- 添加/修改话题页面
- 上传文件时可直接插入正文的形式

### v1.0
- 初始版本发布
- 基础功能实现

## 开发说明

### 开发环境
- 开发分支：`lidongchengsay`
- 主分支：（当前无主分支）

### 本地开发配置
```properties
# 开发环境数据库
jdbc.url=jdbc:mysql://localhost:3306/lidongchengsay
jdbc.user=root
jdbc.password=root
```

## 注意事项

1. **七牛云存储配置**：必须配置七牛云存储才能使用文件上传功能，七牛提供免费额度
2. **Session配置**：默认Session永不超时（-1），生产环境建议修改
3. **文件大小限制**：最大上传文件为50MB
4. **数据库编码**：建议使用UTF-8编码
5. **缓存配置**：项目使用Ehcache作为二级缓存，可根据需要调整配置

## 常见问题

**Q: 文件上传失败？**
A: 检查七牛云配置是否正确，包括AccessKey、SecretKey、空间名称和域名。

**Q: 数据库连接失败？**
A: 检查MySQL服务是否启动，数据库名称、用户名、密码是否正确。

**Q: 启动报错找不到类？**
A: 运行 `mvn clean install` 重新编译项目。

**Q: 页面样式丢失？**
A: 检查静态资源路径配置，确保CSS/JS文件可以正常访问。

## 技术支持

如有问题或建议，欢迎提交Issue或联系开发者。

## 许可证

本项目代码仅供学习交流使用。

---

**Build Up Your Community!** 🚀
