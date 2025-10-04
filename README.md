# Wodedata - 话题讨论社区系统

一个基于 Spring + JPA + Hibernate 构建的话题讨论社区平台，支持话题发布、评论互动、用户关注、收藏等功能，集成七牛云存储实现图片/音频直接上传预览。

## 项目简介

Wodedata是一个完整的社区论坛系统，提供了话题发布、评论回复、用户系统、节点分类、文件上传等功能。项目采用经典的 SSM（Spring + Spring MVC + Hibernate）架构，使用 Spring Data JPA 进行数据持久化，集成七牛云存储服务处理文件上传。

### 主要特色
- ✅ 完整的用户系统（注册、登录、资料管理、关注）
- ✅ 话题发布与管理（支持 Markdown 格式）
- ✅ 评论系统（楼层显示、点赞、@提醒）
- ✅ 节点分类管理（专辑、分区）
- ✅ 文件上传（图片/音频直接上传七牛云并预览）
- ✅ 后台管理系统（内容管理、用户管理、系统配置）
- ✅ 消息通知系统
- ✅ 页面缓存优化（Ehcache）

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
- **Markdown编辑器** - 支持实时预览

### 第三方服务
- **七牛云存储 SDK 7.0.0** - 文件/图片/音频上传
- **JavaMail 1.5.4** - 邮件发送服务

### 其他技术
- **Maven** - 项目构建管理
- **Log4j + SLF4J** - 日志管理
- **Jackson 2.7.3** - JSON序列化
- **AspectJ** - AOP切面编程
- **Apache Commons FileUpload** - 文件上传处理
- **Apache Commons Codec** - 编码工具

## 功能模块

### 1. 用户系统
- 用户注册、登录、退出
- 个人资料编辑（昵称、邮箱、头像、公司、位置、GitHub、主页等）
- 密码重置和找回
- 用户关注/取消关注
- 查看用户主页和动态
- 用户角色权限管理（admin、editor、member）

### 2. 话题管理
- 话题发布（支持 GitHub Flavored Markdown 格式）
- 话题编辑和删除（权限控制）
- 话题浏览和详情查看
- 话题收藏/取消收藏
- 话题点赞统计
- 话题浏览量统计
- 话题评论数统计
- 图片/音频预览字段支持
- 话题软删除机制

### 3. 评论系统
- 评论发布和编辑
- 楼层显示
- 评论点赞
- @用户提醒
- 评论权限控制

### 4. 节点分类
- 节点（专辑）管理
- 分区（Section）管理
- 节点关注功能
- 按节点浏览话题
- 节点话题数量统计

### 5. 通知系统
- 评论通知
- @提醒通知
- 系统消息
- 未读消息提示

### 6. 文件上传
- 图片上传（集成七牛云，直接上传并预览）
- 音频上传（集成七牛云，直接上传并预览）
- 文件信息记录（文件名、类型、大小、URL、hash等）
- 文件与话题/节点/分区关联
- 文件删除和更新管理
- 最大文件大小：50MB

### 7. 后台管理
- 用户管理（用户列表、角色分配）
- 话题管理（审核、编辑、删除）
- 评论管理（审核、删除）
- 节点管理（添加、编辑、删除）
- 分区管理（添加、编辑、删除）
- 页面管理（静态页面编辑）
- 系统配置（站点信息、导航、广告等）
- 邮件发送
- 文件管理（上传文件列表）

### 8. 其他功能
- 页面缓存（Ehcache）
- 富文本编辑器
- Markdown实时预览
- 响应式布局
- Session监听器
- 启动监听器
- 自定义标签库

## 数据库设计

系统包含以下核心数据表：

| 表名 | 说明 | 主要字段 |
|------|------|----------|
| user | 用户表 | id, username, email, password, nick, role, avatar 等 |
| topic | 话题表 | id, title, content, user_id, node_id, view_count, comment_count, preImage, preAudio 等 |
| comment | 评论表 | id, content, topic_id, user_id, floor, like_count 等 |
| node | 节点（专辑）表 | id, name, description, section_id, topic_count 等 |
| section | 分区表 | id, name, sort |
| collection | 收藏表 | id, topic_id, user_id, create_at |
| follow | 关注表 | id, follower_id, following_id, create_at |
| focus | 节点关注表 | id, node_id, user_id, create_at |
| notification | 通知表 | id, user_id, comment_id, type, status |
| page | 页面表 | id, title, url, content, view_count |
| property | 属性配置表 | id, keyword, name |
| field | 字段表 | id, property_id, meta, content |
| up_fileinfo | 上传文件信息表 | id, fileName, fileType, fileSize, url, fileKey, fileHash, topic_id, node_id, section_id |
| comment_user | 评论点赞关联表 | comment_id, user_id |

### 关键数据表说明

#### topic 表（话题表）
- `preImage`: 话题预览图片URL（七牛云存储）
- `preAudio`: 话题预览音频URL（七牛云存储）
- 支持软删除（status字段）

#### up_fileinfo 表（文件信息表）
- 记录所有上传到七牛云的文件信息
- 关联到具体的话题、节点和分区
- 支持文件删除时同步清理

## 环境要求

- **JDK 8+**
- **Maven 3+**
- **MySQL 5.6+** 或 **MariaDB 10+**
- **Tomcat 7+**
- **七牛云存储账号**（用于文件上传）

## 安装部署

### 1. 克隆项目
```bash
git clone <repository-url>
cd wodedata
```

### 2. 数据库配置

#### 创建数据库并导入数据
```bash
# 登录MySQL
mysql -u root -p

# 导入初始化脚本
mysql -u root -p < src/main/resources/database_init(noconstraint).sql
```

数据库脚本会自动创建 `lidongchengsay` 数据库并初始化所有表结构和示例数据。

### 3. 配置文件修改

编辑 `src/main/resources/application.properties`，修改以下配置：

#### 数据库配置
```properties
jdbc.driver=com.mysql.jdbc.Driver
jdbc.url=jdbc:mysql://localhost:3306/lidongchengsay?useUnicode=true&characterEncoding=utf-8
jdbc.user=root
jdbc.password=your_password
```

#### 七牛云存储配置（必须配置）
申请[七牛云存储](https://www.qiniu.com/)账号并创建空间，然后配置：

```properties
qiniu.accessKey=your_access_key
qiniu.secretKey=your_secret_key
qiniu.space=your_space_name
qiniu.domain=your_domain.clouddn.com
```

> **重要**：七牛云存储配置是必须的，否则图片和音频上传功能将无法使用。七牛提供免费额度，足够开发和测试使用。

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

编译成功后会在 `target` 目录下生成 `wodedata.war` 文件。

### 5. 部署到Tomcat

#### 方法1：部署为ROOT应用
```bash
# 备份并清理原有ROOT应用
mv $TOMCAT_HOME/webapps/ROOT $TOMCAT_HOME/webapps/ROOT.bak
rm -rf $TOMCAT_HOME/webapps/ROOT

# 复制war包并重命名
cp target/wodedata.war $TOMCAT_HOME/webapps/ROOT.war
```

#### 方法2：部署为独立应用
```bash
cp target/wodedata.war $TOMCAT_HOME/webapps/
```

### 6. 启动服务
```bash
# Linux/Mac
$TOMCAT_HOME/bin/startup.sh

# Windows
%TOMCAT_HOME%\bin\startup.bat
```

访问：
- 方法1部署：`http://localhost:8080/`
- 方法2部署：`http://localhost:8080/wodedata/`

### 7. 生产环境配置（推荐）

#### 使用Nginx反向代理
```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:8080;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
        proxy_set_header X-Forwarded-Proto $scheme;
    }

    # 静态资源缓存
    location ~* \.(css|js|jpg|jpeg|png|gif|ico|woff|woff2|ttf|svg)$ {
        proxy_pass http://localhost:8080;
        expires 30d;
        add_header Cache-Control "public, immutable";
    }
}
```

## 使用说明

### 默认账号

系统初始化后包含以下测试账号：

| 用户名 | 密码 | 角色 | 说明 |
|--------|------|------|------|
| luowei | luowei | admin | 超级管理员 |
| admin | admin | admin | 管理员 |
| lidongcheng | lidongcheng | editor | 编辑（可发布话题） |
| abc123 | abc123 | member | 普通会员（仅可评论） |

### 权限说明
- **admin（管理员）**：完整的后台管理权限，可发布话题
- **editor（编辑）**：可发布话题，无后台管理权限
- **member（普通会员）**：只能浏览和评论，不能发布话题

### 后台管理

访问 `http://your-domain/back/` 进入后台管理界面（需要admin权限），可以进行：

1. **应用设置**：站点信息、导航配置、提示语等
2. **内容管理**：
   - 话题管理：审核、编辑、删除话题
   - 评论管理：审核、删除评论
   - 节点管理：创建和管理话题分类
   - 分区管理：创建和管理节点分区
   - 页面管理：编辑静态页面
   - 文件管理：查看上传文件列表
3. **用户管理**：查看用户列表、分配角色
4. **邮件管理**：发送系统邮件
5. **状态监控**：查看系统运行状态

### 话题发布流程

1. 使用 editor 或 admin 角色账号登录
2. 点击"发布话题"按钮
3. 填写话题信息：
   - **标题**：1-60个字符
   - **内容**：支持 Markdown 格式，6-60000个字符
   - **选择节点**：选择合适的话题分类
   - **预览图片**（可选）：上传图片会自动上传到七牛云并显示预览
   - **预览音频**（可选）：上传音频会自动上传到七牛云并显示预览
4. 点击"Preview"预览 Markdown 渲染效果
5. 点击"发布"提交

### Markdown支持

编辑器支持 [GitHub Flavored Markdown](https://help.github.com/articles/github-flavored-markdown) 语法，包括：
- 标题（#, ##, ###）
- 列表（有序、无序）
- 代码块（```语言）
- 链接、图片
- 表格
- 引用
- 粗体、斜体

### 文件上传说明

1. **图片上传**：
   - 支持格式：JPG, PNG, GIF等
   - 自动上传到七牛云
   - 返回可访问的URL
   - 支持实时预览

2. **音频上传**：
   - 支持格式：MP3, WAV等
   - 自动上传到七牛云
   - 返回可访问的URL
   - 支持实时预览

3. **文件管理**：
   - 所有上传的文件信息都会记录在数据库
   - 删除或更新话题时会自动处理关联的文件
   - 后台可查看所有上传文件列表

## 项目结构

```
wodedata/
├── src/main/
│   ├── java/com/wodedata/
│   │   ├── domin/              # 实体类（JPA Entity）
│   │   │   ├── User.java       # 用户实体
│   │   │   ├── Topic.java      # 话题实体（包含preImage/preAudio）
│   │   │   ├── Comment.java    # 评论实体
│   │   │   ├── Node.java       # 节点实体
│   │   │   ├── Section.java    # 分区实体
│   │   │   ├── UpFileInfo.java # 文件信息实体
│   │   │   └── ...
│   │   ├── repository/         # 数据访问层（Spring Data JPA Repository）
│   │   │   ├── UserRepo.java
│   │   │   ├── TopicRepo.java
│   │   │   ├── UpFileRepo.java
│   │   │   └── ...
│   │   ├── service/            # 业务逻辑层（Service）
│   │   │   ├── UserServ.java
│   │   │   ├── TopicServ.java
│   │   │   ├── UploadFileServ.java
│   │   │   └── support/        # 辅助服务
│   │   ├── web/                # Web控制层
│   │   │   ├── back/           # 后台管理控制器
│   │   │   │   ├── AppC.java
│   │   │   │   ├── ContentTopicC.java
│   │   │   │   ├── ContentNodesC.java
│   │   │   │   ├── UpFileC.java
│   │   │   │   └── ...
│   │   │   ├── front/          # 前台控制器
│   │   │   │   ├── HomeC.java
│   │   │   │   ├── TopicC.java
│   │   │   │   ├── UserC.java
│   │   │   │   ├── UploadC.java
│   │   │   │   └── ...
│   │   │   ├── form/           # 表单对象
│   │   │   ├── viewmodel/      # 视图模型
│   │   │   ├── helper/         # 辅助类
│   │   │   │   └── ReadData.java
│   │   │   ├── interceptor/    # 拦截器
│   │   │   ├── listener/       # 监听器
│   │   │   │   ├── StartUpListener.java
│   │   │   │   └── SessionListener.java
│   │   │   └── taglib/         # 自定义标签
│   │   └── error/              # 异常处理
│   │       └── ExceptionHandler.java
│   ├── resources/
│   │   ├── applicationContext.xml    # Spring配置
│   │   ├── mvc.xml                   # Spring MVC配置
│   │   ├── application.properties    # 应用配置
│   │   ├── ehcache.xml              # Ehcache配置
│   │   ├── log4j.properties         # 日志配置
│   │   ├── TopicTemplate.md         # 话题模板
│   │   ├── database_init(noconstraint).sql  # 数据库初始化脚本
│   │   └── mailTemplet/             # 邮件模板
│   └── webapp/
│       ├── WEB-INF/
│       │   ├── jsp/                 # JSP页面（81个）
│       │   │   ├── home/            # 首页相关
│       │   │   ├── topics/          # 话题相关（create, edit, show）
│       │   │   ├── users/           # 用户相关
│       │   │   ├── nodes/           # 节点相关
│       │   │   ├── comments/        # 评论相关
│       │   │   ├── notifications/   # 通知相关
│       │   │   ├── account/         # 账号相关
│       │   │   └── BACK/            # 后台管理页面
│       │   │       ├── app/         # 应用设置
│       │   │       ├── content/     # 内容管理
│       │   │       │   ├── topics/
│       │   │       │   ├── nodes/
│       │   │       │   ├── upfile/  # 文件管理
│       │   │       │   └── ...
│       │   │       └── users/       # 用户管理
│       │   └── web.xml              # Web配置
│       ├── css/                     # 样式文件
│       ├── js/                      # JavaScript文件
│       │   └── uploadFile.js        # 文件上传JS
│       ├── img/                     # 图片资源
│       │   └── favicon.png          # 站点图标
│       └── fonts/                   # 字体文件
└── pom.xml                          # Maven配置
```

## 版本历史

### 当前版本 (Master分支)
- ✅ 完善图片音频直接上传七牛并预览功能
- ✅ 改进话题创建和编辑页面UI
- ✅ 修改favicon图标
- ✅ 修改话题标题长度验证（1-60字符）
- ✅ 优化文件上传逻辑
- ✅ 添加文件删除和更新管理

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

### 代码规范
- 实体类使用JPA注解
- Service层负责业务逻辑
- Controller层只负责请求处理和响应
- Repository层使用Spring Data JPA

### 关键实现

#### 1. 文件上传流程
```
用户选择文件 → 前端AJAX上传 → UploadC接收 →
上传到七牛云 → 保存文件信息到数据库 → 返回URL给前端 →
前端显示预览 → 提交话题时关联文件
```

#### 2. 话题更新时的文件处理
- 比对新旧文件URL
- 如果文件发生变化，删除旧文件记录和云端文件
- 更新新文件的关联信息

#### 3. 权限控制
- 使用Interceptor拦截器进行权限检查
- Session中存储用户信息
- Controller方法中检查用户角色

### 数据库连接池配置
```properties
jdbc.pool.minIdle=10          # 最小空闲连接数
jdbc.pool.maxActive=20        # 最大活动连接数
jdbc.pool.maxWait=60000       # 最大等待时间
```

### 缓存配置
- 使用Ehcache进行二级缓存
- 配置文件：`src/main/resources/ehcache.xml`
- 可根据实际情况调整缓存策略

## 注意事项

### 必须配置项
1. ✅ **数据库配置**：正确的数据库连接信息
2. ✅ **七牛云配置**：必须配置，否则无法上传文件
3. ⚠️ **Session配置**：默认Session永不超时（-1），生产环境建议修改

### 文件上传限制
- 最大文件大小：50MB
- 支持的图片格式：JPG, PNG, GIF等
- 支持的音频格式：MP3, WAV等

### 数据库相关
- 数据库编码必须为UTF-8
- 建议使用InnoDB存储引擎
- 定期备份数据库

### 安全建议
1. 修改默认账号密码
2. 配置生产环境的Session超时时间
3. 配置HTTPS（生产环境）
4. 定期更新依赖版本
5. 不要将application.properties中的密钥提交到公开仓库

### 性能优化建议
1. 启用Ehcache缓存
2. 配置合适的数据库连接池大小
3. 使用CDN加速静态资源
4. 启用Gzip压缩
5. 使用Nginx进行负载均衡

## 常见问题

### Q: 文件上传失败？
**A**: 检查以下几点：
1. 七牛云AccessKey和SecretKey是否正确
2. 空间名称和域名是否正确
3. 七牛云空间是否已创建并设置为公开
4. 网络连接是否正常

### Q: 数据库连接失败？
**A**: 检查以下几点：
1. MySQL服务是否已启动
2. 数据库名称、用户名、密码是否正确
3. 数据库URL是否正确（端口、编码等）
4. 防火墙是否阻止连接

### Q: 启动报错找不到类？
**A**: 运行以下命令：
```bash
mvn clean install
```

### Q: 页面样式丢失？
**A**: 检查静态资源路径配置，确保CSS/JS文件可以正常访问。

### Q: 普通用户无法发布话题？
**A**: 这是正常的权限控制，只有editor和admin角色可以发布话题。在后台管理中可以修改用户角色。

### Q: 话题中的图片无法显示？
**A**: 检查七牛云域名配置是否正确，图片URL是否可以正常访问。

## 技术支持

如有问题或建议，欢迎通过以下方式联系：
- 提交 Issue
- QQ: 745054025

## 许可证

本项目代码仅供学习交流使用。

---

**Build Up Your Community!** 🚀

*基于 Spring 4.2.5 + Hibernate 5.1.0 + 七牛云存储构建*
