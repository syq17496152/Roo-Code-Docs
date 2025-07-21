---
sidebar_label: '动力转向'
---
import Codicon from '@site/src/components/Codicon';

# 动力转向（实验性功能）

"动力转向" 实验性功能 (`POWER_STEERING`) 旨在通过更频繁地提醒底层大语言模型 (LLM) 其当前模式定义和任何自定义指令来增强 Roo Code 响应的一致性。

// ... existing code ...

## 它如何工作

启用动力转向后，Roo Code 会不断强化 LLM 对其分配角色（例如，"你是一个有用的编码助手"）和用户提供的任何特定指南（例如，"始终提供 Python 中的代码示例"）的理解。

这是通过在每次交互中明确包含发送给 LLM 的 `modeDetails.roleDefinition` 和 `modeDetails.customInstructions` 来实现的。

**目标：**
主要目标是确保 LLM 更严格地遵循其定义的角色，并更一致地遵循用户的特定指令。如果您发现 Roo 偏离其角色或忽略自定义规则，动力转向可以帮助保持其专注度。

**权衡：**
这些频繁的提醒会在每条发送给 LLM 的消息中消耗额外的令牌。这意味着：
*   每条消息的令牌使用量增加。
*   运营成本可能更高。
*   上下文窗口可能会更快填满。

这是在指令严格遵守和资源消耗之间的平衡。

**默认状态：** 禁用。

// ... existing code ...

## 技术细节

*   **实验 ID：** `powerSteering`
*   **机制：**
    *   通过 `getEnvironmentDetails` 函数检查功能状态。
    *   如果启用，当前模式的 `roleDefinition` 和 `customInstructions` 将添加到发送给 LLM 的详情中。
    *   这些详情被包裹在 `<environment_details>` 标签中，并成为每次 LLM 交互上下文的一部分。
*   **影响：** 通过频繁包含角色定义和自定义指令，LLM 被引导生成更符合这些参数的响应。

// ... existing code ...

## 启用此功能

动力转向在 Roo Code 高级设置的 "实验性功能" 部分进行管理。

1.  打开 Roo Code 设置（右上角的 <Codicon name="gear" /> 图标）。
2.  导航到 "高级设置"。
3.  找到 "实验性功能" 区域。
4.  切换 "动力转向" 选项。
5.  保存更改。
<img src="/img/power-steering/power-steering.png" alt="智能上下文压缩和动力转向的设置" width="600" />

有关实验性功能的一般信息，请参阅 [实验性功能概述](/features/experimental/experimental-features)。

// ... existing code ...

## 反馈

请在 [Roo Code GitHub Issues 页面](https://github.com/RooCodeInc/Roo-Code/issues) 上报告与此功能相关的任何问题或建议。您的反馈对于改进 Roo Code 至关重要。