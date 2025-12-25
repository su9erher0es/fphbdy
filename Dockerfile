# 使用官方的Nginx镜像作为基础
FROM nginx:alpine

# 设置维护者信息
LABEL maintainer="su9erher0es@gmail.com"

# 复制项目文件到Nginx的默认站点目录
COPY . /usr/share/nginx/html

# 复制自定义的Nginx配置文件（如果需要）
# COPY nginx.conf /etc/nginx/conf.d/default.conf

# 暴露80端口
EXPOSE 80

# 启动Nginx服务器
CMD ["nginx", "-g", "daemon off;"]