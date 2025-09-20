# Claude Code Docker 开发环境

这是一个轻量级的Docker环境，专门用于Claude Code项目开发。

## 使用方法

### 启动容器
```bash
docker-compose up -d
```

### 进入容器
```bash
docker-compose exec claude-code bash
```

### 停止容器
```bash
docker-compose down
```

## 挂载的目录

- `~/.claude` - Claude配置文件
- `~/.ssh` - SSH密钥（只读）
- `~/.gitconfig` - Git配置（只读）
- `./projects` - 项目目录
- npm缓存卷

## 容器内预装工具

- bash
- curl
- git
- nodejs & npm
- python3 & pip
- go
- rsync