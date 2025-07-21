---
sidebar_label: GLaM-A
---

# 在 Roo Code 中使用 GLaM-A

GLaM-A 是一个基于 Google 的 GLaM 模型的开源大型语言模型，专注于提供强大的代码理解和生成能力。它在多个基准测试中表现出色，特别是在代码相关任务方面。

**官方网站:** [https://huggingface.co/spaces/kaist-ai/glam](https://huggingface.co/spaces/kaist-ai/glam)

---

## 获取 API 密钥

GLaM-A 目前通过 Hugging Face Spaces 提供，您可以通过以下方式获取访问权限：

1.  **注册/登录 Hugging Face:** 访问 [Hugging Face](https://huggingface.co/) 创建账户或登录。
2.  **访问 GLaM-A 空间:** 进入 [GLaM-A 空间](https://huggingface.co/spaces/kaist-ai/glam)。
3.  **获取 API 密钥:** 您可以在 [Hugging Face 仪表板](https://huggingface.co/settings/tokens) 获取 API 密钥。
4.  **复制密钥:** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 GLaM-A 模型：

*   `kaist-ai/glam`
*   `kaist-ai/glam-base`
*   `kaist-ai/glam-large`
*   `kaist-ai/glam-xl`

关于每个模型功能的详细信息，请参阅 [GLaM-A 文档](https://huggingface.co/spaces/kaist-ai/glam)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "GLaM-A"。
3.  **输入 API 密钥:** 将您的 Hugging Face API 密钥粘贴到 "GLaM-A API Key" 字段中。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义基础 URL:** 如果需要使用自定义的 GLaM-A API 基础 URL，请勾选 "Use custom base URL" 并输入 URL。大多数人不需要调整此项。

---

## 提示与注意事项

*   **上下文窗口:** GLaM-A 模型具有较大的上下文窗口（8192 tokens），允许您在提示中包含大量代码和上下文信息。
*   **定价:** GLaM-A 是开源模型，因此没有直接的 API 成本。但是，您可能需要支付 Hugging Face 的使用费用。
*   **速率限制:** Hugging Face 根据 [使用层级](https://huggingface.co/docs/hub/api#rate-limiting) 实施严格的速率限制。如果您反复遇到速率限制，请考虑升级您的账户计划或联系 Hugging Face 支持团队。