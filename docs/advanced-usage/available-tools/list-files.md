# list_files

`list_files` 工具显示指定位置内的文件和目录。它帮助 Roo 理解您的项目结构并有效导航代码库。

---

## 参数

该工具接受以下参数：

- `path` (必填)：要列出内容的目录路径，相对于当前工作目录
- `recursive` (可选)：是否递归列出文件。使用 `true` 表示递归列出，`false` 或省略表示仅列出顶层内容。

---

## 功能说明

此工具列出指定位置中的所有文件和目录，提供清晰的项目结构概览。它可以仅显示顶层内容，或递归探索子目录。

---

## 使用场景

- 当 Roo 需要理解您的项目结构时
- 当 Roo 在读取特定文件之前需要查看可用文件时
- 当 Roo 绘制代码库图谱以更好地理解其组织结构时
- 在使用更具体的工具（如 `read_file` 或 `search_files`）之前
- 当 Roo 需要检查特定类型的文件（如配置文件）时

---

## 主要功能

- 列出文件和目录，并明确标记目录
- 提供递归和非递归列出模式
- 在递归模式下智能忽略常见的大型目录（如 `node_modules` 和 `.git`）
- 递归模式下遵循 `.gitignore` 规则
- 当启用 `showRooIgnoredFiles` 时，用锁形符号 (🔒) 标记被 `.rooignore` 忽略的文件
- 通过利用 `ripgrep` 工具优化文件列表性能
- 按照先显示目录再显示其内容的方式排序结果，保持逻辑层次结构
- 以干净、有组织的格式呈现结果
- 自动创建项目的结构图谱

---

## 局限性

- 默认情况下文件列表限制为约 200 个文件以防止性能问题
- 底层的 `ripgrep` 文件列表进程有 10 秒超时；如果超过此时间，可能会返回部分结果。
- 当达到文件数量限制时，会添加一条建议使用 `list_files` 在特定子目录中继续查看的提示。
- 不适合确认您刚刚创建的文件是否存在
- 在非常大的目录结构中可能性能下降
- 出于安全原因，不能列出根目录或主目录中的文件

---

## 工作原理

当调用 `list_files` 工具时，它遵循以下流程：

1. **参数验证**：验证必需的 `path` 参数和可选的 `recursive` 参数
2. **路径解析**：将相对路径解析为绝对路径
3. **安全检查**：阻止列出根目录或主目录中的文件以确保安全
4. **目录/文件扫描**：
   - 使用 `ripgrep` 工具高效列出文件，并设置 10 秒超时。
   - 使用 Node.js `fs` 模块列出目录。
   - 对递归和非递归模式应用不同的过滤逻辑。
5. **结果过滤**：
   - 在递归模式下，跳过常见的大型目录（如 `node_modules`、`.git` 等）。
   - 递归模式下遵循 `.gitignore` 规则
   - 处理 `.rooignore` 模式，要么隐藏文件，要么用锁形符号标记
6. **格式化**：
   - 目录用尾部斜杠 (`/`) 标记
   - 按照先显示目录再显示其内容的方式排序结果以保持逻辑层次结构
   - 启用 `showRooIgnoredFiles` 时，用锁形符号 (🔒) 标记被忽略的文件
   - 默认情况下结果限制为 200 个文件，并提示使用子目录
   - 组织结果以便于阅读

---

## 文件列表格式

文件列表结果包括：

- 每个文件路径单独显示一行
- 目录用尾部斜杠 (`/`) 标记
- 启用 `showRooIgnoredFiles` 时，被 `.rooignore` 忽略的文件用锁形符号 (🔒) 标记
- 结果按逻辑排序，目录出现在其内容之前
- 当达到文件数量限制时，会出现一条提示信息，建议在特定子目录中使用 `list_files`

示例输出格式：
```
src/
src/components/
src/components/Button.tsx
src/components/Header.tsx
src/utils/
src/utils/helpers.ts
src/index.ts
...
文件列表已截断（显示了 200 个文件中的 543 个）。请在特定子目录中使用 list_files 以查看更多详情。
```

当使用 `.rooignore` 文件且 `showRooIgnoredFiles` 启用时：
```
src/
src/components/
src/components/Button.tsx
src/components/Header.tsx
🔒 src/secrets.json
src/utils/
src/utils/helpers.ts
src/index.ts
```

---

## 使用示例

- 开始新任务时，Roo 可能首先列出项目文件以了解其结构，然后再深入具体代码。
- 当被要求查找特定类型的文件（如所有 JavaScript 文件）时，Roo 首先列出目录以了解查找位置。
- 在提供代码组织建议时，Roo 首先检查当前项目结构。
- 在设置新功能时，Roo 列出相关目录以了解项目约定。

---

## 使用示例代码

列出当前目录的顶层文件：
```
<list_files>
<path>.</path>
</list_files>
```

递归列出源代码目录中的所有文件：
```
<list_files>
<path>src</path>
<recursive>true</recursive>
</list_files>
```

检查特定项目子目录：
```
<list_files>
<path>src/components</path>
<recursive>false</recursive>
</list_files>