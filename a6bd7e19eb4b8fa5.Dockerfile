# 多阶段Dockerfile用于构建Go应用

# 第一阶段：构建阶段
FROM golang:1.21-alpine AS builder

# 设置工作目录
WORKDIR /app

# 复制go.mod和go.sum文件（如果存在）
COPY go.mod go.sum ./

# 下载依赖（如果go.mod存在）
RUN go mod download 2>/dev/null || true

# 复制源代码
COPY . .

# 构建应用
RUN CGO_ENABLED=0 GOOS=linux go build -o main .

# 第二阶段：运行阶段
FROM alpine:latest

# 安装ca-certificates，以便应用可以进行HTTPS请求
RUN apk --no-cache add ca-certificates

# 设置工作目录
WORKDIR /root/

# 从构建阶段复制二进制文件
COPY --from=builder /app/main .

# 暴露端口
EXPOSE 8080

# 定义启动命令
CMD ["./main"]