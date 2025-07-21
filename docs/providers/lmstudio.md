---
sidebar_label: LM Studio
---

# 在 Roo Code 中使用 LM Studio

LM Studio 是一个本地运行的大型语言模型 (LLM) 应用程序，允许您在不连接互联网的情况下使用多种开源模型。它提供了一个用户友好的界面，支持多种模型格式，如 GGUF、Hugging Face 和 ONNX。

**官方网站:** [https://www LM-Studio.com/](https://www LM-Studio.com/)

---

## 安装与配置

1.  **下载与安装:** 访问 [LM Studio 下载页面](https://www LM-Studio.com/download) 下载适用于您操作系统的版本。
2.  **安装模型:** 打开 LM Studio 应用程序，访问 [模型库](https://www LM-Studio.com/models) 下载您需要的模型。推荐使用 GGUF 格式的模型，因为它们在本地运行时性能最佳。
3.  **启动模型:** 在 LM Studio 中选择已下载的模型，点击 "Start" 启动模型。
4.  **获取基础 URL:** LM Studio 默认在 `http://localhost:1234` 上运行。确保该 URL 可以从 Roo Code 访问。

---

## 支持的模型

LM Studio 支持以下模型格式：

*   **GGUF:** 推荐格式，性能最佳。
*   **Hugging Face:** 支持多种 Hugging Face 模型。
*   **ONNX:** 支持 ONNX 格式的模型。

关于每个模型功能的详细信息，请参阅 [LM Studio 文档](https://docs LM-Studio.com/)。

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置:** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商:** 从 "API Provider" 下拉菜单中选择 "LM Studio"。
3.  **输入基础 URL:** 将 LM Studio 的基础 URL 粘贴到 "LM Studio Base URL" 字段中。默认情况下，LM Studio 运行在 `http://localhost:1234`。
4.  **选择模型:** 从下拉菜单中选择您需要的模型。
5.  **(可选) 自定义模型路径:** 如果您的模型不在默认目录中，请勾选 "Use custom model path" 并输入模型路径。

---

## 提示与注意事项

*   **本地运行:** LM Studio 是一个本地应用程序，因此您需要确保其正在运行并且可以从 Roo Code 访问。
*   **模型性能:** GGUF 格式的模型在本地运行时性能最佳。
*   **资源占用:** 本地模型可能需要较大的内存和计算资源，确保您的系统满足模型的最低要求。
*   **隐私:** 由于模型在本地运行，您的数据不会上传到云端，确保了隐私安全。