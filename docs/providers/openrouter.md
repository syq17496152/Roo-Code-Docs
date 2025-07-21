---
sidebar_label: OpenRouter
---

# 在 Roo Code 中使用 OpenRouter

OpenRouter 是一个 AI 平台，通过单一 API 提供对 150 多个大型语言模型 (LLMs) 的访问。这可以简化设置并让您轻松实验不同的模型。

**官方网站:** [https://openrouter.ai/](https://openrouter.ai/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [OpenRouter 网站](https://openrouter.ai/) 并使用您的 Google 或 GitHub 账户登录。
2.  **获取 API 密钥:** 进入 [密钥页面](https://openrouter.ai/keys)。您应该会看到一个 API 密钥。如果没有，请创建一个新密钥。
3.  **复制密钥:** 复制 API 密钥。

---

## 支持的模型

OpenRouter 支持大量模型。Roo Code 会自动获取可用模型的最新列表。您可以在 [OpenRouter 模型页面](https://openrouter.ai/models) 查看完整的最新模型列表。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "OpenRouter"。
3.  **输入 API 密钥:** 将您的 OpenRouter API 密钥粘贴到 "OpenRouter API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 OpenRouter API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 支持的转换

OpenRouter 提供了一个可选的 "middle-out" 消息转换功能，帮助处理超过模型最大上下文大小的提示。您可以通过勾选 "Compress prompts and message chains to the context size" 来启用它。

---

## 提示与注意事项

* **模型选择：** OpenRouter 提供了广泛的模型选择。尝试找到最适合您需求的模型。
* **定价：** OpenRouter 根据底层模型的定价收费。请参阅 [OpenRouter 模型页面](https://openrouter.ai/models) 获取详细信息。
*   **提示缓存：**
    *   OpenRouter 将缓存请求传递给支持缓存的底层模型。请参阅 [OpenRouter 模型页面](https://openrouter.ai/models) 以查看哪些模型支持缓存。
    *   对于大多数模型，缓存应自动激活（类似于 Requesty 的工作方式）。
    *   **Gemini 模型通过 OpenRouter 的例外：** 由于通过 OpenRouter 访问 Gemini 模型时可能观察到的响应延迟问题，需要手动激活缓存。
    *   如果通过 OpenRouter 使用 **Gemini 模型**，您必须手动勾选提供商设置中的 "Enable Prompt Caching" 以激活缓存。此复选框是特定于 Gemini 模型的临时解决方案。
    *   对于通过 OpenRouter 的非 Gemini 模型，此复选框对于缓存不是必需的。
*   **自带密钥 (BYOK)：** 如果您使用自己的底层服务密钥，OpenRouter 会收取 5% 的正常费用。Roo Code 会自动调整成本计算以反映这一点。
