---
sidebar_label: OpenAI Compatible
---

# 在 Roo Code 中使用 OpenAI Compatible 提供商

Roo Code 支持使用提供与 OpenAI API 标准兼容的 API 的各种 AI 模型提供商。这意味着您可以使用 *除 OpenAI 之外* 的提供商提供的模型，同时仍然使用熟悉的 API 接口。这包括：

*   **本地模型** 通过 Ollama 和 LM Studio 等工具运行。
*   **云提供商** 如 Perplexity、Together AI、Anyscale 等。
*   **任何其他提供 OpenAI 兼容 API 端点的提供商**。

本文档重点介绍如何配置 *除 OpenAI 官方 API 之外* 的提供商。有关 OpenAI 官方 API 的配置，请参阅 [OpenAI 配置页面](/providers/openai)。

---

## 通用配置

使用 OpenAI 兼容提供商的关键是配置以下两个主要设置：

1.  **基础 URL:** 这是提供商的 API 端点。它 *不会* 是 `https://api.openai.com/v1`（这是 OpenAI 官方 API 的地址）。
2.  **API 密钥:** 这是从提供商获取的秘密密钥。
3.  **模型 ID:** 这是特定模型的名称。

您可以在 Roo Code 设置面板中找到这些设置（点击齿轮图标 <Codicon name="gear" />）：

*   **API 提供商:** 选择 "OpenAI Compatible"。
*   **基础 URL:** 输入提供商提供的基础 URL。**这是关键。**
*   **API 密钥:** 输入您的 API 密钥。
*   **模型:** 选择一个模型。
*   **模型配置:** 这允许您自定义模型的高级配置
    - 最大输出令牌数
    - 上下文窗口
    - 图像支持
    - 计算使用
    - 输入价格
    - 输出价格

---

## 支持的模型（用于 OpenAI 原生端点）

虽然此提供商类型允许连接到各种端点，但如果您连接到官方 OpenAI API（或完全镜像它的端点），Roo Code 会识别以下基于其源代码中 `openAiNativeModels` 定义的模型 ID：

*   `o3-mini`
*   `o3-mini-high`
*   `o3-mini-low`
*   `o1`
*   `o1-preview`
*   `o1-mini`
*   `gpt-4.5-preview`
*   `gpt-4o`
*   `gpt-4o-mini`

**注意：** 如果您使用的是不同的 OpenAI 兼容提供商（如 Together AI、Anyscale 等），可用的模型 ID 会有所不同。请始终参考您特定提供商的文档以获取其支持的模型名称。

---

## 故障排除

*   **"无效的 API 密钥":** 请仔细检查您输入的 API 密钥是否正确。
*   **"模型未找到":** 确保您使用的是您选择的提供商的有效模型 ID。
*   **连接错误：** 验证基础 URL 是否正确，并且您的提供商的 API 是否可访问。
*   **意外结果：** 如果您得到意外结果，请尝试不同的模型。

通过使用 OpenAI 兼容提供商，您可以利用 Roo Code 的灵活性与更广泛的 AI 模型。请记住始终查阅您的提供商的文档以获取最准确和最新的信息。