---
sidebar_label: .rooignore
---

# 使用.rooignore控制文件访问

`.rooignore`文件是管理Roo Code与项目文件交互的关键功能。它允许您指定Roo不应访问或修改的文件和目录，类似于`.gitignore`在Git中的作用。

---

## 什么是`.rooignore`？

*   **用途**：保护敏感信息，防止意外修改构建产物或大型资产，并定义Roo在工作区内的操作范围。
*   **使用方法**：在VS Code工作区根目录创建名为`.rooignore`的文件。在此文件中列出模式，告诉Roo哪些文件和目录需要忽略。
*   **作用范围**：`.rooignore`会影响Roo的所有工具和上下文引用（如`@directory`附件）。

Roo会主动监控`.rooignore`文件。您所做的任何更改都会自动重新加载，确保Roo始终使用最新的规则。`.rooignore`文件本身始终被隐式忽略，因此Roo无法更改自己的访问规则。

---

## 模式语法

`.rooignore`的语法与`.gitignore`完全相同。以下是常见示例：

*   `node_modules/`：忽略整个`node_modules`目录。
*   `*.log`：忽略所有以`.log`结尾的文件。
*   `config/secrets.json`：忽略特定文件。
*   `!important.log`：例外情况；即使存在更广泛的模式如`*.log`，Roo也不会忽略此特定文件。
*   `build/`：忽略`build`目录。
*   `docs/**/*.md`：忽略`docs`目录及其子目录中的所有Markdown文件。

完整语法指南请参考[官方Git文档关于.gitignore](https://git-scm.com/docs/gitignore)。

---

## Roo工具如何与.rooignore交互

`.rooignore`规则在各种Roo工具中强制执行：

### 严格限制（读写操作）

这些工具在任何文件操作前都会直接检查`.rooignore`。如果文件被忽略，操作将被阻止：

*   [`read_file`](/advanced-usage/available-tools/read-file)：不会读取被忽略的文件。
*   [`write_to_file`](/advanced-usage/available-tools/write-to-file)：不会写入或创建新的被忽略文件。
*   [`apply_diff`](/advanced-usage/available-tools/apply-diff)：不会将差异应用于被忽略的文件。
*   [`insert_content`](/advanced-usage/available-tools/insert-content)：不会写入被忽略的文件。
*   [`search_and_replace`](/advanced-usage/available-tools/search-and-replace)：不会在被忽略的文件中搜索和替换。
*   [`list_code_definition_names`](/advanced-usage/available-tools/list-code-definition-names)：不会解析被忽略的文件以获取代码符号。

### 文件发现和列表

*   **[`list_files`](/advanced-usage/available-tools/list-files)工具 & `@directory`附件**：当Roo列出文件或使用`@directory`附件时，被忽略的文件会被省略或标记🔒符号（见下文"用户体验"部分）。两者使用相同的过滤逻辑。
*   **环境详情**：提供给Roo的工作区信息（如打开的标签和项目结构）会过滤或标记被忽略的项目。

### 上下文引用

*   **`@directory`附件**：目录内容遵守`.rooignore`模式。被忽略的文件会根据`showRooIgnoredFiles`设置过滤或标记`[🔒]`前缀。
*   **单个文件引用**：被忽略的文件会返回"(File is ignored by .rooignore)"而非内容。

### 命令执行

*   **[`execute_command`](/advanced-usage/available-tools/execute-command)工具**：此工具会检查命令（来自预定义列表如`cat`或`grep`）是否针对被忽略的文件。如果是，执行将被阻止。

---

## 主要限制和范围

*   **以工作区为中心**：`.rooignore`规则**仅适用于当前VS Code工作区根目录内的文件和目录**。此范围外的文件不受影响。
*   **[`execute_command`](/advanced-usage/available-tools/execute-command)特定性**：对`execute_command`的保护仅限于预定义的文件读取命令列表。自定义脚本或不常见的实用程序可能不会被检测到。
*   **非完整沙箱**：`.rooignore`是控制Roo通过其工具访问文件的强大工具，但它不会创建系统级沙箱。

---

## 用户体验和通知

*   **视觉提示(🔒)**：在文件列表和`@directory`附件中，被`.rooignore`忽略的文件可能会标记锁形符号(🔒)，具体取决于`showRooIgnoredFiles`设置（默认为`true`）。
*   **忽略消息**：单个文件引用会返回"(File is ignored by .rooignore)"而非内容。
*   **错误消息**：如果工具操作被阻止，Roo会收到错误："`[file_path]`的访问被.rooignore文件设置阻止。您必须尝试在不使用此文件的情况下继续任务，或要求用户更新.rooignore文件。"
*   **聊天通知**：当操作因`.rooignore`被阻止时，通常会在Roo聊天界面看到通知。

本指南帮助您理解.rooignore功能、其能力及当前限制，以便有效管理Roo与代码库的交互。