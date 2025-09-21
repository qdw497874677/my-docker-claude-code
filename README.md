# My Docker Claude Code

一个基于Docker的Claude Code开发环境，集成了Claude Code CLI和相关开发工具。

## 🚀 功能特性

- ✅ **完整的开发环境**：内置Node.js 20+、Python 3、Go、Git等
- ✅ **Claude Code CLI**：最新版本的Anthropic Claude Code命令行工具
- ✅ **claude-code-router**：Claude Code路由器
- ✅ **happy-coder**：智能代码助手
- ✅ **网络优化**：内置MSS调整，解决网络连接问题
- ✅ **配置持久化**：自动同步Claude配置文件

## 📋 环境要求

- Docker 20.10+
- Docker Compose 2.0+

## 🛠️ 快速开始

### 1. 构建镜像

```bash
docker-compose build
```

### 2. 启动容器

```bash
docker-compose up -d
```

### 3. 进入容器

```bash
docker-compose exec my-docker-claude-code bash
```

## ⚙️ 配置说明

### 环境变量

在`.env`文件中设置以下环境变量（可选）：

```env
HTTP_PROXY=http://proxy.example.com:8080
HTTPS_PROXY=http://proxy.example.com:8080
NO_PROXY=localhost,127.0.0.1
```

### 数据卷挂载

容器自动挂载以下目录：

- `.` → `/workspace`：当前项目目录
- `./.claude` → `/root/.claude`：Claude配置目录
- `./.claude-code-router` → `/root/.claude-code-router`：Claude Code Router配置
- `./projects` → `/workspace/projects`：项目目录

### 端口映射

- `3456:3456`：Claude Code Router端口

## 📦 内置工具

### 开发工具
- **Node.js 20+**：现代JavaScript运行时
- **Python 3**：Python解释器及pip包管理器
- **Go**：Go语言编译器和工具链
- **Git**：版本控制系统

### Claude Code生态
- **@anthropic-ai/claude-code**：官方Claude Code CLI
- **@musistudio/claude-code-router**：Claude Code路由器
- **happy-coder**：智能代码助手

### 系统工具
- **bash**：命令行Shell
- **curl**：网络请求工具
- **rsync**：文件同步工具
- **ca-certificates**：SSL证书

## 🔧 使用指南

### Claude Code CLI使用

```bash
# 初始化Claude Code
claude-code auth login

# 启动交互式会话
claude-code

# 运行特定命令
claude-code --help
```

### claude-code-router使用

```bash
# 启动路由器
claude-code-router start

# 查看配置
claude-code-router config
```

### happy-coder使用

```bash
# 启动代码助手
happy-coder

# 查看帮助
happy-coder --help
```

## 🌐 网络配置

容器内置了网络优化设置，自动调整TCP MSS值以解决网络连接问题：

```bash
iptables -I OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu
```

## 🐳 常用Docker命令

### 查看容器状态

```bash
docker-compose ps
```

### 查看容器日志

```bash
docker-compose logs -f my-docker-claude-code
```

### 重启容器

```bash
docker-compose restart my-docker-claude-code
```

### 停止容器

```bash
docker-compose down
```

### 清理容器

```bash
docker-compose down -v
```

## 🔍 故障排除

### 1. 网络连接问题

如果遇到网络连接问题，检查网络配置：

```bash
# 检查DNS配置
cat /etc/resolv.conf

# 测试网络连接
ping google.com
```

### 2. 权限问题

确保挂载的目录权限正确：

```bash
# 检查目录权限
ls -la ./.claude

# 修复权限（如果需要）
chmod 755 ./.claude
```

### 3. Claude Code认证问题

如果Claude Code无法认证，检查API密钥配置：

```bash
# 检查Claude配置
cat ~/.claude/config.json

# 重新认证
claude-code auth login
```

## 📝 自定义配置

### 修改基础镜像

编辑`Dockerfile`第2行，更改基础镜像：

```dockerfile
FROM ubuntu:22.04  # 或其他版本
```

### 添加新工具

在`Dockerfile`中添加安装命令：

```dockerfile
RUN apt-get install -y your-tool
```

### 修改端口映射

编辑`docker-compose.yml`中的`ports`部分：

```yaml
ports:
  - "3456:3456"
  - "8080:8080"  # 添加新端口
```

## 🤝 贡献指南

1. Fork本项目
2. 创建功能分支：`git checkout -b feature/new-feature`
3. 提交更改：`git commit -am 'Add new feature'`
4. 推送分支：`git push origin feature/new-feature`
5. 提交Pull Request

## 📄 许可证

本项目采用MIT许可证。详情请参阅[LICENSE](LICENSE)文件。

## 📞 联系方式

如有问题或建议，请通过以下方式联系：

- 提交Issue：[GitHub Issues](https://github.com/your-username/my-docker-claude-code/issues)
- 邮箱：your-email@example.com

---

**提示**：首次使用时，请确保已正确配置Claude Code的API密钥。可以通过`claude-code auth login`命令进行认证配置。