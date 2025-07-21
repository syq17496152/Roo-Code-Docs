import KangarooIcon from '@site/src/components/KangarooIcon';

# 常见问题解答

本页面解答关于 Roo Code 的一些常见问题。

---

## 通用问题

### 什么是 Roo Code？

Roo Code 是一个 AI 驱动的自主编码代理，存在于您的编辑器中。

### Roo Code 如何工作？

Roo Code 使用大语言模型（LLMs）来理解您的请求并将其转化为操作。它可以：

*   读写项目中的文件。
*   在 VS Code 终端中执行命令。
*   执行网页浏览（如果启用）。
*   通过模型上下文协议（MCP）使用外部工具。

您可以通过聊天界面与 Roo Code 交互，在其中提供指令并审查/批准其提出的操作。

### Roo Code 能做什么？

Roo Code 可以帮助完成各种编码任务，包括：

*   从自然语言描述生成代码。
*   重构现有代码。
*   修复错误。
*   编写文档。
*   解释代码。
*   回答关于代码库的问题。
*   自动化重复性任务。
*   创建新文件和项目。

### Roo Code 是否免费使用？

Roo Code 扩展本身是免费且开源的。但是，Roo Code 依赖于外部 API 提供商（如 [Anthropic](providers/anthropic)、[OpenAI](providers/openai)、[OpenRouter](providers/openrouter)、[Requesty](providers/requesty) 等）提供其 AI 功能。这些提供商通常根据处理的 token 数量收费。您需要创建账户并从所选提供商处获取 API 密钥。有关详细信息，请参阅 [设置您的第一个 AI 提供商](getting-started/connecting-api-provider)。

### 使用 Roo Code 有哪些风险？

Roo Code 是一个强大的工具，重要的是要负责任地使用它。以下是一些需要注意的事项：

*   **Roo Code 可能会犯错**。在批准 Roo Code 提出的更改之前，请务必仔细审查。
*   **Roo Code 可以执行命令**。在允许 Roo Code 运行命令时要非常谨慎，尤其是在启用了自动批准的情况下。
*   **Roo Code 可以访问互联网**。如果您使用支持网页浏览的提供商，请注意 Roo Code 可能会访问敏感信息。

---

## 设置与安装

### 如何安装 Roo Code？

请参阅 [安装指南](/getting-started/installing) 获取详细说明。

### 支持哪些 API 提供商？

Roo Code 支持广泛的 API 提供商，包括：
*   [Anthropic (Claude)](/providers/anthropic)
*   [OpenAI](/providers/openai)
*   [OpenRouter](/providers/openrouter)
*   [Google Gemini](/providers/gemini)
*   [Glama](/providers/glama)
*   [AWS Bedrock](/providers/bedrock)
*   [GCP Vertex AI](/providers/vertex)
*   [Ollama](/providers/ollama)
*   [LM Studio](/providers/lmstudio)
*   [DeepSeek](/providers/deepseek)
*   [Mistral](/providers/mistral)
*   [Unbound](/providers/unbound)
*   [Requesty](/providers/requesty)
*   [VS Code Language Model API](/providers/vscode-lm)

### 如何获取 API 密钥？
每个 API 提供商都有自己的获取 API 密钥的流程。请参阅 [设置您的第一个 AI 提供商](/getting-started/connecting-api-provider) 以获取每个提供商的相关文档链接。

### 我可以将 Roo Code 与本地模型一起使用吗？
是的，Roo Code 支持使用 [Ollama](/providers/ollama) 和 [LM Studio](/providers/lmstudio) 在本地运行模型。请参阅 [使用本地模型](/advanced-usage/local-models) 获取说明。

---

## 使用方法

### 如何开始新任务？
打开 Roo Code 面板 (<KangarooIcon />)，在聊天框中输入您的任务。请明确具体地说明您希望 Roo Code 做什么。有关最佳实践，请参阅 [编写请求](/basic-usage/typing-your-requests)。

### Roo Code 中的模式是什么？
[模式](/basic-usage/using-modes) 是 Roo Code 可以采用的不同角色，每个角色都有特定的重点和能力。内置模式包括：

*   **代码模式**：用于通用编码任务。
*   **架构师模式**：用于规划和技术领导。
*   **问答模式**：用于回答问题并提供信息。
*   **调试模式**：用于系统化问题诊断。
您还可以创建 [自定义模式](/features/custom-modes)。

### 如何在模式之间切换？

使用聊天输入区域的下拉菜单选择不同的模式，或使用 `/` 命令切换到特定模式。

### 工具是什么以及如何使用它们？
[工具](/basic-usage/how-tools-work) 是 Roo Code 与您的系统交互的方式。Roo Code 会自动选择并使用适当的工具来完成您的任务。您无需直接调用工具。您将被提示批准或拒绝每次工具使用。

### 什么是上下文引用？
[上下文引用](/basic-usage/context-mentions) 是向 Roo Code 提供有关项目的特定信息的一种方式，例如文件、文件夹或问题。使用 `@` 符号后跟您要引用的项目（例如，`@/src/file.ts`，`@problems`）。

### Roo Code 可以访问互联网吗？

是的，如果您使用支持网页浏览的模型提供商。请注意允许此操作的安全隐患。

### Roo Code 可以在我的终端中运行命令吗？

是的，Roo Code 可以在您的 VS Code 终端中执行命令。除非您启用了命令的自动批准，否则在执行前将提示您批准每个命令。对于自动批准命令要极其谨慎。如果遇到终端命令问题，请参阅 [Shell 集成指南](/features/shell-integration) 进行故障排除。

### 如何向 Roo Code 提供反馈？

您可以通过批准或拒绝 Roo Code 提出的操作来提供反馈。您可以使用反馈字段提供额外反馈。

### 我可以自定义 Roo Code 的行为吗？

是的，您可以通过以下几种方式自定义 Roo Code：

*   **自定义指令**：提供适用于所有模式的一般指令，或针对特定模式的指令。
*   **自定义模式**：创建具有定制提示和某些工具权限的自己的模式。
*   **`.roorules` 文件**：在项目中创建 `.roorules` 文件以提供额外指南。
*   **设置**：调整各种设置，例如自动批准、差异编辑等。

### Roo Code 有自动批准设置吗？
是的，Roo Code 有一些设置，在启用时会自动批准操作。更多信息请参见 [这里](/features/auto-approving-actions)。

---

## 高级功能

### 我可以离线使用 Roo 吗？
是的，如果您使用 [本地模型](/advanced-usage/local-models)。

### 什么是 MCP（模型上下文协议）？
[MCP](/features/mcp/overview) 是一种协议，允许 Roo Code 与外部服务器通信，通过自定义工具和资源扩展其功能。

### 我可以创建自己的 MCP 服务器吗？

是的，您可以创建自己的 MCP 服务器以为 Roo Code 添加自定义功能。详情请参阅 [MCP 文档](https://github.com/modelcontextprotocol)。

### 什么是代码库索引？

[代码库索引](/features/codebase-indexing) 使用 AI 嵌入创建项目的语义搜索索引。这使 Roo Code 能够更好地理解和导航大型代码库，通过基于含义而非仅关键词查找相关代码。

### 代码库索引的成本是多少？

代码库索引需要 OpenAI API 密钥来生成嵌入，并需要 Qdrant 向量数据库进行存储。成本取决于项目大小和使用的嵌入模型。初始索引是最昂贵的部分；后续更新是增量的，便宜得多。

---

## 故障排除

### Roo Code 没有响应。我该怎么办？

*   确保您的 API 密钥正确且未过期。
*   检查您的互联网连接。
*   检查您选择的 API 提供商的状态。
*   尝试重启 VS Code。
*   如果问题仍然存在，请在 [GitHub](https://github.com/RooCodeInc/Roo-Code/issues) 或 [Discord](https://discord.gg/roocode) 上报告问题。

### 我看到了错误消息。这是什么意思？

错误消息应该提供一些关于问题的信息。如果您不确定如何解决，请在 [Discord](https://discord.gg/roocode) 上寻求帮助。

### Roo Code 做出了我不想要的更改。如何撤销？

Roo Code 使用 VS Code 内置的文件编辑功能。您可以使用标准的“撤销”命令（Ctrl/Cmd + Z）回滚更改。此外，如果启用了实验性检查点，Roo 可以回滚对文件所做的更改。

### Roo Code 无法写入 markdown 文件。出了什么问题？

如果 Roo Code 无法写入 `.md` 文件并出现诸如“无法打开差异编辑器”或“write_to_file 工具失败”的错误，这通常是由干扰文件编辑的 VS Code 扩展或设置引起的：

**常见原因：**
- 具有“保存时格式化”功能的扩展
- VS Code 设置默认将 markdown 文件在预览模式中打开
- Markdown Preview 扩展或类似的 markdown 处理扩展

**解决方案：**
- 禁用任何自动格式化文件的扩展
- 从您的 VS Code `settings.json` 中移除这些设置：
  ```json
  "markdown.preview.openMarkdownLinks": "inPreview",
  "workbench.editorAssociations": {
    "*.md": "vscode.markdown.preview.editor"
  }
  ```
- 临时禁用 markdown 相关扩展以测试是否是它们导致了问题
- 在进行这些更改后重启 VS Code

### 如何报告错误或提出功能建议？

请在 Roo Code [问题页面](https://github.com/RooCodeInc/Roo-Code/issues) 和 [功能请求页面](https://github.com/RooCodeInc/Roo-Code/discussions/categories/feature-requests?discussions_q=is%3Aopen+category%3A%22Feature+Requests%22+sort%3Atop) 上报告错误或提出功能建议。