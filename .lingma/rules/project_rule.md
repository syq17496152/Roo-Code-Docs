# 项目规范及文档管理标准

## 一、项目规范

### 目录结构说明：
- `.lingma/` 项目配置目录
- `src/` 源码目录（含组件、样式、主题等子目录）
- `static/` 静态资源目录
- 核心配置文件（docusaurus.config.ts, package.json等）
- `docs/` 文档内容目录（新增）
```
├── docs/                     # 文档内容目录
│   ├── images/               # 文档图片资源
│   └── *.md                  # Markdown文档
```

### 编码规范建议：
- 组件命名采用PascalCase
- CSS模块化命名规范
- TypeScript类型定义规范

### 文档维护规则：
- Markdown文件编写规范
- 文档更新审批流程
- 版本发布规范
- 完善后的Markdown编写标准

## 二、翻译规范

### 基本原则
- **专业性优先**：所有IT相关术语必须采用行业通用译法（如：API保持不译，Machine Learning译为"机器学习"）
- **上下文适配**：根据技术场景选择最贴切的译法（如：Context在分布式追踪场景译为"上下文传播"，在AI场景译为"上下文学习"）
- **术语一致性**：建立统一术语表，核心术语示例：
- RESTful API → RESTful API（保留原文）
- Neural Network → 神经网络
- CI/CD → 持续集成/持续交付

### 翻译流程
1. 初稿翻译：使用专业CAT工具（如MemoQ）进行技术文档预处理
2. 技术审核：由2名具有5年以上开发经验的工程师交叉校验术语准确性
3. 语言润色：通过Grammarly等工具进行中文表达优化
4. 最终审批：技术负责人与语言专家联合签字确认

### 特殊内容处理
- 代码块：保留英文原文，添加中文注释
- 命令行示例：保留英文路径和参数
- 版本号：遵循语义化版本规范（如v2.4.1保持不变）
- 缩略语：首次出现时标注英文全称（如：Kubernetes（K8s））

## 三、文档检索工具规范

### 强制要求
- 所有Markdown文档检索必须使用`mcp_filesystem_search_files`工具
- 禁止使用默认内置的`search_file`工具进行文件搜索

### 标准检索流程
```python
# 示例代码（仅作说明，实际调用无需生成代码）
result = mcp_filesystem_search_files(
path="docs/",
pattern="*.md",
excludePatterns=["docs/images/", "docs/node_modules/"]
)
```

### 参数规范
- 必须指定`path`参数为`docs/`
- `pattern`必须为`*.md`
- 必须排除以下目录：
- docs/images/
- docs/node_modules/
- docs/.git/

### 异常处理
- 当搜索结果为空时，应提示"未找到符合条件的文档"
- 当工具调用失败时，应优先检查路径权限而非重试

## 四、文档翻译状态管理规范

### 状态标记规则
- [待翻译]：尚未开始翻译的文档
- [翻译中]：正在进行翻译的文档
- [审核中]：完成初稿但需技术审核
- [已翻译]：通过所有审核流程的文档

### 状态更新要求
- 每次修改文件后必须同步更新project_rule.md中的状态
- 翻译完成后24小时内必须标记为[已翻译]
- 每周进行一次文档翻译状态审计
- 状态变更需记录具体时间
- 最后更新时间字段必须同步更新

### 状态追踪表格式
```markdown
| 文件路径 | 翻译状态 | 最后更新时间 |
|---------|----------|-------------|
| docs/index.md | [已翻译] | 2025-07-16 |
| docs/faq.md | [已翻译] | 2025-07-16 |
| docs/tips-and-tricks.md | [已翻译] | 2025-07-16 |
| basic-usage/context-mentions.md | [已翻译] | 2025-07-16 |
| basic-usage/how-tools-work.md | [已翻译] | 2025-07-16 |
| basic-usage/the-chat-interface.md | [已翻译] | 2025-07-16 |
| basic-usage/typing-your-requests.md | [已翻译] | 2025-07-16 |
| basic-usage/using-modes.md | [已翻译] | 2025-07-16 |
| advanced-usage/roo-code-nightly.mdx | [已翻译] | 2025-07-16 |
| advanced-usage/large-projects.md | [已翻译] | 2025-07-16 |
| advanced-usage/context-poisoning.md | [已翻译] | 2025-07-16 |
| advanced-usage/footgun-prompting.md | [已翻译] | 2025-07-16 |
| advanced-usage/prompt-engineering.md | [已翻译] | 2025-07-16 |
| advanced-usage/prompt-structure.md | [已翻译] | 2025-07-16 |
| advanced-usage/rate-limits-costs.md | [已翻译] | 2025-07-16 |
| advanced-usage/local-development-setup.mdx | [已翻译] | 2025-07-16 |
| advanced-usage/local-models.md | [已翻译] | 2025-07-16 |
```

### 子目录文档状态追踪表格式规范

#### 标准表格格式
```markdown
| 文件路径 | 翻译状态 | 技术审核 | 语言润色 | 最终审批 |
|---------|----------|---------|---------|---------|
| advanced-usage/performance-optimization.md | [待翻译] | ❌ | ❌ | ❌ |
| advanced-usage/distributed-systems.md | [待翻译] | ❌ | ❌ | ❌ |
| basic-usage/context-mentions.md | [已翻译] | ✅ | ✅ | ✅ |
| basic-usage/how-tools-work.md | [已翻译] | ✅ | ✅ | ✅ |
| basic-usage/the-chat-interface.md | [已翻译] | ✅ | ✅ | ✅ |
| basic-usage/typing-your-requests.md | [已翻译] | ✅ | ✅ | ✅ |
| basic-usage/using-modes.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/access-mcp-resource.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/apply-diff.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/ask-followup-question.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/attempt-completion.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/browser-action.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/codebase-search.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/execute-command.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/insert-content.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/list-code-definition-names.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/list-files.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/new-task.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/read-file.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/search-and-replace.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/search-files.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/switch-mode.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/tool-use-overview.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/update-todo-list.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/use-mcp-tool.md | [已翻译] | ✅ | ✅ | ✅ |
| advanced-usage/available-tools/write-to-file.md | [已翻译] | ✅ | ✅ | ✅ |
```

#### 状态标记要求
- 必须使用统一的状态标记格式（[待翻译]/[翻译中]/[审核中]/[已翻译]）
- 质量控制状态使用✅/❌标记
- 所有状态变更必须记录具体时间

#### 子目录处理规范
- 每个子目录应单独创建状态追踪表
- 表格应包含子目录内所有文档
- 需要添加子目录描述备注
- 应保持与主文档状态表一致的术语使用

### 异常处理
- 发现未及时更新状态的情况，按质量事故处理
- 状态与实际内容不符时，回滚到最近有效状态
- 当文件无法检索时，应手动维护文件列表
- 需要定期校验文件列表与实际目录结构的一致性
- 当子目录包含大量文件时，应标记为[待处理]状态
- 需要定期校验子目录文件列表与实际内容的一致性
- 发现状态与实际内容不符时，应回滚到最近有效状态