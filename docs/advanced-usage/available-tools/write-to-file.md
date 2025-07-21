# write_to_file

`write_to_file` 工具可创建新文件或通过交互式审批流程完全替换现有文件内容。它提供差异视图功能，可在应用更改前进行审查。

---

## 参数

该工具接受以下参数：

- `path` (必填)：要写入的文件路径，相对于当前工作目录
- `content` (必填)：要写入文件的完整内容
- `line_count` (必填)：文件中的行数，包括空行

---

## 功能说明

此工具将内容写入指定文件，如果文件不存在则创建新文件，如果存在则完全覆盖现有文件。所有更改都需要通过差异视图界面进行显式用户批准，用户可以在应用更改前审查甚至编辑建议的更改。

---

## 使用场景

- 当 Roo 需要从头开始创建新文件时
- 当 Roo 需要完全重写现有文件时
- 当创建多个文件用于新项目时
- 当生成配置文件、文档或源代码时
- 当需要在应用更改前审查更改时

---

## 主要功能

- **交互式审批**：在差异视图中显示更改，在应用前需要显式批准
- **支持用户编辑**：允许在最终批准前编辑建议的内容
- **安全措施**：检测代码遗漏，验证路径，防止内容截断
- **编辑器集成**：打开差异视图并自动滚动到第一个差异位置
- **内容预处理**：处理来自不同AI模型的工件以确保内容干净
- **访问控制**：在做出更改前验证是否受 `.rooignore` 限制
- **父级目录处理**：可通过系统依赖关系处理目录创建
- **完整替换**：单次操作即可提供完全转换的文件

---

## 局限性

- 不适合已有文件：对于修改现有文件来说比 `apply_diff` 更慢且效率更低
- 大文件性能：处理大文件时速度显著变慢
- 完全覆盖：替换整个文件内容，无法保留原始内容
- 需要行数统计：需要准确的行数来检测潜在的内容截断
- 审核开销：审批流程增加了额外步骤，相比直接编辑更繁琐
- 仅限交互使用：不能用于需要非交互执行的自动化工作流程

---

## 工作原理

调用 `write_to_file` 工具时，它遵循以下流程：

1. **参数验证**：验证必填参数和权限
   - 检查是否提供了 `path`、`content` 和 `line_count`
   - 如果 `line_count` 缺失/无效，则回滚任何差异视图更改，并返回错误提示，建议使用其他工具（如 `apply_diff`、`insert_content` 等）来修改现有文件。
   - 验证文件是否被允许（未被 `.rooignore` 限制）
   - 确保路径在工作区范围内
   - 跟踪缺失参数的连续错误计数
   - 显示每个验证失败的具体错误消息

2. **内容预处理**：
   - 移除AI模型可能添加的代码块标记
   - 处理转义的HTML实体（特别针对非Claude模型）
   - 如果内容中意外包含行号，则去除行号
   - 对不同AI提供商执行特定于模型的处理

3. **差异视图生成**：
   - 在编辑器中打开显示建议更改的差异视图
   - 添加300ms延迟以确保UI响应能力
   - 自动滚动到第一个差异位置
   - 高亮显示更改以便于审查

4. **用户审批流程**：
   - 等待用户的显式批准才能继续
   - 允许用户在差异视图中编辑内容
   - 捕获用户对最终内容的任何修改
   - 提供完全拒绝更改的选项
   - 将用户修改纳入最终结果

5. **安全性验证**：
   - 通过与提供的行数对比检测潜在内容截断
   - 如果内容似乎不完整则显示警告
   - 验证文件路径和访问权限
   - 特别检查文件是否位于工作区外，并设置 `isOutsideWorkspace` 标志

6. **文件写入**：
   - 将经批准的内容（含任何用户修改）写入文件
   - 提供写入成功的确认信息
   - 成功后重置连续错误计数器

---

## 使用示例

- 创建新项目时，Roo 生成多个文件，但在提交更改前让您逐一审查。
- 设置配置文件时，Roo 在差异视图中显示建议的配置以获取批准。
- 生成文档时，Roo 创建 markdown 文件，但允许您在差异视图中进行最终调整。
- 开发原型时，Roo 在差异视图中显示完整的源文件，让您在保存前微调。

---

## 使用示例代码

创建新的 JSON 配置文件：
```
<write_to_file>
<path>config/settings.json</path>
<content>
{
  "apiEndpoint": "https://api.example.com",
  "theme": {
    "primaryColor": "#007bff",
    "secondaryColor": "#6c757d",
    "fontFamily": "Arial, sans-serif"
  },
  "features": {
    "darkMode": true,
    "notifications": true,
    "analytics": false
  },
  "version": "1.0.0"
}
</content>
<line_count>14</line_count>
</write_to_file>
```

创建简单的 HTML 文件：
```
<write_to_file>
<path>src/index.html</path>
<content>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Application</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <div id="app"></div>
  <script src="app.js"></script>
</body>
</html>
</content>
<line_count>13</line_count>
</write_to_file>
```

创建 JavaScript 模块：
```
<write_to_file>
<path>src/utils/helpers.js</path>
<content>
/**
 * Utility functions for the application
 */

export function formatDate(date) {
  return new Date(date).toLocaleDateString();
}

export function calculateTotal(items) {
  return items.reduce((sum, item) => sum + item.price, 0);
}

export function debounce(func, delay) {
  let timeout;
  return function(...args) {
    clearTimeout(timeout);
    timeout = setTimeout(() => func.apply(this, args), delay);
  };
}
</content>
<line_count>18</line_count>
</write_to_file>