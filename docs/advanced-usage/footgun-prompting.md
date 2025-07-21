---
sidebar_label: 'Footgun Prompting'
---

# Footgun Prompting：覆盖系统提示词

Footgun Prompting（系统提示词覆盖）允许您替换特定 Roo Code 模式的默认系统提示词。这提供了细粒度的控制，但会绕过内置的安全措施。请谨慎使用。

<img src="/img/footgun-prompting/footgun-prompting-1.png" alt="活动系统提示词覆盖的警告指示器" width="600" />
**警告指示器：** 当当前模式激活了系统提示词覆盖时，Roo Code 会在聊天输入区域显示一个警告图标，提醒您默认行为已被修改。


:::info **footgun** _(名词)_

1.  _(编程俚语，幽默，贬义)_ 任何可能导致程序员自作自受的功能。

> 系统提示词覆盖被视为一种 footgun，因为如果没有深入理解而修改核心指令，可能会导致意外或错误的行为，特别是关于工具使用和响应一致性方面。

:::

---

## 工作原理

1.  **覆盖文件：** 在工作区根目录创建一个名为 `.roo/system-prompt-{mode-slug}` 的文件（例如，`.roo/system-prompt-code` 用于代码模式）。
2.  **内容：** 该文件的内容将成为该特定模式的新系统提示词。
3.  **激活：** Roo Code 自动检测此文件。当存在时，它会替换大部分标准系统提示词部分。
4.  **保留的部分：** 仅保留核心 `roleDefinition` 和您为该模式设置的任何 `customInstructions`。标准部分如工具描述、规则和功能将被绕过。
5.  **构建方式：** 发送给模型的最终提示词如下所示：

    ```
    ${roleDefinition}

    ${您的覆盖文件内容}

    ${customInstructions}
    ```

---

## 访问该功能

在 Roo Code UI 中找到该选项和说明：

1.  点击 Roo Code 顶部菜单栏中的 <Codicon name="notebook" /> 图标。
2.  展开 **"高级：覆盖系统提示词"** 部分。
3.  点击解释中的文件路径链接将在 VS Code 中打开或创建当前所选模式的正确覆盖文件。

<img src="/img/footgun-prompting/footgun-prompting.png" alt="显示高级：覆盖系统提示词部分的UI" width="500" />

---

## 使用上下文变量

在创建自定义系统提示词文件时，您可以使用特殊变量（占位符），Roo Code 将自动将其替换为与当前环境相关的相关信息。这使您可以使提示词更加动态和上下文感知。

以下是可用的变量：

- `{{mode}}`: 当前使用的 Roo Code 模式的 slug（短名称）（例如，`code`, `chat-mode`）。
- `{{language}}`: VS Code 中配置的显示语言（例如，`en`, `es`）。
- `{{shell}}`: VS Code 中配置的默认终端 shell（例如，`/bin/bash`, `powershell.exe`）。
- `{{operatingSystem}}`: 您计算机运行的操作系统类型（例如，`Linux`, `Darwin` 表示 macOS, `Windows_NT`）。
- `{{workspace}}`: 当前项目工作区根目录的文件路径。

**示例用法：**

您可以在提示词文件内容中直接包含这些变量，如下所示：

```
您正在协助用户在 '{{mode}}' 模式下操作。
他们的操作系统是 {{operatingSystem}}，默认 shell 是 {{shell}}。
项目位于：{{workspace}}。
请用 {{language}} 回复。
```

Roo Code 会在将提示词发送给模型之前替换这些占位符。

---

## 关键注意事项和警告

- **目标受众：** 最适合深入了解 Roo Code 提示词系统及其修改核心指令影响的用户。
- **对功能的影响：** 自定义提示词会覆盖标准指令，包括工具使用和响应一致性方面的指令。如果管理不当，可能会导致意外行为或错误。
- **模式特定性：** 每个覆盖文件仅适用于其文件名中指定的模式 (`{mode-slug}`)。
- **无文件，无覆盖：** 如果不存在 `.roo/system-prompt-{mode-slug}` 文件，Roo Code 将为该模式使用标准系统提示词生成过程。
- **空白文件被忽略：** 如果覆盖文件存在但为空（空白），它将被忽略，并使用默认系统提示词。
- **目录创建：** Roo Code 会在尝试读取或创建覆盖文件之前确保 `.roo` 目录存在。
谨慎使用此功能。实现不当可能会显著降低受影响模式的性能和可靠性。