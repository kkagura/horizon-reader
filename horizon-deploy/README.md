# Horizon 离线镜像部署资料

这个目录用于把 Horizon 做成一个可上传到服务器的 Docker 镜像包。

流程很简单：

```text
本地构建 Horizon 镜像 -> 导出 horizon-image.tar -> 上传到服务器 -> 执行 server-run.sh
```

推荐部署方式：

```text
/opt/horizon-deploy/
  horizon-image.tar
  server-run.sh
  env.example
  config.example.json
  .env
  data/
    config.json
    summaries/
  reports/
```

Horizon 只负责生成 Markdown。后续 Web 阅读器只需要读取 `reports/` 目录。

## 1. 本地构建并导出镜像

在本机执行：

```powershell
cd E:\wang\horizon-reader\horizon-deploy
.\build-image.ps1
```

脚本会：

- 让 Docker 直接使用 Horizon 官方 GitHub 仓库作为远程构建上下文。
- 使用 Horizon 官方 Dockerfile 构建镜像。
- 应用豆包兼容补丁，避免向不支持 JSON mode 的豆包模型传 `response_format=json_object`。
- 导出镜像为 `horizon-image.tar`。

说明：Horizon 不是直接拉取公开镜像的使用方式，所以这里采用本地构建后上传镜像 tar 的方式。本地不会把 Horizon 源码纳入当前项目。

## 2. 上传到服务器

上传这些文件到服务器同一个目录，例如 `/opt/horizon-deploy/`：

```text
horizon-image.tar
server-run.sh
env.example
config.example.json
```

服务器只需要安装 Docker，不需要 Git、Python、uv 或 Docker Compose。

## 3. 第一次运行

```bash
cd /opt/horizon-deploy
chmod +x server-run.sh
./server-run.sh
```

第一次运行时，如果没有 `.env`，脚本会自动从 `env.example` 创建 `.env`，然后退出。

编辑 `.env`：

```bash
nano /opt/horizon-deploy/.env
```

填写火山引擎方舟 API Key：

```env
DOUBAO_API_KEY=你的火山引擎APIKey
```

再次运行：

```bash
./server-run.sh
```

这次如果没有 `data/config.json`，脚本会自动从 `config.example.json` 创建，然后退出。

编辑配置：

```bash
nano /opt/horizon-deploy/data/config.json
```

默认配置已经使用火山引擎豆包：

```json
{
  "provider": "doubao",
  "model": "doubao-seed-2-0-lite-260428",
  "api_key_env": "DOUBAO_API_KEY",
  "base_url": "https://ark.cn-beijing.volces.com/api/v3",
  "languages": ["zh"]
}
```

第三次运行会真正执行 Horizon：

```bash
./server-run.sh
```

脚本会：

- 如果服务器还没有镜像，就从 `horizon-image.tar` 导入。
- 运行 Horizon 容器。
- 将 `data/summaries/*.md` 复制到 `reports/`。

检查结果：

```bash
ls -lah /opt/horizon-deploy/data/summaries
ls -lah /opt/horizon-deploy/reports
```

## 4. 日常运行

以后只需要执行：

```bash
cd /opt/horizon-deploy
./server-run.sh
```

默认读取最近 24 小时内容。可以临时改为 48 小时：

```bash
HOURS=48 ./server-run.sh
```

也可以指定目录：

```bash
DATA_DIR=/data/horizon-data REPORTS_DIR=/data/horizon-reports ./server-run.sh
```

## 5. 定时任务

如果需要每天早上 8 点自动运行，手动加入 crontab 即可：

```cron
0 8 * * * cd /opt/horizon-deploy && ./server-run.sh >> horizon.log 2>&1
```

## 6. 文件说明

```text
build-image.ps1       # 本地构建并导出 Docker 镜像
server-run.sh         # 服务器导入镜像并运行 Horizon
env.example           # 环境变量模板，不放真实密钥
config.example.json   # Horizon 配置模板
horizon-image.tar     # 本地构建后生成，上传到服务器
data/config.json      # 服务器实际使用的 Horizon 配置
data/summaries/       # Horizon 原始 Markdown 输出
reports/              # 给后续阅读器读取的 Markdown 目录
```

## 7. 安全注意事项

- 不要把 `.env` 上传到代码仓库。
- 不要把 `data/config.json` 放到 Web 静态资源目录。
- 后续 Web 阅读器只读取 `reports/`。
- 如果日报里包含私人来源内容，不要公开部署阅读器。

## 8. 与阅读器的关系

后续 Nuxt 阅读器只需要读取：

```text
/opt/horizon-deploy/reports/
```

Horizon 每次生成新的 Markdown 后，阅读器在 SSR / Node server 模式下可以直接读到新文件，不需要重新构建。
