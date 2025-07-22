---
title: 推荐的MCP服务器
sidebar_label: 推荐的MCP服务器
---

# 推荐的MCP服务器

虽然Roo Code可以连接任何遵循规范的模型上下文协议（MCP）服务器，但社区已经构建了多个即开即用的优质服务器。本页整理了我们**主动推荐的**服务器并提供分步安装说明，让您几分钟内即可上手使用。

> 我们会持续更新此列表。如果您维护的服务器希望我们收录，请提交Pull Request。

---

## Context7

`Context7`是我们首推的通用MCP服务器。它自带一系列高需求工具，支持一键安装，并在所有主流MCP编辑器中具有优秀兼容性。

### 我们推荐Context7的原因

* **一键安装** - 所有组件已打包，无需本地编译步骤
* **跨平台支持** - 可运行于macOS、Windows、Linux或Docker中
* **持续维护** - Upstash团队定期更新
* **丰富工具集** - 数据库访问、网络搜索、文本工具等
* **开源协议** - MIT许可发布

---

## 在Roo Code中安装Context7

有两种常见注册方式：

1. **全局配置** - 所有工作区可用
2. **项目级配置** - 与代码一起提交到版本控制

以下分别介绍两种方式。

### 1. 全局配置

1. 点击<Codicon name="server" />图标打开Roo Code **MCP设置**面板
2. 点击 **编辑全局MCP**
3. 将以下JSON粘贴到`mcpServers`对象内并保存

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

**Windows (cmd.exe)变体**

```json
{
  "mcpServers": {
    "context7": {
      "type": "stdio",
      "command": "cmd",
      "args": ["/c", "npx", "-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

在**Windows (cmd)** 中可能需要通过cmd.exe调用npx：

<img src="/img/recommended-mcp-servers/context7-global-setup-fixed.png" alt="在全局MCP设置中添加Context7" width="600" />

### 2. 项目级配置

如希望将配置提交到仓库，在项目根目录创建`.roo/mcp.json`文件并添加相同代码片段：

```json
{
  "mcpServers": {
    "context7": {
      "command": "npx",
      "args": ["-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

**Windows (cmd.exe)变体**

```json
{
  "mcpServers": {
    "context7": {
      "type": "stdio",
      "command": "cmd",
      "args": ["/c", "npx", "-y", "@upstash/context7-mcp@latest"]
    }
  }
}
```

<img src="/img/recommended-mcp-servers/context7-project-setup-fixed.png" alt="在项目级MCP文件中添加Context7" width="600" />

> 当全局和项目文件定义相同名称的服务器时，**项目配置优先**。

---

## 验证安装

1. 确保在MCP设置面板中**启用MCP服务器**已打开
2. 现在应该看到**Context7**列出。如未运行，点击<Codicon name="activate" />开关启动
3. 首次调用Context7工具时，Roo Code会提示您批准请求。确认后继续

<img src="/img/recommended-mcp-servers/context7-running-fixed.png" alt="Context7在Roo Code中运行" width="400" />

---

## 后续步骤

* 在服务器面板中浏览Context7提供的工具列表
* 为常用工具配置**始终允许**以优化工作流
* 想暴露自己的API？查看[MCP服务器创建指南](/features/mcp/using-mcp-in-roo#enabling-or-disabling-mcp-server-creation)

寻找其他服务器？关注本页 - 我们将很快添加更多推荐！