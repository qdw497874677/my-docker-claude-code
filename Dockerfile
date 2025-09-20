# 使用 alpine 基础镜像，手动安装 Node.js
FROM alpine:latest

# 安装必要的系统依赖和 Node.js
RUN apk add --no-cache \
    git \
    curl \
    bash \
    python3 \
    py3-pip \
    docker \
    nodejs \
    npm \
    && rm -rf /var/cache/apk/*

# 设置工作目录
WORKDIR /workspace

# 全局安装 Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# 创建非 root 用户
RUN addgroup -g 1000 -S developer && \
    adduser -u 1000 -S developer -G developer

# 切换到 developer 用户
USER developer

# 设置环境变量
ENV PATH=/home/developer/.npm-global/bin:$PATH
ENV CLAUDE_CODE_CONFIG_DIR=/home/developer/.claude
ENV EDITOR=vim

# 创建必要目录
RUN mkdir -p /home/developer/.claude && \
    mkdir -p /workspace

# 设置入口点
ENTRYPOINT ["claude"]
CMD ["--help"]