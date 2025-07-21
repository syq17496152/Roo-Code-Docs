---
sidebar_label: 建议响应
---

import Codicon from '@site/src/components/Codicon';

# 建议响应

当 Roo 需要更多信息来完成任务时，它会使用 [`ask_followup_question` 工具](/advanced-usage/available-tools/ask-followup-question)。为了使响应更加容易和快速，Roo 通常会提供建议的答案。

---

## 概述

建议响应作为可点击的按钮直接显示在聊天界面中 Roo 提出的问题下方。它们提供与问题相关的预设答案，帮助您快速提供输入。

<img src="/img/suggested-responses/suggested-responses.png" alt="Roo 提问并显示建议响应按钮的示例" width="500" />

// ... existing code ...

## 如何工作

1.  **问题出现**：Roo 使用 `ask_followup_question` 工具提出问题。
2.  **显示建议**：如果 Roo 提供了建议，它们会作为按钮显示在问题下方。
3.  **交互**：您可以通过两种方式与这些建议进行交互。

// ... existing code ...

## 与建议交互

您有三种方式使用建议响应：

1.  **直接选择**：
    *   **操作**：只需点击包含您想提供的答案的按钮。
    *   **结果**：所选答案会立即作为您的响应发送回 Roo。如果其中一个建议完全符合您的意图，这是最快的回复方式。

2.  **键盘快捷键**：
    *   **操作**：使用配置的键盘快捷键执行 `roo.acceptInput` 命令。
    *   **结果**：主（第一个）建议按钮会自动被选中。
    *   **注意**：有关设置详情，请参阅 [键盘快捷键](/features/keyboard-shortcuts)。

3.  **发送前编辑**：
    *   **操作**：
        *   按住 `Shift` 并点击建议按钮。
        *   *或者*，将鼠标悬停在建议按钮上并点击出现的铅笔图标（<Codicon name="edit" />）。
    *   **结果**：建议的文本会被复制到聊天输入框中。然后您可以根据需要修改文本，再按 Enter 发送自定义的响应。当建议接近但需要轻微调整时，这非常有用。

<img src="/img/suggested-responses/suggested-responses-1.png" alt="显示从建议响应复制的文本的聊天输入框，准备进行编辑" width="600" />

// ... existing code ...

## 优势

*   **速度**：无需键入完整答案即可快速响应。
*   **清晰度**：建议通常会澄清 Roo 所需信息的类型。
*   **灵活性**：在需要时编辑建议以提供精确的自定义答案。

此功能在 Roo 需要澄清时简化了交互，使您能够以最小的努力有效地指导任务。