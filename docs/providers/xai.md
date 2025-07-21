---
sidebar_label: xAI (Grok)
---

# 在 Roo Code 中使用 xAI (Grok)

xAI 是 Grok 的公司，Grok 是一个以强大对话能力和大上下文窗口而闻名的大型语言模型。Grok 模型旨在提供有用、信息丰富且上下文相关的响应。

**官方网站:** [https://x.ai/](https://x.ai/)

---

## 获取 API 密钥

1.  **注册/登录:** 访问 [xAI 控制台](https://console.x.ai/) 创建账户或登录。
2.  **获取 API 密钥:** 进入 [API 密钥页面](https://console.x.ai/api-keys)。
3.  **创建密钥:** 点击 "Create Key"，为密钥输入描述性名称（例如 "Roo Code"）。
4.  **复制密钥:** **重要：** 立即复制 API 密钥，该密钥仅显示一次，请妥善保存。

---

## 支持的模型

Roo Code 支持以下 xAI Grok 模型：

### Grok-3 模型
* `grok-3-beta` (默认) - xAI 的 Grok-3 beta 模型，上下文窗口为 131K
* `grok-3-fast-beta` - xAI 的 Grok-3 fast beta 模型，上下文窗口为 131K
* `grok-3-mini-beta` - xAI 的 Grok-3 mini beta 模型，上下文窗口为 131K
* `grok-3-mini-fast-beta` - xAI 的 Grok-3 mini fast beta 模型，上下文窗口为 131K

### Grok-2 模型
* `grok-2-latest` - xAI 的 Grok-2 模型 - 最新版本，上下文窗口为 131K
* `grok-2` - xAI 的 Grok-2 模型，上下文窗口为 131K
* `grok-2-1212` - xAI 的 Grok-2 模型（版本 1212），上下文窗口为 131K

### Grok Vision 模型
* `grok-2-vision-latest` - xAI 的 Grok-2 Vision 模型 - 最新版本，支持图像，上下文窗口为 32K
* `grok-2-vision` - xAI 的 Grok-2 Vision 模型，支持图像，上下文窗口为 32K
* `grok-2-vision-1212` - xAI 的 Grok-2 Vision 模型（版本 1212），支持图像，上下文窗口为 32K
* `grok-vision-beta` - xAI 的 Grok Vision Beta 模型，支持图像，上下文窗口为 8K

### 遗留模型
* `grok-beta` - xAI 的 Grok Beta 模型（遗留），上下文窗口为 131K

---

## 在 Roo Code 中配置

1.  **打开 Roo Code 设置：** 点击 Roo Code 面板中的齿轮图标 (<Codicon name="gear" />)。
2.  **选择提供商：** 从 "API Provider" 下拉菜单中选择 "xAI"。
3.  **输入 API 密钥：** 将您的 xAI API 密钥粘贴到 "xAI API Key" 字段中。
4.  **选择模型：** 从下拉菜单中选择您需要的 Grok 模型。

---

## 推理能力

Grok 3 Mini 模型支持专门的推理能力，允许模型在响应前进行 "思考" - 特别适用于复杂的问题解决任务。

### 支持推理的模型

推理仅支持以下模型：
* `grok-3-mini-beta`
* `grok-3-mini-fast-beta`

Grok 3 模型 `grok-3-beta` 和 `grok-3-fast-beta` 不支持推理。

### 控制推理努力

使用推理支持的模型时，您可以控制模型思考的难度：

* `low`: 最小思考时间，使用更少的令牌以快速响应
* `high`: 最大思考时间，使用更多令牌以解决复杂问题

对于简单的查询选择 `low`，对于需要快速不重要的问题选择 `high`。

### 关键特性

* **逐步解决问题：** 模型会逐步思考问题并提供解决方案
* **数学与定量能力：** 在数字挑战和逻辑谜题方面表现出色
* **推理轨迹访问：** 模型的思考过程可以通过响应完成对象中的 `reasoning_content` 字段访问

---

## 提示与注意事项

* **上下文窗口：** 大多数 Grok 模型具有大上下文窗口（最多 131K 令牌），允许您在提示中包含大量代码和上下文信息。
* **视觉能力：** 选择支持视觉的模型（如 `grok-2-vision-latest`、`grok-2-vision` 等）以处理或分析图像。
* **定价：** 定价因模型而异，输入成本范围从 $0.3 到 $5.0 每百万令牌，输出成本从 $0.5 到 $25.0 每百万令牌。请参阅 xAI 文档以获取最新的定价信息。
* **性能权衡：** "Fast" 变体通常提供更快的响应时间，但可能成本更高，而 "mini" 变体更经济，但可能功能有所减少。