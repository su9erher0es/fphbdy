# PDF电子发票批量合并打印工具

这是一个高效的PDF电子发票批量合并打印工具，帮助用户节省纸张、提高效率并保护环境。

## 功能特点

### 📄 节省纸张
- 多张发票打印在同一张A4纸上，最多节省75%的纸张
- 支持1张/页、2张/页、4张/页的打印布局
- 自动计算并显示节省的纸张百分比

### ⚡ 提高效率
- 支持拖拽PDF发票文件批量上传
- 一次操作完成多张发票的合并和打印
- 实时显示已上传文件数量、总大小

### 🌱 保护环境
- 合并3000次，就少砍一颗大树
- 自动计算并显示多造的氧气量
- 为环保事业贡献力量

### 🎨 用户友好
- 现代化的响应式界面，支持PC端
- 实时文件列表管理，可随时删除不需要的文件
- 合并过程中的加载状态和进度显示
- 合并后提供PDF预览功能，确保输出效果
- GitHub角标设计，支持查看项目源码
- 使用次数统计功能，记录项目被使用的总次数

### 🔧 技术优势
- 纯前端实现，无需后端服务器
- 完善的错误处理和异常捕获
- 智能内存管理，防止浏览器崩溃
- 支持大文件和多文件处理
- 完全离线运行，无需网络连接

## 如何使用

### 方法一：直接打开
1. 下载项目文件到本地
2. 直接在浏览器中打开 `index.html` 文件

### 方法二：使用本地服务器
1. 下载项目文件到本地
2. 打开命令行工具，进入项目目录
3. 运行以下命令启动本地服务器：
   ```bash
   # 使用Python 3
   python3 -m http.server 8080
   ```
4. 在浏览器中访问 `http://localhost:8080`

### 方法三：使用Docker容器（推荐）
1. 确保已安装Docker和Docker Compose
2. 下载项目文件到本地
3. 打开命令行工具，进入项目目录
4. 运行以下命令启动Docker容器：
   ```bash
   docker-compose up -d
   ```
5. 在浏览器中访问 `http://localhost:55561`

### 使用步骤
1. **上传发票**：点击"选择发票"按钮或直接拖拽PDF文件到浏览器窗口
2. **管理文件**：在文件列表中查看和管理已上传的文件
3. **设置打印选项**：选择每页发票数量和页面方向
4. **合并预览**：点击"合并预览"按钮，查看合并后的PDF效果
5. **下载打印**：下载合并后的PDF文件并打印

## 技术实现

### 核心技术栈
- **前端框架**：HTML5 + CSS3 + JavaScript
- **UI框架**：Bootstrap 5
- **PDF处理**：pdf-lib 库
- **文件下载**：FileSaver.js 库
- **本地存储**：localStorage
- **容器化**：Docker + Docker Compose

### 实现原理
1. **文件上传**：通过HTML5的File API和拖拽API实现文件上传
2. **文件验证**：检查文件类型、大小和数量限制
3. **PDF处理**：使用pdf-lib库加载、合并和操作PDF文件
4. **页面布局**：根据用户选择的每页发票数量和页面方向计算布局
5. **裁剪线绘制**：在合并后的PDF页面上添加虚线作为裁剪参考
6. **预览功能**：使用iframe嵌入PDF文件进行预览
7. **文件下载**：使用FileSaver.js库实现文件下载功能
8. **使用统计**：通过localStorage记录和显示使用次数
9. **容器化部署**：使用Nginx作为Web服务器，通过Docker容器运行

## 项目结构

```
fphbdy/
├── index.html          # 主页面文件
├── README.md           # 项目说明文档
├── Dockerfile          # Docker构建文件
├── docker-compose.yml  # Docker Compose配置文件
├── .dockerignore       # Docker忽略文件
├── .gitignore          # Git忽略文件
├── css/                # CSS样式文件目录
│   └── bootstrap.min.css  # Bootstrap CSS文件
├── js/                 # JavaScript文件目录
│   └── bootstrap.bundle.min.js  # Bootstrap JS文件
└── libs/               # 第三方库目录
    ├── FileSaver.min.js  # 文件下载库
    └── pdf-lib.min.js    # PDF处理库
```

## 功能参数

| 参数 | 值 | 说明 |
|------|-----|------|
| 最大文件数量 | 100个 | 防止浏览器内存溢出 |
| 单个文件大小 | 10MB | 保证处理效率 |
| 总文件大小 | 50MB | 保证处理效率 |
| 最大处理页数 | 1000页 | 防止浏览器崩溃 |
| 页面边距 | 10点 | PDF页面边距设置 |
| 页面间距 | 10点 | 发票之间的间距 |
| Docker容器端口 | 55561 | 外部访问端口 |

## Docker部署

### Docker Compose配置
项目提供了完整的Docker Compose配置，可以快速启动容器：

```yaml
version: '3.8'

services:
  pdf-invoice-merger:
    image: su9erher0es/pdf-invoice-merger:latest
    container_name: pdf-invoice-merger-app
    ports:
      - "55561:80"
    volumes:
      - /opt/pdf-invoice-merger:/usr/share/nginx/html
    restart: unless-stopped
    networks:
      - invoice-network

networks:
  invoice-network:
    driver: bridge
```

### 部署命令
- **启动容器**：`docker-compose up -d`
- **停止容器**：`docker-compose down`
- **查看日志**：`docker-compose logs`

### 自定义配置
如果需要修改配置，可以编辑 `docker-compose.yml` 文件：
- **端口映射**：修改 `ports` 字段中的外部端口
- **数据卷**：修改 `volumes` 字段中的主机目录
- **重启策略**：修改 `restart` 字段的值

## 注意事项

### 系统要求
- **直接打开**：现代浏览器（Chrome 60+、Firefox 55+、Safari 12+、Edge 79+）
- **本地服务器**：Python 3.x 或其他Web服务器
- **Docker部署**：Docker 19.03+ 和 Docker Compose 1.25+

### 支持的文件格式
- 仅支持PDF格式的文件
- 支持标准的PDF文件，包括电子发票、普通PDF文档等

### 性能提示
- 对于大量文件或大文件的处理，可能需要较长时间
- 处理过程中请保持浏览器窗口打开，不要刷新页面
- 如果遇到内存不足的提示，请减少上传的文件数量或大小

### 打印建议
- 使用高质量的打印设置以获得最佳效果
- 打印后可以使用虚线作为参考进行裁剪
- 建议使用双面打印进一步节省纸张

## 常见问题

### Q: 上传文件时显示"文件大小超过限制"怎么办？
A: 单个PDF文件大小不能超过10MB，总文件大小不能超过50MB。请尝试分批处理文件。

### Q: 合并过程中浏览器崩溃了怎么办？
A: 这可能是由于处理的文件过多或过大导致的内存溢出。请减少上传的文件数量，或选择更少的每页发票数量。

### Q: 合并后的PDF文件中的发票显示不全怎么办？
A: 系统会自动调整发票大小以适应页面布局，但如果发票内容特别密集，可能会影响可读性。建议选择合适的每页发票数量。

### Q: Docker容器启动失败怎么办？
A: 请检查以下问题：
1. 确保Docker服务正在运行
2. 检查端口55561是否被占用
3. 查看容器日志以获取详细错误信息：`docker-compose logs`

### Q: 使用Docker部署时如何更新应用？
A: 运行以下命令拉取最新镜像并重启容器：
```bash
docker-compose pull
docker-compose up -d
```

## 贡献指南

欢迎对项目提出改进建议或提交代码。如果您有任何问题或建议，请通过Issue或Pull Request与我们联系。

## 许可证

本项目采用MIT许可证，您可以自由使用、修改和分发本项目。

---

**让我们一起为环保事业贡献力量，从节省每张纸开始！** 🌍