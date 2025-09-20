# 使用 CentOS 7 作为基础镜像
FROM centos:7

# 安装必要的基础工具和Claude Code
RUN yum update -y && \
    yum install -y \
    bash \
    curl \
    git \
    nodejs \
    npm \
    python3 \
    python3-pip \
    golang \
    rsync \
    ca-certificates \
    && yum clean all \
    && npm config set cache /tmp/.npm

RUN echo "iptables -I OUTPUT -p tcp --tcp-flags SYN,RST SYN -j TCPMSS --clamp-mss-to-pmtu" >> /etc/rc.local

# 安装Claude Code CLI
RUN npm install -g @anthropic-ai/claude-code

# 创建工作目录
WORKDIR /workspace

# 创建非root用户
RUN groupadd -g 1000 developer && \
    useradd -u 1000 -g developer -m -s /bin/bash developer

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