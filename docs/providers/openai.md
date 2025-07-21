---
sidebar_label: OpenAI
---

# 在 Roo Code 中使用 OpenAI

Roo Code 支持通过官方 OpenAI API 直接访问模型。

**官方网站:** [https://openai.com/](https://openai.com/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [OpenAI 平台](https://platform.openai.com/) 创建账户或登录。
2.  **导航到 API 密钥:** 进入 [API 密钥页面](https://platform.openai.com/api-keys)。
3.  **创建密钥:** 点击 "Create new secret key"。为密钥输入一个描述性名称（例如 "Roo Code"）。
4.  **复制密钥:** **重要：** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 OpenAI 模型：

*   `o3-mini` (中等推理能力)
*   `o3-mini-high` (高推理能力)
*   `o3-mini-low` (低推理能力)
*   `o1`
*   `o1-preview`
*   `o1-mini`
*   `gpt-4.5-preview`
*   `gpt-4o`
*   `gpt-4o-mini`

请参阅 [OpenAI 模型文档](https://platform.openai.com/docs/models) 以获取最新的模型列表和功能。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "OpenAI"。
3.  **输入 API 密钥:** 将您的 OpenAI API 密钥粘贴到 "OpenAI API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 OpenAI API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **定价:** 请参考 [OpenAI 定价页面](https://openai.com/pricing) 获取详细信息。
*   **Azure OpenAI 服务:** 如果您想使用 Azure OpenAI 服务，请参阅我们的 [OpenAI 兼容部分](/providers/openai-compatible)。