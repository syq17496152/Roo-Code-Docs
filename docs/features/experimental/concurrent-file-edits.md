---
sidebar_label: '多文件编辑'
---

# 并发文件编辑（又名多文件编辑）

在单个操作中编辑多个文件，显著加速重构和多文件更改。

---

## 功能说明

<img src="/img/concurrent-file-edits/concurrent-file-edits-1.png" alt="显示多个文件更改的批量差异批准界面" width="800" />

并发文件编辑允许Roo在单个请求中修改工作区中的多个文件。无需单独批准每个文件编辑，您可以通过统一的批量批准界面一次性审查并批准所有更改。

---

## 使用价值

**传统方式**：需要逐个批准的顺序文件编辑
- 编辑文件A → 批准
- 编辑文件B → 批准
- 编辑文件C → 批准

**使用并发文件编辑**：所有更改集中呈现
- 审查文件A、B、C的所有提议更改
- 一次性批准所有更改

这减少了中断并加速复杂任务，如：
- 跨多个文件重构函数
- 更新整个代码库的配置值
- 重命名组件及其引用
- 应用统一的格式或样式更改

---

## 如何启用

:::info 实验性功能
多文件编辑是实验性功能，需在设置中手动启用。

1. 打开Roo Code设置（点击Roo Code中的齿轮图标）
2. 进入**Roo Code > 实验性设置**
3. 启用**启用多文件编辑**选项

<img src="/img/concurrent-file-edits/concurrent-file-edits.png" alt="实验性设置中的启用多文件编辑开关" width="400" />
:::

---

## 使用该功能

启用后，Roo将在适当场景自动使用并发编辑。您将看到"批量差异批准"界面显示：

- 所有需要修改的文件
- 每个文件的提议更改
- 批准所有更改或单独审查的选项

### 示例工作流程

1. 要求Roo "将所有API端点更新为使用新认证方法"
2. Roo分析代码库并识别所有受影响的文件
3. 您收到单个批量批准请求，显示以下文件的更改：
    - `src/api/users.js`
    - `src/api/products.js`
    - `src/api/orders.js`
    - `src/middleware/auth.js`
4. 在统一的差异视图中审查所有更改
5. 批准以同时应用所有更改

---

## 技术细节

该功能利用了[`apply_diff`](/advanced-usage/available-tools/apply-diff#experimental-multi-file-edits-multi_file_apply_diff)工具的实验性多文件功能。关于实现细节、XML格式以及`MultiFileSearchReplaceDiffStrategy`的工作原理，请参考[apply_diff文档](/advanced-usage/available-tools/apply-diff#experimental-multi-file-edits-multi_file_apply_diff)。

---

## 最佳实践

### 应启用场景
- 使用强大AI模型（Claude 3.5 Sonnet、GPT-4等）时
- 您习惯一次性审查多个更改时

### 应保持禁用场景
- 使用能力较弱的AI模型时
- 更倾向单独审查每个更改时

---

## 限制

- **实验性**：此功能仍在完善中可能存在边界情况
- **模型依赖**：与强大AI模型配合效果最佳
- **令牌消耗**：初始请求可能因上下文较大而消耗更多令牌
- **复杂度**：非常大的批量操作可能难以审查

---

## 故障排除

### 更改未批量处理
- 验证实验性开关是否在设置中启用
- 检查模型是否支持多文件操作
- 确认文件未被`.rooignore`限制

### 批准界面未显示
- 更新Roo Code到最新版本
- 检查VS Code的输出面板是否有错误
- 尝试关闭并重新启用该功能

### 性能问题
- 对于非常大的批量操作，考虑将任务分解为更小块
- 如果使用受限API配额，监控令牌消耗

---

## 参见

- [`apply_diff`工具文档](/advanced-usage/available-tools/apply-diff) - 技术细节
- [实验性功能](/features/experimental/experimental-features) - 其他实验性功能
- [`.rooignore`配置](/features/rooignore) - 文件访问限制