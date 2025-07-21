# Roo Code 动态规则（作者：cannuri）

[查看 GitHub 项目](https://github.com/cannuri/roo-code-dynamic-rules)

受 LangMem 启发，这个简单规则允许您通过在消息中书写 `RULE/NORULE: (your new rule)` 来动态定义和删除规则。当您使用这种格式书写时，Roo Code 将会自动将其添加到或从 `.clinerules` 文件中移除。这种方式使您可以灵活地即时定义项目特定规则，并逐步构建和完善这些规则。