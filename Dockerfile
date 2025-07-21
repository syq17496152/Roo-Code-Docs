# 构建阶段
FROM node:18 AS builder

# 设置工作目录
WORKDIR /app

# 复制package.json和package-lock
COPY package.json package-lock.json ./

# 安装依赖
RUN yarn install --frozen-lockfile

# 复制应用代码
COPY . .

# 构建应用
RUN yarn build

# 生产阶段
FROM nginx:alpine

# 复制构建结果到nginx目录
COPY --from=builder /app/build /usr/share/nginx/html

# 暴露端口
EXPOSE 80

# 启动nginx
CMD ["nginx", "-g", "daemon off;"]  