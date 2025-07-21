---
sidebar_label: GCP Vertex AI
---

# 在 Roo Code 中使用 GCP Vertex AI

Roo Code 支持通过 Google Cloud Platform 的 Vertex AI 访问模型，Vertex AI 是一个托管的机器学习平台，提供了对各种基础模型的访问权限，包括 Anthropic 的 Claude 家族。

**官方网站:** [https://cloud.google.com/vertex-ai](https://cloud.google.com/vertex-ai)

---

## 前提条件

*   **Google Cloud 账户：** 您需要一个活跃的 Google Cloud Platform (GCP) 账户。
*   **项目：** 您需要一个启用了 Vertex AI API 的 GCP 项目。
*   **模型访问权限：** 您必须申请并获得对特定 Vertex AI 模型的访问权限。请参阅 [Google Cloud 文档](https://cloud.google.com/vertex-ai/generative-ai/docs/partner-models/use-claude#before_you_begin) 以获取说明。
*   **应用默认凭据 (ADC)：** Roo Code 使用应用默认凭据进行身份验证。最简单的方法是：
    1.  安装 Google Cloud CLI: [https://cloud.google.com/sdk/docs/install](https://cloud.google.com/sdk/docs/install)
    2.  使用以下命令进行身份验证：`gcloud auth application-default login`
*   **服务账户密钥（替代方案）：** 或者，您可以使用 Google Cloud 服务账户密钥文件进行身份验证。您需要在 GCP 项目中生成此密钥文件。请参阅 [Google Cloud 文档](https://cloud.google.com/iam/docs/creating-managing-service-account-keys) 以获取创建服务账户密钥的说明。

---

## 支持的模型

Roo Code 支持通过 Vertex AI 访问以下模型（基于源代码）：

*   **Google Gemini 模型：**
    *   `gemini-2.5-flash-preview-05-20`
    *   `gemini-2.0-flash-001`
    *   `gemini-2.5-pro-exp-03-25`
    *   `gemini-2.0-pro-exp-02-05`
    *   `gemini-2.0-flash-lite-001`
    *   `gemini-2.0-flash-thinking-exp-01-21`
    *   `gemini-1.5-flash-002`
    *   `gemini-1.5-pro-002`
*   **Anthropic Claude 模型：**
    *   `claude-opus-4@20250514:thinking`
    *   `claude-opus-4@20250514`
    *   `claude-sonnet-4@20250514:thinking`
    *   `claude-sonnet-4@20250514`
    *   `claude-3-7-sonnet@20250219:thinking`
    *   `claude-3-7-sonnet@20250219`
    *   `claude-3-5-sonnet-v2@20241022`
    *   `claude-3-5-sonnet@20240620`
    *   `claude-3-5-haiku@20241022`
    *   `claude-3-opus@20240229`
    *   `claude-3-haiku@20240307`

请参阅 [Google Cloud 文档](https://cloud.google.com/vertex-ai/generative-ai/docs/learn/models) 以获取最新可用模型及其 ID 的完整列表。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置：** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商：** 从 "API Provider" 下拉菜单中选择 "GCP Vertex AI"。
3.  **配置身份验证：**
    *   **如果使用应用默认凭据 (ADC)：** 不需要进一步的操作，只要正确配置了 ADC 即可自动使用。
    *   **如果不使用 ADC（服务账户密钥）：**
        *   **选项 A: 粘贴 JSON 内容：** 将您的服务账户 JSON 密钥文件的全部内容粘贴到 "Google Cloud Credentials" 字段中。
        *   **选项 B: 提供文件路径：** 输入您下载的服务账户 JSON 密钥文件的绝对路径到 "Google Cloud Key File Path" 字段中。
4.  **输入项目 ID：** 输入您的 Google Cloud 项目 ID。
5.  **选择区域：** 选择您的 Vertex AI 资源所在的区域（例如 `us-east5`）。
6.  **选择模型：** 从下拉菜单中选择您需要的模型。
---

## 提示与注意事项

*   **权限：** 确保您的 Google Cloud 账户具有访问 Vertex AI 和特定模型的必要权限。
*   **定价：** 请参考 [Vertex AI 定价页面](https://cloud.google.com/vertex-ai/pricing) 以获取详细信息。
