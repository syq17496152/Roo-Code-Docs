---
sidebar_label: 您的第一个任务
---
import KangarooIcon from '@site/src/components/KangarooIcon';

# 开始您的第一个 Roo Code 任务

现在您已经[配置了AI提供商和模型](/getting-started/connecting-api-provider)，可以开始使用 Roo Code 了！本指南将引导您完成第一次交互。

---

## 第一步：打开 Roo Code 面板

点击 VS Code 活动栏（窗口侧边的垂直栏）中的 Roo Code 图标 (<KangarooIcon />) 打开聊天界面。如果您没有看到该图标，请验证扩展是否已安装并启用。

<img src="/img/your-first-task/your-first-task.png" alt="VS Code活动栏中的Roo Code图标" width="800" />

*Roo Code 图标在活动栏中打开聊天界面。*

---

## 第二步：输入您的任务

在面板底部的聊天框中输入您希望 Roo Code 执行的清晰、简洁描述。有效的任务示例包括：

* "创建一个名为 `hello.txt` 的文件，内容为 'Hello, world!'。"
* "编写一个Python函数，将两个数字相加。"
* "创建一个简单的HTML文件，标题为 'Roo test'"

无需特殊命令或语法 - 只需使用普通英文即可。

<img src="/img/your-first-task/your-first-task-6.png" alt="在Roo Code聊天界面中输入任务" width="500" />
*在自然语言中输入任务 - 无需特殊语法。*

---

## 第三步：发送您的任务

按下 Enter 键或点击输入框右侧的发送图标 (<Codicon name="send" />) 。

---

## 第四步：查看并批准操作

Roo Code 分析您的请求并提出具体操作。这些可能包括：

* **读取文件：** 显示需要访问的文件内容
* **写入文件：** 显示带有建议更改的差异（新增行用绿色，删除行用红色）
* **执行命令：** 显示要在终端中运行的确切命令
* **使用浏览器：** 概述浏览器操作（点击、输入等）
* **提问：** 在需要继续时请求澄清

<img src="/img/your-first-task/your-first-task-7.png" alt="查看提议的文件创建操作" width="800" />
*Roo Code 显示它想要执行的确切操作并等待您的批准。*

**每个操作都需要您的明确批准**（除非启用了自动批准）：

* **批准：** 点击 "批准" 按钮执行提议的操作
* **拒绝：** 点击 "拒绝" 按钮并在需要时提供反馈

---

## 第五步：迭代

Roo Code 采用迭代方式工作。每次操作后，它会等待您的反馈，然后提出下一步操作。继续这个审查-批准周期，直到任务完成。

<img src="/img/your-first-task/your-first-task-8.png" alt="完成任务的最终结果，显示迭代过程" width="500" />
*完成任务后，Roo Code 显示最终结果并等待您的下一条指令。*

---

## 结论

您现在已经完成了您的第一个 Roo Code 任务！通过这个过程，您已经了解了：

* 如何使用自然语言与 Roo Code 交互
* 基于批准的工作流程如何让您保持控制权
* Roo Code 逐步解决问题的迭代方法

这种迭代、基于批准的工作流程是 Roo Code 运作的核心 - 让AI处理编码的繁琐部分，同时您保持完全的监督权。现在您已经掌握了基础知识，可以尝试更复杂的任务，探索不同的[模式](/basic-usage/using-modes) 以获得专门的工作流程，或尝试[自动批准功能](/features/auto-approving-actions) 来加速重复性任务。