FROM xhofe/alist:latest
LABEL MAINTAINER="i@nn.ci"
WORKDIR /opt/alist/
# RUN chmod 777 /opt/alist/data
# ADD entrypoint.sh /entrypoint.sh
ADD config.json /config.json
# RUN chmod +x /entrypoint.sh

EXPOSE 5244

ENV DB_TYPE=postgres
ENV CACHE_EXPIRATION=60
ENV CACHE_CLEANUP_INTERVAL=120

# ENTRYPOINT ["sh", "/entrypoint.sh"]


# 将 ENTRYPOINT 设置为 /bin/sh，这是一个Shell
ENTRYPOINT ["/bin/sh"]

# 将 CMD 设置为执行 'cd /app && ls'，这将在容器启动时切换到 /app 目录并列出其内容
CMD ["-c", "cd /opt/alist && ./alist -conf config.json"]
