---
sidebar_label: '多文件编辑'
---

# 并发文件编辑（又名多文件编辑）

在单个操作中编辑多个文件，显著加快重构和多文件更改的速度。

// ... existing code ...

## 它的作用

<img src="/img/concurrent-file-edits/concurrent-file-edits-1.png" alt="批量差异审批界面显示多个文件更改" width="800" />

并发文件编辑允许 Roo 在单个请求中修改您工作区中的多个文件。无需逐个批准每个文件的编辑，您可以通过统一的批量审批界面一次查看并批准所有更改。

// ... existing code ...

## 如何启用

:::info 实验性功能
多文件编辑是一个实验性功能，必须在设置中启用。

1. 打开 Roo Code 设置（点击 Roo Code 中的齿轮图标）
2. 导航到 **Roo Code > 实验性设置**
3. 启用 **启用多文件编辑** 选项

<img src="/img/concurrent-file-edits/concurrent-file-edits.png" alt="在实验性设置中启用多文件编辑切换" width="400" />
:::

// ... existing code ...

## 技术细节

此功能利用了 [`apply_diff`](/advanced-usage/available-tools/apply-diff#experimental-multi-file-edits-multi_file_apply_diff) 工具的实验性多文件功能。有关实现、XML 格式以及 `MultiFileSearchReplaceDiffStrategy` 的工作原理的详细信息，请参阅 [apply_diff 文档](/advanced-usage/available-tools/apply-diff#experimental-multi-file-edits-multi_file_apply_diff)。

// ... existing code ...

## 故障排除

### 更改未批处理
- 验证是否在设置中启用了实验标志
- 检查您的模型是否支持多文件操作
- 确保文件未被 `.rooignore` 限制

### 审批 UI 未出现
- 更新到最新版本的 Roo Code
- 检查 VS Code 的输出面板是否有错误
- 尝试禁用并重新启用该功能

### 性能问题
- 对于非常大的批次操作，考虑将任务分解为较小的部分
- 如果使用有限的 API 配额，请监控令牌使用情况

// ... existing code ...

## 参见

- [`apply_diff` 工具文档](/advanced-usage/available-tools/apply-diff) - 详细的技术信息
- [实验性功能](/features/experimental/experimental-features) - 其他实验性功能
- [`.rooignore` 配置](/features/rooignore) - 文件访问限制