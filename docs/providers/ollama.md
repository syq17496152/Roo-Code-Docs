---
sidebar_label: Ollama
---

# 在 Roo Code 中使用 Ollama

Ollama 是一个本地运行的大型语言模型 (LLM) 应用程序，允许您在不连接互联网的情况下使用多种开源模型。它提供了一个简单的命令行界面和 API，支持多种模型格式。

**官方网站:** [https://ollama.com/](https://ollama.com/)

---

## 安装与配置

1.  **下载与安装:** 访问 [Ollama 下载页面](https://ollama.com/download) 下载适用于您操作系统的版本。
2.  **安装模型:** 打开终端，运行以下命令安装模型：
    ```bash
    ollama pull <model-name>
    ```
    例如，安装 Llama3 模型：
    ```bash
    ollama pull llama3
    ```
3.  **启动模型:** 在终端运行以下命令启动模型：
    ```bash
    ollama run <model-name>
    ```
4.  **获取基础 URL:** Ollama 默认在 `http://localhost:11434` 上运行。确保该 URL 可以从 Roo Code 访问。

---

## 支持的模型

Ollama 支持以下模型：

*   **Llama3 Models:**
    *   `llama3`
    *   `llama3:8b`
    *   `llama3:70b`
*   **Mistral Models:**
    *   `mistral`
    *   `mistral:7b`
*   **Code Models:**
    *   `codellama`
    *   `codellama:7b`
    *   `codellama:13b`
    *   `codellama:34b`
*   **Other Models:**
    *   `dolphin-llama3`
    *   `dolphin-mixtral`
    *   `dolphin-phi`
    *   `gemma`
    *   `gemma:2b`
    *   `gemma:7b`
    *   `phi3`
    *   `phi3:3.8b`
    *   `phi3:12.8b`

关于每个模型功能的详细信息，请参阅 [Ollama 模型库](https://ollama.com/library)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "Ollama"。
3.  **输入基础 URL:** 将 Ollama 的基础 URL 粘贴到 "Ollama Base URL" 字段中。默认情况下，Ollama 运行在 `http://localhost:11434`。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义模型路径:** 如果您的模型不在默认目录中，请勾选 "Use custom model path" 并输入模型路径。

---

## 提示与注意事项

*   **本地运行:** Ollama 是一个本地应用程序，因此您需要确保其正在运行并且可以从 Roo Code 访问。
*   **模型性能:** Ollama 支持多种模型格式，确保选择适合您硬件的模型。
*   **资源占用:** 本地模型可能需要较大的内存和计算资源，确保您的系统满足模型的最低要求。
*   **隐私:** 由于模型在本地运行，您的数据不会上传到云端，确保了隐私安全。