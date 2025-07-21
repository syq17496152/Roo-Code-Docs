---
sidebar_label: Anthropic
---

# 在 Roo Code 中使用 Anthropic

Anthropic 是一家人工智能安全与研究公司，致力于构建可靠、可解释且可控的 AI 系统。其 Claude 模型以强大的推理能力、实用性和诚实性而闻名。

**官方网站:** [https://www.anthropic.com/](https://www.anthropic.com/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [Anthropic 控制台](https://console.anthropic.com/) 创建账户或登录。
2.  **导航到 API 密钥:** 进入 [API 密钥](https://console.anthropic.com/settings/keys) 页面。
3.  **创建密钥:** 点击 "Create Key"，为密钥输入描述性名称（例如 "Roo Code"）。
4.  **复制密钥:** **重要：** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 Anthropic Claude 模型：

*   `claude-opus-4-20250514`
*   `claude-opus-4-20250514:thinking` (扩展思考变体)
*   `claude-sonnet-4-20250514` (推荐版本)
*   `claude-sonnet-4-20250514:thinking` (扩展思考变体)
*   `claude-3-7-sonnet-20250219`
*   `claude-3-7-sonnet-20250219:thinking` (扩展思考变体)
*   `claude-3-5-sonnet-20241022`
*   `claude-3-5-haiku-20241022`
*   `claude-3-opus-20240229`
*   `claude-3-haiku-20240307`

关于每个模型功能的详细信息，请参阅 [Anthropic 模型文档](https://docs.anthropic.com/en/docs/about-claude/models)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Anthropic"。
3.  **输入 API 密钥:** 将您的 Anthropic API 密钥粘贴到 "Anthropic API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的 Claude 模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 Anthropic API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **提示缓存:** Claude 3 模型支持 [提示缓存](https://docs.anthropic.com/en/docs/build-with-claude/prompt-caching)，对于重复提示可以显著降低成本和延迟。
*   **上下文窗口:** Claude 模型具有较大的上下文窗口（200,000 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** 请参考 [Anthropic 定价页面](https://www.anthropic.com/pricing) 获取最新定价信息。
*   **速率限制:** Anthropic 根据 [使用层级](https://docs.anthropic.com/en/api/rate-limits#requirements-to-advance-tier) 实施严格的速率限制。如果您反复遇到速率限制，请考虑联系 Anthropic 销售团队，或通过其他提供商如 [OpenRouter](/providers/openrouter) 或 [Requesty](/providers/requesty) 访问 Claude 模型。
