---
title: 什么是 MCP？
sidebar_label: 什么是 MCP？
---

# 什么是 MCP？

MCP（模型上下文协议）是一种标准化的通信协议，用于 LLM 系统与外部工具和服务进行交互。它充当 AI 助手与各种数据源或应用程序之间的通用适配器。

// ... existing code ...

## 它如何工作

MCP 使用客户端-服务器架构：

1. AI 助手（客户端）连接到 MCP 服务器
2. 每个服务器提供特定的功能（文件访问、数据库查询、API 集成）
3. AI 通过标准化接口使用这些功能
4. 通信通过 JSON-RPC 2.0 消息进行

可以将 MCP 想象成类似于 USB-C 接口，任何兼容的 LLM 都可以连接到任何 MCP 服务器以访问其功能。这种标准化消除了为每个工具和服务构建自定义集成的需求。

例如，使用 MCP 的 AI 可以执行诸如 "搜索我们的公司数据库并生成报告" 这样的任务，而无需为每个数据库系统编写专门的代码。

// ... existing code ...

## MCP 在 Roo Code 中的应用

Roo Code 实现了模型上下文协议来：

- 连接到本地和远程 MCP 服务器
- 提供一致的工具访问接口
- 在不修改核心的情况下扩展功能
- 按需启用专用功能

MCP 为 AI 系统与外部工具和服务的交互提供了标准化的方式，使复杂的集成更加易于访问和一致。

// ... existing code ...

## 了解更多关于 MCP 的信息

准备深入了解了吗？请查看以下指南：

- [MCP 概述](/features/mcp/overview) - 快速浏览 MCP 文档结构
- [在 Roo Code 中使用 MCP](/features/mcp/using-mcp-in-roo) - 开始使用 Roo 中的 MCP，包括创建简单服务器
- [MCP 与 API 的比较](/features/mcp/mcp-vs-api) - 与传统 API 相比的技术优势
- [STDIO & 可流式 HTTP & SSE 传输](/features/mcp/server-transports) - 本地与托管部署模型