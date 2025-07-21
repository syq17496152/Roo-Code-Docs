---
sidebar_label: LiteLLM
---

# 在 Roo Code 中使用 LiteLLM

LiteLLM 是一个轻量级的代理服务器，允许您通过统一的 API 接口访问多个大型语言模型 (LLMs)。它支持多种提供商，包括 OpenAI、Anthropic、Google、Amazon Bedrock、Azure 等。

**官方网站:** [https://litellm.vercel.app/](https://litellm.vercel.app/)

---

## 获取 API 密钥

LiteLLM 本身不需要 API 密钥，但您需要为所选的底层提供商获取相应的 API 密钥。例如，如果您选择使用 OpenAI 模型，则需要 OpenAI 的 API 密钥。

---

## 支持的模型

LiteLLM 支持以下模型（基于源代码）：

*   **OpenAI Models:**
    *   `gpt-4o`
    *   `gpt-4o-mini`
    *   `gpt-3.5-turbo`
    *   `gpt-4`
    *   `gpt-4-32k`
    *   `gpt-3.5-turbo-16k`
*   **Anthropic Models:**
    *   `claude-opus-4`
    *   `claude-sonnet-4`
    *   `claude-3-5-sonnet`
    *   `claude-3-haiku`
    *   `claude-3-opus`
    *   `claude-3-sonnet`
*   **Google Models:**
    *   `gemini-pro`
    *   `gemini-pro-vision`
    *   `gemini-1.5-pro`
    *   `gemini-1.5-flash`
*   **Amazon Bedrock Models:**
    *   `amazon.nova-pro`
    *   `amazon.nova-lite`
    *   `anthropic.claude-opus-4`
    *   `anthropic.claude-sonnet-4`
    *   `anthropic.claude-3-5-sonnet`
    *   `anthropic.claude-3-haiku`
    *   `anthropic.claude-3-opus`
    *   `anthropic.claude-3-sonnet`
*   **Azure OpenAI Models:**
    *   `azure/gpt-4`
    *   `azure/gpt-4-32k`
    *   `azure/gpt-3.5-turbo`
    *   `azure/gpt-3.5-turbo-16k`
*   **Groq Models:**
    *   `llama3-70b`
    *   `llama3-8b`
    *   `mixtral-8x7b`
    *   `gemma-7b`
*   **DeepSeek Models:**
    *   `deepseek-chat`
    *   `deepseek-coder`
*   **OpenRouter Models:**
    *   `openrouter/qwen`
    *   `openrouter/deepseek`
    *   `openrouter/anthropic`
    *   `openrouter/openai`
    *   `openrouter/google`
    *   `openrouter/mistral`
    *   `openrouter/meta`
    *   `openrouter/nous`
    *   `openrouter/codestral`
    *   `openrouter/perplexity`
    *   `openrouter/groq`
    *   `openrouter/anthropic-4`
    *   `openrouter/openai-4`
    *   `openrouter/google-4`
    *   `openrouter/mistral-4`
    *   `openrouter/meta-4`
    *   `openrouter/nous-4`
    *   `openrouter/codestral-4`
    *   `openrouter/perplexity-4`
    *   `openrouter/groq-4`

关于每个模型功能的详细信息，请参阅 [LiteLLM 文档](https://litellm.vercel.app/docs/providers)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "LiteLLM"。
3.  **输入基础 URL:** 将 LiteLLM 代理服务器的 URL 粘贴到 "LiteLLM Base URL" 字段中。默认情况下，LiteLLM 运行在 `http://localhost:8000`。
4.  **(可选) 输入 API 密钥:** 如果您的 LiteLLM 服务器需要 API 密钥，请将其粘贴到 "LiteLLM API Key" 字段中。
5.  **选择模型:** 从下拉菜单中选择您需要的模型。

---

## 提示与注意事项

*   **代理服务器:** LiteLLM 是一个代理服务器，因此您需要确保其正在运行并且可以通过网络访问。
*   **模型选择:** LiteLLM 支持多种模型，但具体可用模型取决于您的 LiteLLM 配置和底层提供商。
*   **性能:** LiteLLM 可以提高模型访问的灵活性，但可能会引入额外的网络延迟。
*   **安全性:** 确保 LiteLLM 服务器的安全性，防止未经授权的访问。