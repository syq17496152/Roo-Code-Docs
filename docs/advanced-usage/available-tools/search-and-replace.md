# search_and_replace

`search_and_replace` 工具可在文件中查找并替换文本，支持字面字符串和正则表达式模式。它允许在多个位置进行定向替换，可选地限定在特定行范围内。

---

## 参数

### 必填参数

- `path`: 要修改文件的相对路径（从工作区根目录开始）。
- `search`: 要查找的文本字符串或正则表达式模式。
- `replace`: 用于替换匹配项的文本。

### 可选参数

- `start_line`: 搜索范围起始的1-based行号。
- `end_line`: 搜索范围结束的1-based行号（包含）。
- `use_regex`: 设置为 `"true"` 将 `search` 参数视为正则表达式模式（默认为 `false`）。
- `ignore_case`: 设置为 `"true"` 进行不区分大小写的搜索（默认为 `false`）。

---

## 功能说明

此工具根据提供的参数读取指定文件并执行搜索替换操作。它可以对整个文件操作，或者限制在特定的行范围。更改会在保存前以差异视图呈现给用户审查和批准。

---

## 使用场景

- 在文件中重命名变量、函数或类时。
- 需要一致更新特定文本字符串或值时。
- 使用正则表达式应用模式化更改时。
- 重构代码需要替换特定模式时。
- 在文件的定义部分进行定向更改时。

---

## 主要功能

- **灵活搜索**：支持字面文本和正则表达式模式。
- **大小写控制**：提供选项忽略搜索中的大小写。
- **范围替换**：可以将替换限制在特定的行范围 (`start_line`, `end_line`) 内。
- **全局替换**：默认情况下在整个文件（或指定范围）内执行替换。
- **交互式审批**：在差异视图中显示建议的更改供用户审查和批准。
- **直接编辑支持**：允许在差异视图中直接编辑建议内容。
- **上下文跟踪**：记录文件编辑操作。
- **错误处理**：检查缺失参数、文件访问问题和无效行号。

---

## 局限性

- **单文件操作**：一次只能操作一个文件。使用 `search_files` 先在多个文件中查找模式。
- **审查开销**：强制性的差异视图审批增加了一个交互步骤。
- **正则复杂度**：复杂的正则表达式可能需要仔细构建和测试。

---

## 工作原理

调用 `search_and_replace` 工具时，它遵循以下流程：

1.  **参数验证**：检查必填的 `path`、`search`、`replace`，并验证如行号和布尔标志等可选参数。
2.  **文件读取**：读取由 `path` 指定的目标文件内容。
3.  **正则构建**：
    *   如果 `use_regex` 为 `false`，将 `search` 字符串转义为字面文本处理。
    *   使用 `g` (全局) 标志和可选的 `i` (忽略大小写) 标志创建 `RegExp` 对象。
4.  **替换执行**：
    *   如果提供了 `start_line` 或 `end_line`，文件内容将按行拆分，隔离相关部分，在该部分执行替换后，重建文件内容。
    *   如果未指定行范围，则在完整文件内容上执行替换。
5.  **差异视图交互**：
    *   在差异视图中打开文件，显示原始与建议的内容。
    *   用替换结果更新差异视图。
6.  **用户审批**：通过 `askApproval` 显示更改。如果被拒绝则回滚。
7.  **保存更改**：如果批准，保存更改（包括在差异视图中进行的任何用户编辑）。
8.  **文件上下文跟踪**：使用 `cline.getFileContextTracker().trackFileContext` 跟踪编辑。
9.  **结果报告**：将成功结果（包括用户编辑）或失败返回给AI模型。

---

## 使用示例

在整个文件中进行简单文本替换：

```xml
<search_and_replace>
<path>src/config.js</path>
<search>API_KEY_OLD</search>
<replace>API_KEY_NEW</replace>
</search_and_replace>
```

使用不区分大小写的正则表达式替换来更新函数调用：

```xml
<search_and_replace>
<path>src/app.ts</path>
<search>processData\((.*?)\)</search>
<replace>handleData($1)</replace>
<use_regex>true</use_regex>
<ignore_case>true</ignore_case>
</search_and_replace>
```

仅在第10到20行内替换文本：

```xml
<search_and_replace>
<path>README.md</path>
<search>Draft</search>
<replace>Final</replace>
<start_line>10</start_line>
<end_line>20</end_line>
</search_and_replace>