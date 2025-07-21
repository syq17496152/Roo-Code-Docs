# read_file

`read_file` 工具用于查看项目中的文件内容。它使 Roo 能够理解代码、配置文件和文档，从而提供更好的帮助。

:::info 多文件支持
当启用 [Concurrent File Reads](/features/concurrent-file-reads) 实验性功能时，此工具可以通过增强的 XML 参数格式同时读取多个文件。这显著提高了需要分析多个相关文件的任务效率。
:::

---

## 参数

根据您的配置，该工具接受两种格式的参数：

### 标准格式 (单文件)

- `path` (必填)：要读取文件的路径（相对于当前工作目录）
- `start_line` (可选)：开始读取的行号（1-based 索引）
- `end_line` (可选)：结束读取的行号（1-based，包含）

:::note 旧版格式
虽然仍支持单文件参数 (`path`, `start_line`, `end_line`) 以实现向后兼容，但我们建议使用更新的 `args` 格式以确保一致性和未来兼容性。
:::

### 增强格式 (多文件 - 实验性)

当启用 [Concurrent File Reads](/features/concurrent-file-reads) 时，该工具接受包含多个文件条目的 `args` 参数：

- `args` (必填)：包含多个文件规范的容器
  - `file` (必填)：单个文件规范
    - `path` (必填)：要读取文件的路径
    - `line_range` (可选)：行范围说明（例如 "1-50" 或 "100-150"）

---

## 功能说明

此工具读取指定文件的内容，并返回带行号的结果以便于参考。它可以读取整个文件或特定部分，甚至可以从 PDF 和 Word 文档中提取文本。

---

## 使用场景

- 当 Roo 需要理解现有代码结构时
- 当 Roo 需要分析配置文件时
- 当 Roo 需要从文本文件中提取信息时
- 当 Roo 在提出修改建议前需要查看代码时
- 当讨论需要引用特定行号时

---

## 主要功能

- 显示带行号的文件内容以便于参考
- 可通过指定行范围读取文件的特定部分
- 从 PDF 和 DOCX 文件中提取可读文本
- 当未指定行范围时自动截断大文本文件，显示文件开头部分
- 为截断的大代码文件提供方法摘要及行范围
- 高效地仅流式传输请求的行范围以提高性能
- 通过行号标记使讨论代码特定部分变得简单
- **多文件支持** (实验性)：通过批量审批同时读取多个文件

---

## 多文件功能 (实验性)

当启用 [Concurrent File Reads](/features/concurrent-file-reads) 实验性功能时，`read_file` 工具将获得增强的功能：

### 批量处理
- 单个请求中最多可读取 100 个文件（可配置，默认 15）
- 并行处理以提高性能
- 批量审批界面获取用户同意

### 增强的用户体验
- 多文件的单一审批对话框
- 单个文件的覆盖选项
- 清晰显示将访问的文件
- 混合成功/失败情况的优雅处理

### 提高的效率
- 减少多个审批对话框带来的中断
- 通过并行文件读取加快处理速度
- 相关文件的智能分组
- 可配置的并发限制以匹配系统能力

---

## 局限性

- 如果不使用行范围参数，可能无法高效处理极大文件
- 对于二进制文件（PDF 和 DOCX 除外），可能返回不可读内容
- **多文件模式**：需要启用实验性功能，可能存在稳定性问题

---

## 工作原理

调用 `read_file` 工具时，它遵循以下流程：

1. **参数验证**：验证必需的 `path` 参数和可选参数
2. **路径解析**：将相对路径解析为绝对路径
3. **读取策略选择**：
   - 工具使用严格的优先级层次（下文详述）
   - 它在范围读取、自动截断或完整文件读取之间进行选择
4. **内容处理**：
   - 为内容添加行号（如 "1 | const x = 13" 中的 "1 |" 是行号）
   - 对于截断的文件，添加截断通知和方法定义
   - 对特殊格式（PDF、DOCX）提取可读文本

---

## 读取策略优先级

工具使用明确的决策层次来确定如何读取文件：

1. **第一优先级：显式行范围**
   - 如果提供了 `start_line` 或 `end_line`，工具始终执行范围读取
   - 实现高效地仅流式传输请求的行，适合处理大型文件
   - 这一选项优先于所有其他选项

2. **第二优先级：大文本文件的自动截断**
   - 当满足以下所有条件时应用：
     - 未指定 `start_line` 或 `end_line`
     - 文件被识别为基于文本的文件（非 PDF/DOCX 等二进制文件）
     - 文件总行数超过 `maxReadFileLine` 设置（默认：500 行）
   - 自动截断时：
     - 工具仅读取前 `maxReadFileLine` 行
     - 添加截断通知（如 `[仅显示 500 行中的 1200 行...]`）
     - 对代码文件，可能会追加截断部分中找到的源代码定义摘要
   - **特殊情况 - 仅定义模式**：当 `maxReadFileLine` 设置为 `0` 时，工具仅返回源代码定义而无任何文件内容

3. **默认行为：读取整个文件**
   - 如果既未给定显式范围也未触发自动截断（如文件在行数限制内，或是受支持的二进制类型），则读取全部内容。
   - 对 PDF 和 DOCX 等支持的格式，尝试提取完整文本内容。

---

## 使用示例

- 当要求解释或改进代码时，Roo 会先读取相关文件以理解当前实现。
- 排查配置问题时，Roo 会读取配置文件以识别潜在问题。
- 处理文档时，Roo 会先读取现有文档以理解当前内容再提出改进建议。

---

## 使用示例代码

以下是展示 `read_file` 工具使用方式以及您可能收到的典型输出的几个场景。

### 读取整个文件

要读取文件的完整内容：

**输入：**
```xml
<read_file>
<path>src/app.js</path>
</read_file>
```

**模拟输出（小文件如 `example_small.txt`）：**
```
1 | 这是第一行。
2 | 这是第二行。
3 | 这是第三行。
```
*(输出将根据实际文件内容变化)*

### 读取特定行

要只读取特定范围的行（如 46-68 行）：

**输入：**
```xml
<read_file>
<path>src/app.js</path>
<start_line>46</start_line>
<end_line>68</end_line>
</read_file>
```

**模拟输出（`example_five_lines.txt` 的第 2-3 行）：**
```
2 | 第二行的内容。
3 | 第三行的内容。
```
*(输出显示只有请求的行及其原始行号)*

### 读取大文本文件（自动截断）

当读取未指定行范围的大文本文件时，工具会自动截断内容，如果其超出内部行数限制（如 500 行）。

**输入：**
```xml
<read_file>
<path>logs/large_app.log</path>
</read_file>
```

**模拟输出（1500 行日志文件，行数限制为 500 行）：**
```
1 | 日志条目 1...
2 | 日志条目 2...
...
500 | 日志条目 500...

[仅显示 500 行中的 1500 行。使用 start_line 和 end_line 读取特定范围。]
// 对代码文件，这里可能会出现源代码定义摘要
```
*(输出显示从 `maxReadFileLine` 限制开始的起始行，加上一个截断通知。请使用行范围获取完整访问权限。)*

### 仅读取定义（定义模式）

当在用户设置中将 `maxReadFileLine` 设为 `0` 时，工具仅返回源代码定义而无文件内容：

**输入：**
```xml
<!-- 假设用户设置中 maxReadFileLine 设为 0 -->
<read_file>
<path>src/services/auth.service.ts</path>
</read_file>
```

**模拟输出：**
```xml
<file>
  <path>src/services/auth.service.ts</path>
  <list_code_definition_names>
    类 AuthService
      方法 validateUser
      方法 generateToken
  </list_code_definition_names>
  <notice>仅显示 0 行中的 150 行。使用 start_line 和 end_line 读取特定范围。</notice>
</file>
```
*(此模式提供文件结构的快速概览而无需读取内容。)*

### 尝试读取不存在的文件

如果指定的文件不存在：

**输入：**
```xml
<read_file>
<path>non_existent_file.txt</path>
</read_file>
```

**模拟输出（错误）：**
```
错误：在路径 'non_existent_file.txt' 未找到文件。
```

### 尝试读取被阻止的文件

如果文件被 `.rooignore` 文件中的规则排除：

**输入：**
```xml
<read_file>
<path>.env</path>
</read_file>
```

**模拟输出（错误）：**
```
错误：由 .rooignore 规则拒绝访问
```

---

## 多文件示例 (实验性)

当启用 [Concurrent File Reads](/features/concurrent-file-reads) 实验性功能时，可以使用增强的 XML 格式同时读取多个文件。

### 同时读取多个完整文件

要一次读取多个完整文件：

**输入：**
```xml
<read_file>
<args>
  <file>
    <path>src/app.ts</path>
  </file>
  <file>
    <path>src/utils.ts</path>
  </file>
  <file>
    <path>src/config.json</path>
  </file>
</args>
</read_file>
```

**模拟输出：**
```xml
<files>
  <file>
    <path>src/app.ts</path>
    <content>
      1 | import React from 'react'
      2 | import { Utils } from './utils'
      3 | // ... rest of file content
    </content>
  </file>
  <file>
    <path>src/utils.ts</path>
    <content>
      1 | export class Utils {
      2 |   static formatDate(date: Date): string {
      3 |     // ... utility functions
    </content>
  </file>
  <file>
    <path>src/config.json</path>
    <content>
      1 | {
      2 |   "apiUrl": "https://api.example.com",
      3 |   "timeout": 5000
      4 | }
    </content>
  </file>
</files>
```

### 从多个文件中读取特定行范围

要从多个文件中读取特定部分：

**输入：**
```xml
<read_file>
<args>
  <file>
    <path>src/app.ts</path>
    <line_range>1-20</line_range>
    <line_range>45-60</line_range>
  </file>
  <file>
    <path>src/utils.ts</path>
    <line_range>10-25</line_range>
  </file>
</args>
</read_file>
```

**模拟输出：**
```xml
<files>
  <file>
    <path>src/app.ts</path>
    <content>
      1 | import React from 'react'
      2 | import { Utils } from './utils'
      ...
      20 | const App = () => {
      
      45 |   const handleSubmit = () => {
      46 |     // Handle form submission
      ...
      60 |   }
    </content>
  </file>
  <file>
    <path>src/utils.ts</path>
    <content>
      10 |   static formatDate(date: Date): string {
      11 |     return date.toISOString().split('T')[0]
      ...
      25 |   }
    </content>
  </file>
</files>
```

### 处理混合结果（部分文件被拒绝/阻塞）

当某些文件已批准而其他文件被拒绝或阻塞时：

**输入：**
```xml
<read_file>
<args>
  <file>
    <path>src/app.ts</path>
  </file>
  <file>
    <path>.env</path>
  </file>
  <file>
    <path>src/secret-config.ts</path>
  </file>
</args>
</read_file>
```

**模拟输出：**
```xml
<files>
  <file>
    <path>src/app.ts</path>
    <content>
      1 | import React from 'react'
      2 | // ... rest of file content
    </content>
  </file>
  <file>
    <path>.env</path>
    <error>由 .rooignore 规则拒绝访问</error>
  </file>
  <file>
    <path>src/secret-config.ts</path>
    <error>用户拒绝文件访问</error>
  </file>
</files>
```

### 批量审批界面

请求多个文件时，您将看到一个批量审批界面，允许您：

- **批准所有**：授予对所有请求文件的访问权
- **拒绝所有**：拒绝所有请求文件的访问权
- **单独控制**：覆盖特定文件的决定
- **文件预览**：点击文件标题在编辑器中打开它们

界面清晰显示每个文件路径，使您可以在授予权限前轻松了解 Roo 想要访问的内容。