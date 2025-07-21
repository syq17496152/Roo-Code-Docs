---
sidebar_label: AWS Bedrock
---

# 在 Roo Code 中使用 AWS Bedrock

Roo Code 支持通过 Amazon Bedrock 访问模型，Bedrock 是一项完全托管的服务，可通过单一 API 提供来自领先 AI 公司的高性能基础模型(FMs)。

**官方网站:** [https://aws.amazon.com/bedrock/](https://aws.amazon.com/bedrock/)

---

## 前提条件

*   **AWS 账户:** 您需要一个有效的 AWS 账户。
*   **Bedrock 访问权限:** 必须申请并获得 Amazon Bedrock 的访问权限。关于请求访问权限的详细信息，请参阅 [AWS Bedrock 文档](https://docs.aws.amazon.com/bedrock/latest/userguide/getting-started.html)。
*   **模型访问权限:** 在 Bedrock 中，您需要申请访问特定模型的权限（例如 Anthropic Claude）。
*   **安装 AWS CLI:** 使用 AWS CLI 配置账户认证
    ```bash
     aws configure
    ```

---

## 获取凭证

配置 AWS 凭证有两个主要选项：

1.  **AWS 访问密钥（推荐用于开发）：**
    *   创建具有必要权限（至少 `bedrock:InvokeModel`）的 IAM 用户。
    *   为该用户生成访问密钥 ID 和秘密访问密钥。
    *   （可选）如果您的 IAM 配置有要求，可以创建会话令牌。
2.  **AWS 配置文件：**
    *   使用 AWS CLI 配置 AWS 配置文件，或通过手动编辑 AWS 凭证文件。有关详细信息，请参阅 [AWS CLI 文档](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)。

---

## 支持的模型

Roo Code 通过 Bedrock 支持以下模型（基于源代码）：

*   **Amazon:**
    *   `amazon.nova-pro-v1:0`
    *   `amazon.nova-pro-latency-optimized-v1:0`
    *   `amazon.nova-lite-v1:0`
    *   `amazon.nova-micro-v1:0`
    *   `amazon.titan-text-lite-v1:0`
    *   `amazon.titan-text-express-v1:0`
    *   `amazon.titan-text-embeddings-v1:0`
    *   `amazon.titan-text-embeddings-v2:0`
*   **Anthropic:**
    *   `anthropic.claude-opus-4-20250514-v1:0`
    *   `anthropic.claude-sonnet-4-20250514-v1:0`
    *   `anthropic.claude-3-7-sonnet-20250219-v1:0`
    *   `anthropic.claude-3-5-sonnet-20241022-v2:0`
    *   `anthropic.claude-3-5-haiku-20241022-v1:0`
    *   `anthropic.claude-3-5-sonnet-20240620-v1:0`
    *   `anthropic.claude-3-opus-20240229-v1:0`
    *   `anthropic.claude-3-sonnet-20240229-v1:0`
    *   `anthropic.claude-3-haiku-20240307-v1:0`
    *   `anthropic.claude-2-1-v1:0`
    *   `anthropic.claude-2-0-v1:0`
    *   `anthropic.claude-instant-v1:0`
*   **DeepSeek:**
    *   `deepseek.r1-v1:0`
*   **Meta:**
    *   `meta.llama3-3-70b-instruct-v1:0`
    *   `meta.llama3-2-90b-instruct-v1:0`
    *   `meta.llama3-2-11b-instruct-v1:0`
    *   `meta.llama3-2-3b-instruct-v1:0`
    *   `meta.llama3-2-1b-instruct-v1:0`
    *   `meta.llama3-1-405b-instruct-v1:0`
    *   `meta.llama3-1-70b-instruct-v1:0`
    *   `meta.llama3-1-70b-instruct-latency-optimized-v1:0`
    *   `meta.llama3-1-8b-instruct-v1:0`
    *   `meta.llama3-70b-instruct-v1:0`
    *   `meta.llama3-8b-instruct-v1:0`

关于可用模型及其 ID 的最新列表，请参考 [Amazon Bedrock 文档](https://docs.aws.amazon.com/bedrock/latest/userguide/models-supported.html)。在配置 Roo Code 时，请确保使用*模型 ID*，而不是模型名称。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Bedrock"。
3.  **选择认证方式：**
    *   **AWS 凭证：**
        *   输入您的 "AWS 访问密钥" 和 "AWS 秘密密钥"。
        *   （可选）如果您使用临时凭证，请输入 "AWS 会话令牌"。
    *   **AWS 配置文件：**
        *   输入您的 "AWS 配置文件" 名称（例如 "default"）。
4.  **选择区域：** 选择您的 Bedrock 服务可用的 AWS 区域（例如 "us-east-1"）。
5.  **（可选）跨区域推理：** 如果要访问与配置的 AWS 区域不同的区域中的模型，请勾选 "Use cross-region inference"。
6.  **（可选）VPC 终端节点：** 对于企业环境：
    *   勾选 "Use VPC Endpoint" 以通过您的 VPC 终端节点路由所有 Bedrock API 调用
    *   在出现的文本字段中输入您的 VPC 终端节点 URL
    *   这可确保所有 LLM 事务都保留在您的企业网络内
7.  **选择模型：** 从下拉菜单中选择您需要的模型。

---

## Claude 模型的推理预算

Roo Code 支持在 Bedrock 上使用 Anthropic 的 Claude 模型的推理预算（扩展思考功能）。这允许模型在响应前进行更深入的思考，对于复杂任务非常有用。

启用推理预算的方法：

1.  **选择支持的 Claude 模型**（例如 `anthropic.claude-3-sonnet-20240229-v1:0`）。
2.  **在模型设置中启用推理模式**。
3.  **调整思考预算** 以控制模型应思考的程度。

此功能仅适用于支持的 Claude 模型。

## 提示与注意事项

*   **权限：** 确保您的 IAM 用户或角色具有调用 Bedrock 模型的必要权限。需要 `bedrock:InvokeModel` 权限。
*   **定价：** 请参考 [Amazon Bedrock 定价页面](https://aws.amazon.com/bedrock/pricing/) 获取模型成本详情。
*   **跨区域推理：** 使用跨区域推理可能会导致更高的延迟。
*   **VPC 终端节点：** 使用 VPC 终端节点时，请确保您的终端节点已正确配置以处理 Bedrock API 调用。对于必须将所有 API 流量保留在私有网络内的组织，此功能特别有用。