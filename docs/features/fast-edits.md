// ... existing code ...

# 差异/快速编辑

:::info 默认设置
快速编辑（使用 "通过差异启用编辑" 设置）在 Roo Code 中默认启用。除非遇到特定问题或想要尝试不同的差异策略，否则通常不需要更改这些设置。
:::

Roo Code 提供了一个高级设置，可以更改其编辑文件的方式，使用差异（差异）而不是重写整个文件。启用此功能可以带来显著的好处。

:::note 按提供者设置
差异编辑配置是按[API 配置简介](/features/api-configuration-profiles)设置的，允许您自定义不同提供者和模型的编辑行为。
:::

---

## 通过差异启用编辑

通过点击齿轮图标 <Codicon name="gear" /> 打开 Roo Code 窗格设置。将显示 `Providers` 部分。选择您要配置的特定[API 配置简介](/features/api-configuration-profiles)。

当 **通过差异启用编辑** 被选中时：

    <img src="/img/fast-edits/fast-edits-2.png" alt="Roo Code 设置显示通过差异启用编辑" width="500" />
1.  **更快的文件编辑**：Roo 通过仅应用必要的更改来更快速地修改文件。
2.  **防止截断写入**：系统会自动检测并拒绝 AI 尝试写入不完整文件内容的行为，这可能发生在大文件或复杂指令的情况下。这有助于防止文件损坏。

:::note 禁用快速编辑
如果您取消选中 **通过差异启用编辑**，Roo 将恢复到每次编辑时写入整个文件内容，使用 [`write_to_file`](/advanced-usage/available-tools/write-to-file) 工具，而不是使用 [`apply_diff`](/advanced-usage/available-tools/apply-diff) 应用定向更改。这种全写方法通常较慢，并且会导致更高的令牌使用率。
:::

// ... existing code ...

## 匹配精度

此滑块控制 AI 识别的代码部分在应用更改之前必须与您文件中的实际代码匹配的紧密程度。

    <img src="/img/fast-edits/fast-edits-4.png" alt="Roo Code 设置显示通过差异启用编辑复选框和匹配精度滑块" width="500" />

*   **100% (Default)**: Requires an exact match. This is the safest option, minimizing the risk of incorrect changes.
*   **Lower Values (80%-99%)**: Allows for "fuzzy" matching. Roo can apply changes even if the code section has minor differences from what the AI expected. This can be useful if the file has been slightly modified, but **increases the risk** of applying changes in the wrong place.

**Use values below 100% with extreme caution.** Lower precision might be necessary occasionally, but always review the proposed changes carefully.

Internally, this setting adjusts a `fuzzyMatchThreshold` used with algorithms like Levenshtein distance to compare code similarity.