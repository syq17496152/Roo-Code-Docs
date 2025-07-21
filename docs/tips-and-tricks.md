# 使用技巧与小贴士

汇集了一些快速提示，帮助您充分利用 Roo Code 的功能。

- 将 Roo Code 拖到 [二级侧边栏](https://code.visualstudio.com/api/ux-guidelines/sidebars#secondary-sidebar)，这样您可以同时看到资源管理器、搜索、版本控制等功能。
<img src="/img/right-column-roo.gif" alt="将 Roo 放在右侧列" width="900" />
- 当 Roo Code 位于文件资源管理器的独立侧边栏中时，您可以将文件从资源管理器拖放到聊天窗口中（甚至可以一次拖放多个文件）。只需确保在开始拖动文件后按住 Shift 键。
- 如果您没有使用 [MCP](/features/mcp/overview)，可以在 <Codicon name="server" /> MCP 服务器标签中关闭它，以显著减少系统提示的大小。
- 为了保持您的 [自定义模式](/features/custom-modes) 正确运行，请限制它们允许编辑的文件类型。
- 如果遇到令人头疼的 `input length and max tokens exceed context limit` 错误，可以通过删除消息、回滚到之前的检查点或切换到具有长上下文窗口的模型（如 Gemini）来恢复。
- 一般来说，在为推理模型设置 `Max Tokens` 参数时要深思熟虑。您分配给它的每个 token 都会占用存储对话历史的空间。建议仅在 Architect 和 Debug 等模式下使用高 `Max Tokens` / `Max Thinking Tokens` 设置，并保持代码模式在 16k 个 token 或更少。
- 如果有实际工作职位发布内容需要自定义模式处理，可以尝试让代码模式根据该职位信息创建一个定制模式：`Create a custom mode based on the job posting at @[url]`
- 如果想加速开发过程，可以克隆多个仓库副本并同时运行 Roo Code（使用 git 解决任何冲突，与处理人类开发者的方式相同）。
- 在使用调试模式时，要求 Roo 在调试模式下“开始新任务并加载解决 X 所需的所有必要上下文”，这样调试过程会使用自己的上下文窗口而不会污染主任务。
- 点击下方的“编辑此页面”来添加您自己的技巧！
- 为了管理大文件并减少上下文/资源使用，请调整 `File read auto-truncate threshold` 设置。此设置控制一次读取文件的行数。较低的值可以在处理非常大的文件时提高性能，但可能需要更多的读取操作。您可以在 Roo Code 设置下的“高级设置”中找到此选项。
- 为 [`roo.acceptInput` 命令](/features/keyboard-shortcuts) 设置键盘快捷键，无需鼠标即可接受建议或提交文本输入。这对于键盘驱动的工作流程和减轻手部压力非常完美。
- 使用 **粘性模型** 为不同的模式分配专门的人工智能模型（用于规划的推理模型，用于编码的非推理模型）。Roo 会自动切换到每种模式上次使用的模型，无需手动选择。