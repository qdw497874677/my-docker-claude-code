# 使用 Alpine Linux 作为基础镜像，轻量且安全
FROM alpine:3.19

# 安装必要的基础工具和Claude Code
RUN apk add --no-cache \
    bash \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    py3-pip \
    go \
    rsync \
    ca-certificates \
    && rm -rf /var/cache/apk/* \
    && npm config set cache /tmp/.npm

# 安装Claude Code CLI
RUN curl -fsSL https://claude.ai/install.sh | sh

# 创建工作目录
WORKDIR /workspace

# 创建非root用户
RUN addgroup -g 1000 -S developer && \
    adduser -u 1000 -S developer -G developer

# 设置环境变量
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
ENV HOME=/home/developer

# 复制Claude Code配置（如果有）
COPY --chown=developer:developer CLAUDE.local.md /home/developer/.claude/CLAUDE.md

# 切换到非root用户
USER developer

# 设置默认工作目录
WORKDIR /workspace

# 暴露常用端口（如果需要）
EXPOSE 3000 8000 8080

# 默认启动bash
CMD ["/bin/bash"]