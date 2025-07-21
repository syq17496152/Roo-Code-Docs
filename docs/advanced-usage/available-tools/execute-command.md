# execute_command

`execute_command` 工具在用户的系统上运行 CLI 命令。它允许 Roo 执行系统操作、安装依赖项、构建项目、启动服务器以及执行其他基于终端的任务，以完成用户目标。

---

## 参数

该工具接受以下参数：

- `command` (必填)：要执行的 CLI 命令。必须适用于用户的操作系统。
- `cwd` (可选)：执行命令的工作目录。如果未提供，则使用当前工作目录。

---

## 功能说明

此工具在用户的系统上直接执行终端命令，能够执行从文件操作到运行开发服务器的广泛操作。命令在受管理的终端实例中运行，并实时捕获输出，与 VS Code 的终端系统集成，以实现最佳性能和安全性。

---

## 使用场景

- 安装项目依赖项时（如 npm install、pip install 等）
- 构建或编译代码时（如 make、npm run build 等）
- 启动开发服务器或运行应用程序时
- 初始化新项目时（如 git init、npm init 等）
- 执行其他工具无法提供的文件操作时
- 运行测试或代码检查操作时
- 需要为特定技术执行专用命令时

---

## 主要功能

- 与 VS Code shell API 集成以实现可靠的终端执行
- 通过注册表系统尽可能复用终端实例
- 逐行捕获命令输出并提供实时反馈
- 支持在后台继续运行的长时间命令
- 允许指定自定义工作目录
- 在命令执行之间保持终端历史记录和状态
- 处理适合用户 shell 的复杂命令链
- 提供详细的命令完成状态和退出代码解释
- 支持带有用户反馈循环的交互式终端应用程序
- 执行期间显示终端以实现透明度
- 使用 shell-quote 解析验证命令安全性
- 阻止潜在危险的子 shell 执行模式
- 与 RooIgnore 系统集成以实现文件访问控制
- 处理终端转义序列以实现干净的输出

---

## 局限性

- 命令访问可能受到 RooIgnore 规则和安全验证的限制
- 需要提升权限的命令可能需要用户配置
- 某些命令在不同操作系统上的行为可能不同
- 长时间运行的命令可能需要特殊处理
- 文件路径应根据操作系统 shell 规则正确转义
- 并非所有终端功能都适用于远程开发场景

---

## 工作原理

当调用 `execute_command` 工具时，它遵循以下流程：

1. **命令验证和安全检查**：
   - 使用 shell-quote 解析命令以识别组件
   - 验证命令是否符合安全限制（子 shell 使用、受限文件）
   - 根据 RooIgnore 规则检查文件访问权限
   - 确保命令符合系统安全要求

2. **终端管理**：
   - 通过 TerminalRegistry 获取或创建终端
   - 设置工作目录上下文
   - 准备输出捕获的事件监听器
   - 显示终端以便用户可见

3. **命令执行和监控**：
   - 通过 VS Code 的 shellIntegration API 执行
   - 捕获带有转义序列处理的输出
   - 节流输出处理（100ms 间隔）
   - 监控命令完成或错误
   - 检测 "热" 进程（如编译器）以进行特殊处理

4. **结果处理**：
   - 去除 ANSI/VS Code 转义序列以获得干净的输出
   - 使用详细的信号信息解释退出代码
   - 如果命令更改了工作目录，则更新工作目录跟踪
   - 提供带有适当上下文的命令状态

---

## 终端实现细节

该工具使用了复杂的终端管理系统：

1. **首要原则：终端复用**：
   - TerminalRegistry 会尽可能复用现有终端
   - 这减少了终端实例的扩散并提高了性能
   - 终端状态（工作目录、历史记录）在命令之间保持不变

2. **次要原则：安全验证**：
   - 使用 shell-quote 解析命令以进行组件分析
   - 阻止危险模式，如 `$(...)` 和反引号
   - 根据 RooIgnore 规则检查命令的文件访问权限
   - 使用基于前缀的白名单系统验证命令模式

3. **性能优化**：
   - 输出在 100ms 节流间隔内处理以防止 UI 超载
   - 零拷贝缓冲区管理使用基于索引的跟踪以提高效率
   - 对编译和 "热" 进程进行特殊处理
   - 为 Windows PowerShell 提供特定于平台的优化

4. **错误和信号处理**：
   - 退出代码映射到详细的信号信息（SIGTERM、SIGKILL 等）
   - 核心转储检测以应对关键故障
   - 自动跟踪和处理工作目录更改
   - 从终端断开连接场景中干净恢复

---

## 使用示例

- 设置新项目时，Roo 运行初始化命令，如 `npm init -y`，然后安装依赖项。
- 构建 Web 应用程序时，Roo 执行构建命令，如 `npm run build` 以编译资源。
- 部署代码时，Roo 运行 Git 命令以提交并推送到仓库。
- 排查故障时，Roo 执行诊断命令以收集系统信息。
- 启动开发服务器时，Roo 启动适当的服务器命令（如 `npm start`）。
- 运行测试时，Roo 执行项目的测试运行器命令。

---

## 使用示例代码

在当前目录中运行简单命令：
```xml
<execute_command>
<command>npm run dev</command>
</execute_command>
```

安装项目依赖项：
```xml
<execute_command>
<command>npm install express mongodb mongoose dotenv</command>
</execute_command>
```

按顺序运行多个命令：
```xml
<execute_command>
<command>mkdir -p src/components && touch src/components/App.js</command>
</execute_command>
```

在特定目录中执行命令：
```xml
<execute_command>
<command>git status</command>
<cwd>./my-project</cwd>
</execute_command>
```

构建然后启动项目：
```xml
<execute_command>
<command>npm run build && npm start</command>
</execute_command>