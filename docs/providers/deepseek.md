---
sidebar_label: DeepSeek
---

# 在 Roo Code 中使用 DeepSeek

Roo Code 支持通过 [DeepSeek](https://www.deepseek.com/) 访问其大型语言模型。DeepSeek 是一家致力于构建强大语言模型的中国公司，其模型以强大的推理能力、实用性和诚实性而闻名。

**官方网站:** [https://www.deepseek.com/](https://www.deepseek.com/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [DeepSeek 控制台](https://platform.deepseek.com/) 创建账户或登录。
2.  **获取 API 密钥:** 您可以在 [API 密钥管理](https://platform.deepseek.com/api-keys) 页面获取 API 密钥。
3.  **复制密钥:** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 DeepSeek 模型：

*   `deepseek-chat`
*   `deepseek-coder`
*   `deepseek-coder-lite`
*   `deepseek-vl`
*   `deepseek-audio`

关于每个模型功能的详细信息，请参阅 [DeepSeek 模型文档](https://platform.deepseek.com/model-intro/)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "DeepSeek"。
3.  **输入 API 密钥:** 将您的 DeepSeek API 密钥粘贴到 "DeepSeek API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 DeepSeek API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **上下文窗口:** DeepSeek 模型具有较大的上下文窗口（200,000 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** 请参考 [DeepSeek 定价页面](https://platform.deepseek.com/pricing) 获取最新定价信息。
*   **速率限制:** DeepSeek 根据 [使用层级](https://platform.deepseek.com/docs/zh-CN/developer-reference/rate-limits) 实施严格的速率限制。如果您反复遇到速率限制，请考虑升级您的账户计划或联系 DeepSeek 支持团队。