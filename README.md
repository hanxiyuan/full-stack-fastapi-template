# Full Stack FastAPI 模板

<a href="https://github.com/fastapi/full-stack-fastapi-template/actions?query=workflow%3A%22Test+Docker+Compose%22" target="_blank"><img src="https://github.com/fastapi/full-stack-fastapi-template/workflows/Test%20Docker%20Compose/badge.svg" alt="Test Docker Compose"></a>
<a href="https://github.com/fastapi/full-stack-fastapi-template/actions?query=workflow%3A%22Test+Backend%22" target="_blank"><img src="https://github.com/fastapi/full-stack-fastapi-template/workflows/Test%20Backend/badge.svg" alt="Test Backend"></a>
<a href="https://coverage-badge.samuelcolvin.workers.dev/redirect/fastapi/full-stack-fastapi-template" target="_blank"><img src="https://coverage-badge.samuelcolvin.workers.dev/fastapi/full-stack-fastapi-template.svg" alt="Coverage"></a>

## 技术栈与功能特性

- [**FastAPI**](https://fastapi.tiangolo.com) 用于 Python 后端 API。
  - [SQLModel](https://sqlmodel.tiangolo.com) 用于 Python 与 SQL 数据库交互（ORM）。
  - [Pydantic](https://docs.pydantic.dev)（FastAPI 所使用）用于数据校验和配置管理。
  - [PostgreSQL](https://www.postgresql.org) 作为 SQL 数据库。
- [React](https://react.dev) 用于前端。
  - 使用 TypeScript、hooks、[Vite](https://vitejs.dev) 和现代前端栈的其他部分。
  - 使用 [Tailwind CSS](https://tailwindcss.com) 和 [shadcn/ui](https://ui.shadcn.com) 构建前端组件。
  - 自动生成的前端客户端。
  - 使用 [Playwright](https://playwright.dev) 进行端到端测试。
  - 支持深色模式。
- [Docker Compose](https://www.docker.com) 用于开发与生产环境。
- 默认提供安全的密码哈希。
- JWT（JSON Web Token）认证。
- 基于邮箱的密码找回。
- [Mailcatcher](https://mailcatcher.me) 用于开发期间本地邮件测试。
- 使用 [Pytest](https://pytest.org) 进行测试。
- 使用 [Traefik](https://traefik.io) 作为反向代理/负载均衡器。
- 提供基于 Docker Compose 的部署说明，包括如何配置前端 Traefik 代理以自动处理 HTTPS 证书。
- 基于 GitHub Actions 的 CI（持续集成）与 CD（持续部署）。

### 仪表盘登录

[![API docs](img/login.png)](https://github.com/fastapi/full-stack-fastapi-template)

### 仪表盘 - 管理员

[![API docs](img/dashboard.png)](https://github.com/fastapi/full-stack-fastapi-template)

### 仪表盘 - 条目

[![API docs](img/dashboard-items.png)](https://github.com/fastapi/full-stack-fastapi-template)

### 仪表盘 - 深色模式

[![API docs](img/dashboard-dark.png)](https://github.com/fastapi/full-stack-fastapi-template)

### 交互式 API 文档

[![API docs](img/docs.png)](https://github.com/fastapi/full-stack-fastapi-template)

## 如何使用

你可以**直接 fork 或 clone** 这个仓库并直接使用。

开箱即用。

### 如何使用私有仓库

如果你希望使用私有仓库，GitHub 不允许你直接 fork 后再修改可见性。

但你可以这样做：

- 新建一个 GitHub 仓库，例如 `my-full-stack`。
- 手动克隆本仓库，并将目录名设置为你想使用的项目名，例如 `my-full-stack`：

```bash
git clone git@github.com:fastapi/full-stack-fastapi-template.git my-full-stack
```

- 进入新目录：

```bash
cd my-full-stack
```

- 将 `origin` 设置为你新建的仓库地址（可从 GitHub 页面复制），例如：

```bash
git remote set-url origin git@github.com:octocat/my-full-stack.git
```

- 将本模板仓库添加为另一个 `remote`，便于后续拉取更新：

```bash
git remote add upstream git@github.com:fastapi/full-stack-fastapi-template.git
```

- 将代码推送到你的新仓库：

```bash
git push -u origin master
```

### 从原始模板更新

在克隆仓库并完成你自己的修改后，你可能希望同步这个原始模板的最新变更。

- 确认你已将原始仓库添加为 remote，可通过以下命令检查：

```bash
git remote -v

origin    git@github.com:octocat/my-full-stack.git (fetch)
origin    git@github.com:octocat/my-full-stack.git (push)
upstream    git@github.com:fastapi/full-stack-fastapi-template.git (fetch)
upstream    git@github.com:fastapi/full-stack-fastapi-template.git (push)
```

- 拉取最新变更但先不合并提交：

```bash
git pull --no-commit upstream master
```

这会下载模板最新变更但不立即提交，这样你可以在提交前先检查是否一切正确。

- 如果有冲突，请在编辑器中解决。

- 完成后，继续合并：

```bash
git merge --continue
```

### 配置

你可以在 `.env` 文件中更新配置来自定义项目。

在部署前，至少要修改以下值：

- `SECRET_KEY`
- `FIRST_SUPERUSER_PASSWORD`
- `POSTGRES_PASSWORD`

你可以（并且应该）通过 secrets 以环境变量方式传入这些值。

更多细节请阅读 [deployment.md](./deployment.md)。

### 生成密钥

`.env` 文件中的部分环境变量默认值为 `changethis`。

你需要把它们替换为安全密钥，可通过以下命令生成：

```bash
python -c "import secrets; print(secrets.token_urlsafe(32))"
```

复制输出并用作密码/密钥。可以重复执行该命令生成更多安全密钥。

## 如何使用 - 通过 Copier 的替代方式

本仓库也支持通过 [Copier](https://copier.readthedocs.io) 生成新项目。

它会复制所有文件、询问配置问题，并根据你的回答更新 `.env` 文件。

### 安装 Copier

你可以通过以下方式安装 Copier：

```bash
pip install copier
```

或者更推荐地，如果你有 [`pipx`](https://pipx.pypa.io/)，可以这样安装：

```bash
pipx install copier
```

**注意**：如果你有 `pipx`，可以不安装 copier，直接运行。

### 使用 Copier 生成项目

先确定新项目目录名，下面会用到。例如 `my-awesome-project`。

进入你项目父目录，然后使用项目名执行命令：

```bash
copier copy https://github.com/fastapi/full-stack-fastapi-template my-awesome-project --trust
```

如果你有 `pipx` 且未安装 `copier`，可直接运行：

```bash
pipx run copier copy https://github.com/fastapi/full-stack-fastapi-template my-awesome-project --trust
```

**注意**：`--trust` 选项是必须的，用于执行会更新 `.env` 文件的[创建后脚本](https://github.com/fastapi/full-stack-fastapi-template/blob/master/.copier/update_dotenv.py)。

### 输入变量

Copier 会向你询问一些数据，建议在生成项目之前先准备好。

不过不用担心，后续都可以在 `.env` 文件中修改。

输入变量及默认值（部分自动生成）如下：

- `project_name`: （默认：`"FastAPI Project"`）项目名称，展示给 API 用户（在 `.env` 中）。
- `stack_name`: （默认：`"fastapi-project"`）用于 Docker Compose 标签和项目名的栈名称（不能有空格和句点）（在 `.env` 中）。
- `secret_key`: （默认：`"changethis"`）项目安全密钥，存储在 `.env` 中，可使用上文方法生成。
- `first_superuser`: （默认：`"admin@example.com"`）首个超级管理员邮箱（在 `.env` 中）。
- `first_superuser_password`: （默认：`"changethis"`）首个超级管理员密码（在 `.env` 中）。
- `smtp_host`: （默认："") 用于发送邮件的 SMTP 主机，可后续在 `.env` 中设置。
- `smtp_user`: （默认："") 用于发送邮件的 SMTP 用户名，可后续在 `.env` 中设置。
- `smtp_password`: （默认："") 用于发送邮件的 SMTP 密码，可后续在 `.env` 中设置。
- `emails_from_email`: （默认：`"info@example.com"`）发件邮箱地址，可后续在 `.env` 中设置。
- `postgres_password`: （默认：`"changethis"`）PostgreSQL 数据库密码，存储在 `.env` 中，可使用上文方法生成。
- `sentry_dsn`: （默认："") Sentry 的 DSN，如需使用可后续在 `.env` 中设置。

## 后端开发

后端文档：[backend/README.md](./backend/README.md)。

## 前端开发

前端文档：[frontend/README.md](./frontend/README.md)。

## 部署

部署文档：[deployment.md](./deployment.md)。

## 开发

通用开发文档：[development.md](./development.md)。

其中包含 Docker Compose 使用方式、自定义本地域名、`.env` 配置等内容。

## 发布说明

请查看 [release-notes.md](./release-notes.md)。

## 许可证

Full Stack FastAPI 模板基于 MIT 许可证发布。
