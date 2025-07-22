# 差分/快速编辑

:::info 默认设置
快速编辑（使用"启用差分编辑"设置）在Roo Code中默认启用。除非遇到特定问题或想尝试不同差分策略，通常不需要更改这些设置。
:::

Roo Code提供高级设置，通过差分（差异）而非重写整个文件的方式编辑文件。启用此功能具有显著优势。

:::note 按提供者设置
差分编辑配置按[API配置概要](/features/api-configuration-profiles)设置，允许为不同提供者和模型定制编辑行为。
:::

---

## 启用差分编辑

点击齿轮图标<Codicon name="gear" />打开Roo Code面板设置。在`Providers`部分选择特定[API配置概要](/features/api-configuration-profiles)进行配置。

当勾选**启用差分编辑**时：

    <img src="/img/fast-edits/fast-edits-2.png" alt="显示启用差分编辑的Roo Code设置" width="500" />
1.  **更快的文件编辑**：通过仅应用必要更改快速修改文件。
2.  **防止截断写入**：系统自动检测并拒绝AI尝试写入的不完整文件内容（常见于大文件或复杂指令），防止文件损坏。

:::note 禁用快速编辑
取消勾选**启用差分编辑**将使Roo回退到完整文件写入模式，每次编辑使用[`write_to_file`](/advanced-usage/available-tools/write-to-file)工具重写整个文件，而非通过[`apply_diff`](/advanced-usage/available-tools/apply-diff)应用定向更改。这种全写入方式修改现有文件通常较慢，且导致更高token消耗。
:::

---

## 匹配精度

该滑块控制AI识别代码段与实际文件代码匹配的严格程度。

    <img src="/img/fast-edits/fast-edits-4.png" alt="显示启用差分编辑复选框和匹配精度滑块的Roo Code设置" width="500" />

*   **100%（默认）**：要求完全匹配。这是最安全选项，最大限度降低错误修改风险。
*   **较低值（80%-99%）**：允许"模糊"匹配。即使代码段与AI预期存在微小差异也可应用更改。适用于文件被轻微修改的情况，但**增加错误位置应用更改的风险**。

**慎用低于100%的设置。** 降低精度可能偶尔必要，但始终需仔细审查建议的修改。

内部通过调整`fuzzyMatchThreshold`参数实现，使用Levenshtein距离等算法比较代码相似度。