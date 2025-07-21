---
sidebar_label: Google Gemini
---

# 在 Roo Code 中使用 Google Gemini

Roo Code 支持通过 Google AI Studio 访问 Google 的 Gemini 模型。Gemini 是一组多模态模型，能够理解、解释和生成文本、代码、图像等多种内容。

**官方网站:** [https://deepmind.google/technologies/gemini/](https://deepmind.google/technologies/gemini/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [Google AI Studio](https://aistudio.google.com/) 创建账户或登录。
2.  **获取 API 密钥:** 您可以在 [API 密钥管理](https://aistudio.google.com/app/apikey) 页面获取 API 密钥。
3.  **复制密钥:** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 Gemini 模型：

*   **Gemini 2.5 Flash:**
    *   `gemini-2.5-flash-preview-05-20`
    *   `gemini-2.5-flash-002`
    *   `gemini-2.5-flash-001`
    *   `gemini-2.5-flash-001:thinking`
    *   `gemini-2.5-flash-lite-001`
*   **Gemini 2.0:**
    *   `gemini-2.0-flash-001`
    *   `gemini-2.0-pro-exp-02-05`
    *   `gemini-2.0-flash-lite-001`
    *   `gemini-2.0-flash-thinking-exp-01-21`
*   **Gemini 1.5:**
    *   `gemini-1.5-flash-002`
    *   `gemini-1.5-flash-001`
    *   `gemini-1.5-pro-002`
    *   `gemini-1.5-pro-001`
*   **Gemini 1.0:**
    *   `gemini-pro`
    *   `gemini-pro-vision`

关于每个模型功能的详细信息，请参阅 [Google AI Studio 文档](https://developers.generativeai.google/guides)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Gemini"。
3.  **输入 API 密钥:** 将您的 Gemini API 密钥粘贴到 "Gemini API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 Gemini API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **提示缓存:** Gemini 1.5 及以上版本支持 [提示缓存](https://developers.generativeai.google/guides/cached-content)，对于重复提示可以显著降低成本和延迟。
*   **上下文窗口:** Gemini 模型具有非常大的上下文窗口（200,000 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** 请参考 [Google AI Studio 定价页面](https://developers.generativeai.google/pricing) 获取最新定价信息。
*   **速率限制:** Google AI Studio 根据 [使用层级](https://developers.generativeai.google/guides/quotas) 实施严格的速率限制。如果您反复遇到速率限制，请考虑升级您的账户计划或联系 Google 支持团队。