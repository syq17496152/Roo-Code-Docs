---
sidebar_label: .rooignore
---

# 使用 .rooignore 控制文件访问

`.rooignore` 文件是管理 Roo Code 与项目文件交互的关键功能。它允许您指定 Roo 不应访问或修改的文件和目录，类似于 `.gitignore` 对 Git 的作用。

---

## 什么是 `.rooignore`？

*   **用途**：保护敏感信息，防止意外更改构建产物或大体积资源，并通常定义 Roo 在工作区内的操作范围。
*   **使用方法**：在 VS Code 工作区根目录创建名为 `.rooignore` 的文件。在此文件中列出模式，告知 Roo 哪些文件和目录应被忽略。
*   **作用范围**：`.rooignore` 影响 Roo 的工具和上下文提及（如 `@directory` 附件）。

Roo 主动监控 `.rooignore` 文件。您所做的任何更改都会自动重新加载，确保 Roo 始终使用最新的规则。`.rooignore` 文件本身始终隐式被忽略，因此 Roo 无法更改其自身的访问规则。

// ... existing code ...

## 模式语法

`.rooignore` 的语法与 `.gitignore` 相同。以下是常见示例：

*   `node_modules/`：忽略整个 `node_modules` 目录。
*   `*.log`：忽略所有以 `.log` 结尾的文件。
*   `config/secrets.json`：忽略特定文件。
*   `!important.log`：例外情况；即使存在更广泛的模式（如 `*.log`），Roo 也不会忽略此特定文件。
*   `build/`：忽略 `build` 目录。
*   `docs/**/*.md`：忽略 `docs` 目录及其子目录中的所有 Markdown 文件。

有关语法的全面指南，请参阅 [.gitignore 官方文档](https://git-scm.com/docs/gitignore)。

// ... existing code ...

## Roo 工具如何与 `.rooignore` 交互

`.rooignore` 规则在各种 Roo 工具中强制执行：

### 严格实施（读取 & 写入）

这些工具在任何文件操作前直接检查 `.rooignore`。如果文件被忽略，则操作被阻止：

*   [`read_file`](/advanced-usage/available-tools/read-file)：不会读取被忽略的文件。
*   [`write_to_file`](/advanced-usage/available-tools/write-to-file)：不会写入或创建新的被忽略文件。
*   [`apply_diff`](/advanced-usage/available-tools/apply-diff)：不会对被忽略的文件应用差异。
*   [`insert_content`](/advanced-usage/available-tools/insert-content)：不会写入被忽略的文件。
*   [`search_and_replace`](/advanced-usage/available-tools/search-and-replace)：不会在被忽略的文件中搜索和替换。
*   [`list_code_definition_names`](/advanced-usage/available-tools/list-code-definition-names)：不会解析被忽略的文件以获取代码符号。

// ... existing code ...

## 关键限制和范围

*   **工作区中心**：`.rooignore` 规则仅适用于当前 VS Code 工作区根目录内的文件和目录。此范围外的文件不受影响。
*   **[`execute_command`](/advanced-usage/available-tools/execute-command) 特异性**：对 `execute_command` 的保护限于预定义的文件读取命令列表。自定义脚本或不常见的实用程序可能不会被捕获。
*   **非完整沙盒**：`.rooignore` 是控制 Roo 通过其工具访问文件的强大工具，但它不会创建系统级沙盒。

// ... existing code ...

## 用户体验和通知

*   **视觉提示（🔒）**：在文件列表和 `@directory` 附件中，根据 `showRooIgnoredFiles` 设置（默认为 `true`），被 `.rooignore` 忽略的文件可能会显示锁形图标（🔒）。
*   **忽略消息**：单个文件提及会返回 "(File is ignored by .rooignore)" 而不是内容。
*   **错误消息**：如果工具操作被阻止，Roo 会收到错误：`"Access to [file_path] is blocked by the .rooignore file settings. You must try to continue in the task without using this file, or ask the user to update the .rooignore file."`
*   **聊天通知**：当因 `.rooignore` 阻止操作时，您通常会在 Roo 聊天界面中看到通知。

本指南帮助您理解 `.rooignore` 功能、其能力及当前限制，以便有效管理 Roo 与代码库的交互。