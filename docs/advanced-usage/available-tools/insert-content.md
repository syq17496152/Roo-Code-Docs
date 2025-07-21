# insert_content

`insert_content` 工具可在不修改原始内容的情况下，将新内容插入到现有文件的指定位置。非常适合插入代码块、配置条目或日志行。

---

## 参数

该工具接受以下参数：

- `path` (必填)：要插入内容的文件的相对路径（相对于工作区根目录）。
- `line` (必填)：要插入内容的 **1-based 行号**。使用 `0` 表示将内容追加到文件末尾。
- `content` (必填)：要插入的文本内容。

---

## 功能说明

此工具读取目标文件，根据 `line` 参数确定插入点，并在该位置插入提供的 `content`。如果 `line` 为 `0`，则将内容添加到文件末尾。更改会在保存前以差异视图的形式呈现给用户进行审批。

---

## 使用场景

- 在文件开头添加新的导入语句时。
- 将新函数或方法插入到现有代码中时。
- 向配置文件中添加配置块时。
- 追加日志条目或数据记录时。
- 添加任何多行文本块而不更改现有行时。

---

## 主要功能

- **定向插入**：精确地在指定行号处添加内容，或追加到末尾。
- **保留现有内容**：不修改或删除原始文件中的行。
- **交互式审批**：在差异视图中显示提议的插入内容，需要用户明确批准。
- **用户编辑支持**：允许在最终审批前直接在差异视图中编辑提议的内容。
- **处理行号**：正确解释 `line` 参数（1-based 或 0 表示追加）。
- **上下文跟踪**：记录文件编辑操作以便于上下文管理。
- **错误处理**：检查缺失的参数、无效的行号和文件访问问题。

---

## 局限性

- **仅插入**：不能替换或删除现有内容。如需修改，请使用 `apply_diff` 或 `search_and_replace`。
- **要求文件存在**：由 `path` 指定的目标文件必须存在。
- **审核开销**：强制性的差异视图审批增加了交互步骤。

---

## 工作原理

当调用 `insert_content` 工具时，它遵循以下流程：

1.  **参数验证**：检查必需的 `path`、`line` 和 `content`。验证 `line` 是非负整数。
2.  **文件读取**：读取由 `path` 指定的目标文件内容。
3.  **插入点计算**：将 1-based 的 `line` 参数转换为内部处理使用的 0-based 索引（`-1` 表示追加）。
4.  **内容插入**：使用内部工具 (`insertGroups`) 将原始文件行与新 `content` 在计算出的索引处合并。
5.  **差异视图交互**：
    *   在差异视图中打开文件 (`cline.diffViewProvider.open`)。
    *   使用提议的内容更新差异视图 (`cline.diffViewProvider.update`)。
6.  **用户审批**：通过 `askApproval` 呈现更改。如果被拒绝则回滚。
7.  **保存更改**：如果批准，则使用 `cline.diffViewProvider.saveChanges` 保存更改。
8.  **文件上下文跟踪**：使用 `cline.getFileContextTracker().trackFileContext` 跟踪编辑。
9.  **处理用户编辑**：如果用户在差异视图中编辑了内容，则报告最终合并后的内容。
10. **结果报告**：向 AI 模型报告成功（包括用户编辑）或失败。

---

## 使用示例

在文件开头插入导入语句 (`line: 1`):

```xml
<insert_content>
<path>src/utils.ts</path>
<line>1</line>
<content>
// 在文件开头添加导入语句
import { sum } from './math';
import { parse } from 'date-fns';
</content>
</insert_content>
```

将内容追加到文件末尾 (`line: 0`):

```xml
<insert_content>
<path>config/routes.yaml</path>
<line>0</line>
<content>
- path: /new-feature
  component: NewFeatureComponent
  auth_required: true
</content>
</insert_content>
```

在第 50 行前插入一个函数:

```xml
<insert_content>
<path>src/services/api.js</path>
<line>50</line>
<content>
async function fetchUserData(userId) {
  const response = await fetch(`/api/users/${userId}`);
  if (!response.ok) {
    throw new Error('Failed to fetch user data');
  }
  return response.json();
}
</content>
</insert_content>