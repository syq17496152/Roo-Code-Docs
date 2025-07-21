---
sidebar_label: Unbound
---

# 在 Roo Code 中使用 Unbound

Roo Code 支持通过 [Unbound](https://getunbound.ai/) 访问模型，Unbound 是一个专注于提供安全可靠访问各种大型语言模型 (LLMs) 的平台。Unbound 充当网关，允许您使用来自 Anthropic 和 OpenAI 等提供商的模型，而无需直接管理多个 API 密钥和配置。

**官方网站:** [https://getunbound.ai/](https://getunbound.ai/)

---

## 创建账户

1.  **注册/登录:** 访问 [Unbound 网关](https://gateway.getunbound.ai) 创建账户或登录。
2.  **创建应用:** 进入 [应用页面](https://gateway.getunbound.ai/ai-gateway-applications) 并点击 "Create Application" 按钮。
3.  **复制 API 密钥:** 立即复制 API 密钥。

---

## 支持的模型

Unbound 允许您配置支持的模型列表，Roo Code 将自动从 Unbound API 获取可用模型列表。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Unbound"。
3.  **输入 API 密钥:** 将您的 Unbound API 密钥粘贴到 "Unbound API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。

---

## 提示与注意事项

* **安全重点：** Unbound 强调企业级安全功能。如果您的组织对 AI 使用有严格的安全要求，Unbound 可能是一个不错的选择。
*   **模型列表刷新：** Roo Code 在设置中包含了一个专门用于 Unbound 提供商的刷新按钮。这允许您轻松更新可用模型列表，并立即反馈 API 密钥的有效性。
