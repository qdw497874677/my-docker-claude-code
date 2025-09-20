# Claude Code Docker 开发环境

这是一个轻量级的Docker环境，专门用于Claude Code项目开发。

## 使用方法

### 构建容器

#### 通过Docker Compose构建（推荐）
```bash
docker-compose build
```

#### 通过Dockerfile直接构建
```bash
docker build -t my-docker-claude-code .
```

### 启动容器

#### 通过Docker Compose启动（推荐）
```bash
docker-compose up -d
```

#### 通过Docker直接运行
```bash
docker run -it --name my-docker-claude-code \
  -v $(pwd):/workspace \
  -v ${HOME}/.claude:/home/developer/.claude \
  -v ${HOME}/.ssh:/home/developer/.ssh:ro \
  -v ${HOME}/.gitconfig:/home/developer/.gitconfig:ro \
  my-docker-claude-code
```

### 进入容器
```bash
docker-compose exec claude-code bash
```

### 停止容器
```bash
docker-compose down
```

### 重新构建并启动
```bash
docker-compose up -d --build
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