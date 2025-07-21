---
sidebar_label: Mistral
---

# 在 Roo Code 中使用 Mistral

Mistral 是一家致力于构建强大语言模型的法国公司，其模型以强大的推理能力、实用性和诚实性而闻名。Mistral 提供了一系列开源和闭源模型，适用于多种应用场景。

**官方网站:** [https://mistral.ai/](https://mistral.ai/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [Mistral 平台](https://console.mistral.ai/) 创建账户或登录。
2.  **获取 API 密钥:** 您可以在 [API 密钥管理](https://console.mistral.ai/api-keys) 页面获取 API 密钥。
3.  **复制密钥:** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 Mistral 模型：

*   **Mistral Large Models:**
    *   `mistral-large-2407`
    *   `mistral-large-2402`
    *   `mistral-large`
*   **Mistral Medium Models:**
    *   `mistral-medium-2312`
*   **Mistral Small Models:**
    *   `mistral-small-2402`
    *   `mistral-small`
*   **Code Models:**
    *   `codestral-2405`
    *   `codestral-mamba-2407`
*   **Embedding Models:**
    *   `mistral-embed`

关于每个模型功能的详细信息，请参阅 [Mistral 模型文档](https://docs.mistral.ai/)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Mistral"。
3.  **输入 API 密钥:** 将您的 Mistral API 密钥粘贴到 "Mistral API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 Mistral API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **上下文窗口:** Mistral 模型具有较大的上下文窗口（32,768 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** 请参考 [Mistral 定价页面](https://mistral.ai/pricing/) 获取最新定价信息。
*   **速率限制:** Mistral 根据 [使用层级](https://docs.mistral.ai/rate-limits/) 实施严格的速率限制。如果您反复遇到速率限制，请考虑升级您的账户计划或联系 Mistral 支持团队。