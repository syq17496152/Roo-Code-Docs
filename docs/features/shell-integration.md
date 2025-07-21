# 终端 Shell 集成

终端 Shell 集成是一个关键功能，使 Roo Code 能够在您的终端中执行命令并智能处理其输出。这种 AI 与开发环境之间的双向通信解锁了强大的自动化能力。

// ... existing code ...

## 什么是 Shell 集成？

Shell 集成在 Roo Code 中自动启用，并直接连接到您的终端命令执行生命周期，无需您进行任何设置。这个内置功能使 Roo 能够：

- 通过 [`execute_command`](/advanced-usage/available-tools/execute-command) 工具代表您执行命令
- 实时读取命令输出，无需手动复制粘贴
- 自动检测并修复运行应用程序中的错误
- 观察命令退出代码以确定成功或失败
- 跟踪工作目录的变化
- 智能响应终端输出
- 直接从聊天界面停止正在运行的命令

// ... existing code ...

## 故障排除 Shell 集成

Shell 集成内置于 Roo Code 中，大多数情况下可自动工作。如果看到 "Shell Integration Unavailable" 消息或遇到命令执行问题，请尝试以下解决方案：

1. **更新 VSCode/Cursor** 到最新版本（需要 VSCode 1.93+）
2. **确保选择了兼容的 shell**：命令面板（`Ctrl+Shift+P` 或 `Cmd+Shift+P`）→ "Terminal: Select Default Profile" → 选择 bash、zsh、PowerShell 或 fish
3. **Windows PowerShell 用户**：运行 `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` 然后重启 VSCode
4. **WSL 用户**：在 `~/.bashrc` 中添加 `. "$(code --locate-shell-integration-path bash)"`

// ... existing code ...

## 终端集成设置

Roo Code 提供了设置来微调它与终端的交互方式。要访问这些设置：
1. 点击 Roo Code 侧边栏右上角的 <Codicon name="gear" /> 图标。
2. 在打开的设置面板中，从左侧菜单中选择 "Terminal" 组。

### 基本设置

#### 终端输出限制
<img src="/img/shell-integration/shell-integration.png" alt="终端输出限制滑块设置为 500" width="600" />
此设置控制 Roo Code 从您的命令中捕获多少输出。如果您担心令牌使用情况或 Roo 处理长输出时似乎很慢，请考虑降低它。如果您经常需要长命令中间内容，请考虑增加它，但请注意潜在的令牌成本。默认值：500 行。

// ... existing code ...

### 高级设置

:::info 重要
**更改这些设置需要重启终端**

高级终端设置的更改仅在重启终端后生效。要重启终端：

1. 点击终端面板中的垃圾桶图标关闭当前终端
2. 使用 Terminal → New Terminal 或 <kbd>Ctrl</kbd>+<kbd>`</kbd>（反引号）打开新终端

更改这些设置后，始终重启所有打开的终端。
:::

// ... existing code ...

## Shell 集成如何工作

Shell 集成实时连接 Roo 到您的终端命令执行过程：

1. **连接**：当您打开一个终端时，VS Code 与您的 shell 建立特殊连接。

2. **命令跟踪**：VS Code 通过检测以下内容监控您的终端活动：
   - 新提示符出现时
   - 输入命令时
   - 命令开始运行时
   - 命令完成时（以及是否成功）
   - 当前所在目录

3. **不同 shell，相同结果**：每种 shell 类型（Bash、Zsh、PowerShell、Fish）都在幕后略有不同的实现，但都为 Roo 提供相同的功能。

4. **信息收集**：Roo 可以看到哪些命令正在运行、在哪里运行、耗时多久、是否成功及其完整输出 - 所有这些都不需要您复制和粘贴。

// ... existing code ...

## WSL 终端集成方法

使用 Windows Subsystem for Linux (WSL) 时，有两种不同的方式将 VSCode 与 WSL 结合使用，每种方式对 shell 集成都有不同的影响：

### 方法 1：Windows 上的 VSCode 与 WSL 终端

在这种设置中：
- VSCode 在 Windows 中本地运行
- 您使用 VSCode 中的 WSL 终端集成功能
- Shell 命令通过 WSL 桥接执行
- 由于 Windows-WSL 通信可能会有额外延迟
- Shell 集成标记可能受 WSL-Windows 边界影响：必须确保在 WSL 环境中加载了 `source "$(code --locate-shell-integration-path <shell>)"`

// ... existing code ...

## 已知问题和解决方法

### Cygwin (bash, zsh)

Cygwin 在 Windows 系统上提供类 Unix 环境。要在 VS Code 中将 Cygwin 配置为终端：

1. 从 [https://www.cygwin.com/](https://www.cygwin.com/) 安装 Cygwin

2. 打开 VS Code 设置：
   - 选择 File > Preferences > Settings
   - 点击右上角的 "Open Settings (JSON)" 图标
   
3. 将以下配置添加到您的 `settings.json`（在顶层大括号 `{}` 内）：
   ```json
   {
     "terminal.integrated.profiles.windows": {
       "Cygwin": {
         "path": "C:\\cygwin64\\bin\\bash.exe",
         "args": ["--login"],
         "env": {"CHERE_INVOKING": "1"}
       }
     },
     "terminal.integrated.defaultProfile.windows": "Cygwin"
   }
   ```

   > 注意：如果您安装的是 32 位 Cygwin，请将路径改为 `"C:\\cygwin\\bin\\bash.exe"`

4. 理解配置：
   - `path`：指向 Cygwin 安装中的 Bash 可执行文件
   - `args`：`--login` 标志确保 shell 读取配置文件
   - `env`：`CHERE_INVOKING` 环境变量告诉 Cygwin 使用当前目录作为工作目录
   - `terminal.integrated.defaultProfile.windows`：将 Cygwin 设为默认终端配置文件

5. 打开新 Cygwin 终端：
   - 按 Ctrl+Shift+(backtick) 打开新终端，或
   - 按 `F1`，输入 "Terminal: Create New Terminal (with Profile)"，然后选择 "Cygwin"

虽然我们的测试显示这可以开箱即用，但如果遇到 Cygwin 的 shell 集成问题，请确保按照 "手动安装 Shell 集成" 部分所述将适当的 shell 集成钩子添加到您的 Cygwin bash 配置文件中。

// ... existing code ...

## 支持

如果您仍有问题：

1. 检查 [Roo Code GitHub Issues](https://github.com/RooCodeInc/Roo-Code/issues)
2. 创建包含以下内容的新问题：
   - OS 和 VSCode 版本
   - Shell 类型
   - 重现步骤
   - 错误消息

如需额外帮助，请加入我们的 [Discord](https://discord.gg/roocode)。