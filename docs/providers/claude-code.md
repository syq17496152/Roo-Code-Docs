---
sidebar_label: Claude Code
---

# Claude Code 提供商

Claude Code 提供商允许您通过官方 CLI（命令行接口）而非 Web API 使用 Anthropic 的 Claude 模型。这使得 Roo Code 可以直接访问您的 Claude Max 订阅。

:::info 安装说明
在使用 Claude Code 提供商之前，请确保完成以下步骤：

1.  **安装 Claude CLI**：从 [Anthropic 文档](https://docs.anthropic.com/en/docs/claude-code/setup) 下载并安装官方命令行工具。
2.  **认证**：在终端运行 `claude` 启动应用程序。应用程序启动后，输入 `/login` 登录您的 Anthropic 账户。此步骤是授予 Roo Code 访问您 Claude 订阅的必要条件。
3.  **验证安装**：通过运行 `claude --version` 确认 CLI 正常工作。这确保 Roo Code 可以找到并使用该可执行文件。
4.  **在 Roo Code 中配置**：
    *   进入 Roo Code 设置，选择 **"Claude Code"** 作为您的 API 提供商。
    *   如果您将 CLI 安装在自定义位置，请将 **"Claude Code 路径"** 设置为完整的可执行文件路径（例如 `/usr/local/bin/claude`）。否则可以留空。
    *   从可用选项中选择您需要的模型。

配置完成后，Roo Code 将使用您本地的 Claude CLI 安装与 Anthropic 模型交互，利用您现有的订阅。
:::


:::warning 环境变量使用
`claude` 命令行工具与其他 Anthropic SDK 一样，可以使用 `ANTHROPIC_API_KEY` 环境变量进行认证。这是非交互环境中授权 CLI 工具的常用方法。

如果您的系统设置了这个环境变量，`claude` 工具可能会使用它进行认证而不是交互式的 `/login` 方法。当 Roo Code 执行该工具时，会准确反映正在使用 API 密钥的情况，因为这是 `claude` CLI 本身的底层行为。
:::

**官方网站:** [https://docs.anthropic.com/en/docs/claude-code/setup](https://docs.anthropic.com/en/docs/claude-code/setup)

---

## 主要功能
- **直接 CLI 访问**：使用 Anthropic 官方 Claude CLI 工具进行模型交互。
- **高级推理**：完整支持 Claude 的思考模式和推理能力。
- **费用透明**：显示 CLI 报告的确切使用成本。
- **灵活配置**：与您现有的 Claude CLI 配置配合使用。

---

## 为何使用此提供商

- **无需 API 密钥**：使用您已有的 Claude CLI 认证。
- **成本优势**：利用 CLI 订阅费率和透明的成本报告。
- **最新特性**：在 CLI 发布新功能时立即访问。
- **高级推理**：完整支持 Claude 的思考模式。

## 工作原理

Claude Code 提供商的工作方式如下：

1. **运行命令**：用您的提示执行 `claude` CLI 命令。
2. **处理输出**：分块处理 CLI 的 JSON 输出，并进行高级解析。
3. **处理推理**：在可用时捕获并显示 Claude 的思考过程。
4. **跟踪使用情况**：报告 CLI 提供的 token 使用量和成本。

该提供商与 Roo Code 接口集成，让您获得与其他提供商相同的体验，同时使用底层的 Claude CLI。

---

## 配置

您只需配置一个可选设置：

### **Claude Code 路径**
- **设置项**: `claudeCodePath`
- **描述**: 您 Claude CLI 可执行文件的路径。
- **默认值**: `claude`（假设它位于您的系统 PATH 中）。
- **何时更改**: 如果您将 Claude CLI 安装在自定义位置。

**自定义路径示例：**
- macOS/Linux: `/usr/local/bin/claude` 或 `~/bin/claude`

---

## 支持的模型

Claude Code 提供商支持以下 Claude 模型：

- **Claude Sonnet 4** (最新版，推荐使用)
- **Claude Opus 4** (功能最强大)
- **Claude 3.7 Sonnet**
- **Claude 3.5 Sonnet**
- **Claude 3.5 Haiku** (快速响应)

具体可用模型取决于您的 Claude CLI 订阅和计划.


---


## 常见问题

**"我需要为此提供商提供 Claude API 密钥吗？"**
- 通常不需要。您可以使用 `/login` 命令在 `claude` 应用程序中进行交互式认证。
- 但是，如果设置了 `ANTHROPIC_API_KEY` 环境变量，Claude CLI 可能会使用它进行认证。详情请参阅上面的警告信息。

**"如何安装 Claude CLI？"**
- 访问 [Anthropic CLI 文档](https://docs.anthropic.com/en/docs/claude-code/setup) 获取安装说明
- CLI 处理自己的认证和安装

**"为什么我要使用这个而不是常规的 Anthropic 提供商？"**
- 根据您的订阅可能具有成本优势

**"如果 CLI 不在您的 PATH 中怎么办？"**
- 在 Claude Code 路径设置中指定自定义路径
- 指向您安装 CLI 的完整路径

