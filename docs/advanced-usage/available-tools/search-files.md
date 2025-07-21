# search_files

`search_files` 工具可在项目工作区内的多个文件中执行正则表达式搜索。出于安全考虑，它无法搜索当前工作区目录之外的内容。它帮助 Roo 在整个代码库中定位特定的代码模式、文本或其他内容，并提供上下文结果。

---

## 参数

该工具接受以下参数：

- `path` (必填)：要搜索的目录路径，相对于当前工作区目录。搜索范围限定在工作区内。
- `regex` (必填)：要搜索的正则表达式模式（使用 Rust 正则语法）
- `file_pattern` (可选)：用于过滤文件的 glob 模式（例如 '*.ts' 表示 TypeScript 文件）

---

## 功能说明

此工具使用正则表达式在指定目录中的文件中进行搜索，显示每次匹配及其周围的上下文。它就像一个强大的 "文件内查找" 功能，可在整个项目结构中工作。

---

## 使用场景

- 当 Roo 需要查找特定函数或变量的使用位置时
- 当 Roo 协助重构并需要了解使用模式时
- 当 Roo 需要定位所有某个特定代码模式的实例时
- 当 Roo 需要在多个文件中搜索文本并具备过滤能力时

---

## 主要功能

- 使用高性能 Ripgrep 在单个操作中跨多个文件搜索
- 显示每次匹配周围的上下文（前后各1行）
- 使用 glob 模式按类型过滤文件（如仅 TypeScript 文件）
- 提供行号以便于参考
- 使用强大的正则表达式模式进行精确搜索
- 自动将输出限制为300条结果并发出通知
- 将超过500字符的行截断，标记为"[truncated...]"
- 智能合并附近的匹配项以提高可读性

---

## 局限性

- 最适合基于文本的文件（对图像等二进制文件效果不佳）
- 在极大代码库中性能可能变慢
- 使用 Rust 正则语法，可能与其它正则实现略有不同
- 无法搜索压缩文件或归档文件
- 默认上下文大小固定（前后各1行）
- 匹配项接近时可能会显示不同的上下文大小，因为结果会分组显示
- 出于安全考虑，搜索严格限制在当前工作区，不能访问父目录或文件系统的其他位置。

---

## 工作原理

调用 `search_files` 工具时，它遵循以下流程：

1. **参数验证**：验证必填的 `path` 和 `regex` 参数
2. **路径解析**：将相对路径解析为绝对路径
3. **执行搜索**：
   - 使用 Ripgrep (rg) 进行高性能文本搜索
   - 如果指定了文件模式，则应用过滤
   - 收集包含上下文的匹配项
4. **结果格式化**：
   - 使用文件路径、行号和上下文格式化结果
   - 显示每个匹配前后各1行的上下文
   - 结构化输出以提高可读性
   - 将结果限制为最多300个匹配项并发出通知
   - 截断超过500字符的行
   - 合并附近的匹配项为连续块

---

## 搜索结果格式

搜索结果包括：

- 每个匹配文件的相对路径（以 # 开头）
- 每个匹配前后的上下文行（默认1行）
- 填充3个空格的行号后跟 ` | ` 和行内容
- 每个匹配组后的分隔线（----）

示例输出格式：
```
# rel/path/to/app.ts
 11 |   // Some processing logic here
 12 |   // TODO: Implement error handling
 13 |   return processedData;
----

# Showing first 300 of 300+ results. Use a more specific search if necessary.
```

当匹配项相互接近时，它们会被合并到一个代码块中，而不是显示为单独的结果：

```
# rel/path/to/auth.ts
 13 | // Some code here
 14 | // TODO: Add proper validation
 15 | function validateUser(credentials) {
 16 |   // TODO: Implement rate limiting
 17 |   return checkDatabase(credentials);
----
```

---

## 使用示例

- 当要求重构函数时，Roo 会先搜索该函数在所有使用的位置，确保全面修改。
- 调查错误时，Roo 会在代码库中搜索相似模式以识别相关问题。
- 处理技术债务时，Roo 会定位项目中所有的 TODO 注释。
- 分析依赖关系时，Roo 会查找特定模块的所有导入。

---

## 使用示例代码

在所有 JavaScript 文件中搜索 TODO 注释：
```
<search_files>
<path>src</path>
<regex>TODO|FIXME</regex>
<file_pattern>*.js</file_pattern>
</search_files>
```

查找特定函数的所有用法：
```
<search_files>
<path>.</path>
<regex>function\s+calculateTotal</regex>
<file_pattern>*.{js,ts}</file_pattern>
</search_files>
```

在整个项目中搜索特定的导入模式：
```
<search_files>
<path>.</path>
<regex>import\s+.*\s+from\s+['"]@components/</regex>
</search_files>