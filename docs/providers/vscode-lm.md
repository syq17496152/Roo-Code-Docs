---
sidebar_label: VS Code 语言模型 API
---

# 在 Roo Code 中使用 VS Code 语言模型 API

Roo Code 包含 *实验性* 支持 [VS Code 语言模型 API](https://code.visualstudio.com/api/extension-guides/language-model)。该 API 允许扩展提供对语言模型的访问。这意味着您可以使用：

*   **GitHub Copilot：** 如果您有 Copilot 订阅并且安装了扩展。
*   **其他 VS Code 扩展：** 任何实现语言模型 API 的扩展。

**重要：** 此集成高度实验性，可能无法按预期工作。它依赖于其他扩展正确实现 VS Code 语言模型 API。

---

## 前提条件

*   **VS Code：** 语言模型 API 可通过 VS Code 使用（目前不支持 Cursor）。
*   **语言模型提供扩展：** 您需要安装提供语言模型的扩展。示例包括：
    *   **GitHub Copilot：** 如果您有 Copilot 订阅，安装 GitHub Copilot 和 GitHub Copilot Chat 扩展。
    *   **其他扩展：** 在 VS Code 市场中搜索提及 "Language Model API" 或 "lm" 的扩展。可能会有其他实验性扩展可用。

---

## 配置

1.  **打开 Roo Code 设置：** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商：** 从 "API Provider" 下拉菜单中选择 "VS Code LM API"。
3.  **选择模型：** "Language Model" 下拉菜单将（最终）列出可用的模型。格式为 `vendor/family`。例如，如果您有 Copilot，可能会看到以下选项：
    *   `copilot - claude-3.5-sonnet`
    *   `copilot - o3-mini`
    *   `copilot - o1-ga`
    *   `copilot - gemini-2.0-flash`

---

## 限制

*   **实验性 API：** VS Code 语言模型 API 仍在开发中。请期待变化和潜在的不稳定性。
*   **扩展依赖：** 此功能完全依赖于其他扩展提供模型。Roo Code 无法直接控制哪些模型可用。
*   **功能限制：** VS Code 语言模型 API 可能不支持其他 API 提供商的所有功能（例如图像输入、流式传输、详细的使用信息）。
*   **无直接成本控制：** 您受扩展提供模型的定价和条款的约束。Roo Code 无法直接跟踪或限制成本。
*   **GitHub Copilot 速率限制：** 使用 VS Code LM API 与 GitHub Copilot 时，GitHub 可能会施加速率限制。这些限制由 GitHub 而非 Roo Code 控制。


---

## 故障排除

*   **没有模型显示：**
    *   确保您已安装 VS Code。
    *   确保您已安装提供语言模型的扩展（例如 GitHub Copilot、GitHub Copilot Chat）。
    *   如果使用 Copilot，请确保使用您想使用的模型发送了一条 Copilot Chat 消息。
*   **意外行为：** 如果您遇到意外行为，这可能是由于底层语言模型 API 或提供扩展的问题。请考虑向提供扩展的开发者报告问题。
