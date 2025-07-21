---
sidebar_label: Groq
---

# 在 Roo Code 中使用 Groq

Groq 是一家人工智能基础设施公司，提供对多个大型语言模型 (LLMs) 的 API 访问权限，包括其专有的 Llama3 模型。Groq 的特色在于其极快的推理速度和低延迟，使其成为需要实时响应的应用程序的理想选择。

**官方网站:** [https://groq.com/](https://groq.com/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [Groq 控制台](https://console.groq.com/) 创建账户或登录。
2.  **获取 API 密钥:** 您可以在 [API 密钥管理](https://console.groq.com/keys) 页面获取 API 密钥。
3.  **复制密钥:** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 Groq 模型：

*   **Llama3 Models:**
    *   `llama3-70b-8192`
    *   `llama3-8b-8192`
*   **Mixtral Models:**
    *   `mixtral-8x7b-32768`
*   **Gemma Models:**
    *   `gemma-7b-it`
*   **Claude Models:**
    *   `claude-3-5-sonnet-20240620`
    *   `claude-3-haiku-20240307`
    *   `claude-3-opus-20240229`
    *   `claude-3-sonnet-20240229`
*   **GPT Models:**
    *   `gpt-4o-2024-05-13`
    *   `gpt-4o-mini-2024-07-18`
    *   `gpt-3.5-turbo-0125`

关于每个模型功能的详细信息，请参阅 [Groq 模型文档](https://console.groq.com/docs/models)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Groq"。
3.  **输入 API 密钥:** 将您的 Groq API 密钥粘贴到 "Groq API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 Groq API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **推理速度:** Groq 以其极快的推理速度著称，特别适合需要低延迟的应用场景。
*   **上下文窗口:** Groq 模型具有较大的上下文窗口（8192 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** 请参考 [Groq 定价页面](https://groq.com/pricing/) 获取最新定价信息。
*   **速率限制:** Groq 根据 [使用层级](https://console.groq.com/docs/rate-limits) 实施严格的速率限制。如果您反复遇到速率限制，请考虑升级您的账户计划或联系 Groq 支持团队。