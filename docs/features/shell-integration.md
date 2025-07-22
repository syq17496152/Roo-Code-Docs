# 终端Shell集成

终端Shell集成是Roo Code的一项核心功能，它使Roo能够执行终端命令并智能处理输出结果。这种AI与开发环境之间的双向通信解锁了强大的自动化功能。

---

## 什么是Shell集成？

Shell集成在Roo Code中默认启用，它直接连接到终端的命令执行生命周期，无需任何配置即可自动工作。这项内置功能使Roo能够：

- 通过[`execute_command`](/advanced-usage/available-tools/execute-command)工具代表您执行命令
- 实时读取命令输出而无需手动复制粘贴
- 自动检测并修复运行应用中的错误
- 观察命令退出代码以确定成功或失败
- 跟踪工作目录变化
- 智能响应终端输出而无需用户干预
- 通过聊天界面中的停止按钮直接停止正在运行的命令

<img src="/img/v3.15/v3.15.png" alt="聊天界面中的停止命令按钮" width="600" />

当您要求Roo执行安装依赖、启动开发服务器或分析构建错误等任务时，Shell集成会在后台工作以确保交互流畅有效。

---

## Shell集成故障排除

Shell集成内置于Roo Code中，在大多数情况下可自动工作。如果看到"Shell集成不可用"消息或遇到命令执行问题，请尝试以下解决方案：

1. **更新VSCode/Cursor**到最新版本（需VSCode 1.93+）
2. **确保选择兼容的shell**：命令面板（`Ctrl+Shift+P`或`Cmd+Shift+P`）→ "终端：选择默认配置文件" → 选择bash、zsh、PowerShell或fish
3. **Windows PowerShell用户**：运行`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`然后重启VSCode
4. **WSL用户**：在`~/.bashrc`中添加`. "$(code --locate-shell-integration-path bash)"`

---

## 命令执行回退机制

Roo Code具有执行命令的回退机制。当您选择使用VS Code的终端集成（通过取消勾选[`禁用终端Shell集成`](#disable-terminal-shell-integration)设置）且该集成失效时，此机制最为相关。

- **工作原理**：如果Roo Code配置为使用VS Code终端集成但无法连接或遇到问题，可能会自动尝试使用后台进程直接执行命令。这是为了确保命令仍能执行的回退方案。
- **通知**：如果使用此回退机制，您可能会在聊天中看到通知，说明命令正在运行但缺乏Roo内联终端或VS Code Shell集成的完整功能（例如实时输出流或精确的退出代码检测可能会受限）。
  <img src="/img/v3.15.0/v3.15.0.png" alt="命令执行回退通知示例" width="600" />

- **解决方案**：如果遇到此回退，通常表示VS Code Shell集成设置存在问题。请查看本文件中的故障排除步骤，或通过勾选[`禁用终端Shell集成`](#disable-terminal-shell-integration)设置使用Roo推荐的内联终端。

<img src="/img/shell-integration/shell-integration-12.png" alt="Roo Code推荐的内联终端" width="600" />
*Roo Code推荐的内联终端示例*。

---

## 终端集成设置

Roo Code提供了精细控制终端交互的设置。访问这些设置的步骤：
1. 点击Roo Code侧边栏右上角的<Codicon name="gear" />图标
2. 在打开的设置面板中，从左侧菜单选择"终端"组

### 基础设置

#### 终端输出限制
<img src="/img/shell-integration/shell-integration.png" alt="终端输出限制滑块设置为500" width="600" />
此设置控制Roo Code捕获命令输出的量。如果担心token使用或Roo处理长输出时变慢，请考虑降低此值（您仍会得到开头和结尾部分）。如果经常需要直接在Roo上下文中获取长命令的中间内容，请考虑增加此值（注意潜在token成本）。默认值：500行。

#### 压缩进度条输出
<img src="/img/shell-integration/shell-integration-10.png" alt="压缩进度条输出复选框" width="600" />
默认保持启用以获得更干净的输出和token节省。这使Roo Code将动态输出（如进度条或旋转器）更像真实终端处理，仅显示最终状态。仅在需要调试进度条中间原始输出等特殊情况时禁用。

### 高级设置

:::info 重要
**修改这些设置需要重启终端**

高级终端设置的修改仅在重启终端后生效。重启终端步骤：

1. 点击终端面板的垃圾桶图标关闭当前终端
2. 使用终端→新建终端或<kbd>Ctrl</kbd>+<kbd>`</kbd>（反引号）打开新终端

修改这些设置后请重启所有打开的终端。
:::

#### 继承环境变量
<img src="/img/shell-integration/shell-integration-11.png" alt="继承环境变量复选框" width="600" />
此设置控制Roo Code的终端会话是否使用与主VSCode/Cursor环境相同的环境变量（如`PATH`、API密钥等）。它直接镜像VSCode全局设置[`terminal.integrated.inheritEnv`](https://code.visualstudio.com/docs/editor/integrated-terminal#_inherit-environment-variables)。如果希望Roo命令与常规VSCode终端具有相同上下文和工具，请保持启用（VSCode默认值）。仅在需要完全干净的隔离环境或调试复杂环境变量冲突时考虑禁用。

### 运行时环境
macOS（和其他操作系统）上VSCode提供的环境可能因启动方式而异。  
如果通过`vscode`命令启动，VSCode和Roo Code将继承shell环境，通常没有问题。  
如果通过Finder、Dock或Spotlight启动，从`.zshrc`或`.zprofile`导出的环境变量可能缺失。如果在这些文件中设置了环境变量但发现缺失，请将它们移到.zshenv，并重新登录以使窗口管理器识别新的环境设置。

#### 禁用终端Shell集成
<img src="/img/shell-integration/shell-integration-9.png" alt="禁用终端Shell集成复选框" width="600" />
此设置决定Roo Code如何执行终端命令。
-   **保持勾选（推荐）**：Roo Code将使用内置内联终端执行命令，输出直接显示在聊天界面。这种方法通常更可靠，提供清晰的输出，是大多数用户通过Roo Code交互终端命令的首选方式。它确保命令在Roo Code管理的一致环境中运行。

    <img src="/img/shell-integration/shell-integration-12.png" alt="勾选禁用终端Shell集成时的Roo Code内联终端" width="600" />
    *勾选"禁用终端Shell集成"时的Roo Code内联终端*。

-   **取消勾选（使用VS Code终端集成）**：Roo Code将尝试在活动的VS Code终端面板中直接运行命令。这种方法在需要命令在完全自定义的VS Code shell环境中运行或需要与VS Code终端特定功能交互时可能有用。但根据您的shell设置和VS Code版本，这可能有时不可靠。

以下设置仅在您**取消勾选'禁用终端Shell集成'**时生效（选择使用VS Code终端集成而非Roo Code推荐的内联终端）：

##### 终端Shell集成超时
<img src="/img/shell-integration/shell-integration-1.png" alt="终端Shell集成超时滑块设置为15秒" width="600" />
如果启用了Shell集成但仍看到'Shell集成不可用'错误（特别是使用复杂shell设置如带多个插件的Zsh或加载缓慢的企业环境），您的shell初始化可能耗时过长。增加此值以给shell更多时间向Roo Code发送就绪信号。尝试5-10秒的增量。默认：15秒（如UI所示）。

##### 终端命令延迟
<img src="/img/shell-integration/shell-integration-2.png" alt="终端命令延迟滑块设置为0毫秒" width="600" />
如果命令输出不完整或Roo似乎漏掉了命令输出（即使启用了Shell集成），可以引入小延迟。建议尝试50ms或100ms延迟。这给终端更多时间在Roo Code认为命令完成之前刷新所有输出。这是VSCode终端或某些shell的潜在时序问题的解决方法。默认：0ms。

##### 启用PowerShell计数器解决方法
<img src="/img/shell-integration/shell-integration-3.png" alt="启用PowerShell计数器解决方法复选框" width="600" />
仅限PowerShell用户。如果发现Roo Code难以运行相同的PowerShell命令多次，或命令输出捕获不可靠，请启用此设置。这会在命令中添加唯一计数器帮助PowerShell区分命令。

##### 清除ZSH EOL标记
<img src="/img/shell-integration/shell-integration-4.png" alt="清除ZSH EOL标记复选框" width="600" />
仅限Zsh用户。Zsh有时会在行尾添加特殊字符（通常为`%`），如果Roo Code似乎误解或混淆Zsh命令输出，请启用此设置。这会尝试删除该标记（`PROMPT_EOL_MARK=''`）。

##### 启用Oh My Zsh集成
<img src="/img/shell-integration/shell-integration-5.png" alt="启用Oh My Zsh集成复选框" width="600" />
针对使用流行Oh My Zsh框架的用户。如果使用Oh My Zsh且遇到终端命令执行或输出渲染问题，请启用此设置。这通过设置`ITERM_SHELL_INTEGRATION_INSTALLED=Yes`帮助Roo Code与Oh My Zsh的特定Shell集成机制对齐。可能需要重启IDE。

##### 启用Powerlevel10k集成
<img src="/img/shell-integration/shell-integration-6.png" alt="启用Powerlevel10k集成复选框" width="600" />
针对使用Zsh的Powerlevel10k主题的用户。如果Powerlevel10k提示符（可能很复杂）似乎干扰Roo Code正确检测命令边界、解析输出或跟踪当前工作目录，请启用此设置。这通过设置`POWERLEVEL9K_TERM_SHELL_INTEGRATION=true`。

##### 启用ZDOTDIR处理
<img src="/img/shell-integration/shell-integration-7.png" alt="启用ZDOTDIR处理复选框" width="600" />
针对具有自定义Zsh启动文件位置的高级选项。如果使用`ZDOTDIR`指定Zsh配置文件的自定义目录（如`.zshrc`），请启用此设置。这通过为集成脚本创建隔离的临时`ZDOTDIR`帮助Roo Code正确处理此类设置，防止与个人Zsh环境冲突。

---

## Shell集成的工作原理

Shell集成实时连接Roo到终端的命令执行过程：

1. **连接**：打开终端时，VS Code与您的shell建立特殊连接。

2. **命令跟踪**：VS Code通过检测以下内容监控终端活动：
   - 新提示符出现时
   - 输入命令时
   - 命令开始运行时
   - 命令完成时（及其成功或失败）
   - 当前所在目录

3. **不同shell，相同结果**：每种shell类型（Bash、Zsh、PowerShell、Fish）在幕后略有不同的实现，但都为Roo提供相同功能。

4. **信息收集**：Roo可以看到正在运行的命令、运行位置、耗时、是否成功及其完整输出 - 所有这些都无需复制粘贴。

---

## Shell集成故障排除

### PowerShell执行策略（Windows）

PowerShell默认限制脚本执行。配置步骤：

1. 以管理员身份打开PowerShell
2. 检查当前策略：`Get-ExecutionPolicy`
3. 设置适当策略：`Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

常用策略：
- `Restricted`：不允许任何脚本（默认）
- `RemoteSigned`：本地脚本可运行；下载的脚本需要签名
- `Unrestricted`：所有脚本运行但有警告
- `AllSigned`：所有脚本必须签名

### 手动Shell集成安装

如果自动集成失败，请将适当行添加到您的shell配置：

**Bash**（`~/.bashrc`）：
```bash
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path bash)"
```

**Zsh**（`~/.zshrc`）：
```bash
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
```

**PowerShell**（`$Profile`）：
```powershell
if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }
```

**Fish**（`~/.config/fish/config.fish`）：
```fish
string match -q "$TERM_PROGRAM" "vscode"; and . (code --locate-shell-integration-path fish)
```

### 终端定制问题

如果使用终端定制工具：

**Powerlevel10k**：
```bash
# 在~/.zshrc中引入前添加
typeset -g POWERLEVEL9K_TERM_SHELL_INTEGRATION=true
```

**替代方案**：启用Roo Code中的Powerlevel10k集成设置。

### 验证Shell集成状态

确认Shell集成激活状态：

**Bash**：
```bash
set | grep -i '[16]33;'
echo "$PROMPT_COMMAND" | grep vsc
trap -p DEBUG | grep vsc
```

**Zsh**：
```zsh
functions | grep -i vsc
typeset -p precmd_functions preexec_functions
```

**PowerShell**：
```powershell
Get-Command -Name "*VSC*" -CommandType Function
Get-Content Function:\Prompt | Select-String "VSCode"
```

**Fish**：
```fish
functions | grep -i vsc
functions fish_prompt | grep -i vsc
```

视觉指标：
1. 终端标题栏中的Shell集成指示器
2. 命令检测高亮
3. 终端标题中的工作目录更新
4. 命令持续时间和退出代码报告

---

## WSL终端集成方法

使用Windows子系统运行Linux（WSL）时，有两种不同的VSCode与WSL交互方式，每种方式对Shell集成有不同的影响：

### 方法1：Windows版VSCode与WSL终端

在此设置中：
- VSCode在Windows中本地运行
- 使用VSCode的WSL终端集成功能
- Shell命令通过WSL桥接执行
- 由于Windows-WSL通信可能会有额外延迟
- Shell集成标记可能受WSL-Windows边界影响：您需要确保在WSL环境中加载了`source "$(code --locate-shell-integration-path <shell>)"`，因为可能不会自动加载；见上文

### 方法2：在WSL内运行的VSCode

在此设置中：
- 通过`code .`直接在WSL内启动VSCode
- VSCode服务器在Linux环境中本地运行
- 直接访问Linux文件系统和工具
- 更好的性能和可靠性
- Shell集成自动加载，因为VSCode在Linux环境中本地运行
- WSL开发的推荐方法

WSL的Shell集成优化建议：
1. 打开WSL发行版
2. 导航到项目目录
3. 通过`code .`启动VSCode
4. 使用VSCode中的集成终端

---

## 已知问题和解决方法

### Cygwin（bash、zsh）

Cygwin在Windows系统上提供类Unix环境。在VS Code中配置Cygwin：

1. 从[https://www.cygwin.com/](https://www.cygwin.com/)安装Cygwin

2. 打开VS Code设置：
   - 选择文件 > 首选项 > 设置
   - 点击右上角的"打开设置（JSON）"图标

3. 在`settings.json`中添加以下配置（在顶层大括号`{}`内）：
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

   > 注意：如果您安装了32位Cygwin，请将路径改为`"C:\\cygwin\\bin\\bash.exe"`

4. 理解配置：
   - `path`：指向Cygwin安装中的Bash可执行文件
   - `args`：`--login`标志确保shell读取配置文件
   - `env`：`CHERE_INVOKING`环境变量告诉Cygwin使用当前目录作为工作目录
   - `terminal.integrated.defaultProfile.windows`：将Cygwin设置为默认终端配置文件

5. 打开新Cygwin终端：
   - 按Ctrl+Shift+`打开新终端，或
   - 按F1，输入"终端：创建新终端（带配置文件）"，选择"Cygwin"

虽然我们的测试显示这开箱即用，但如果遇到Cygwin Shell集成问题，请确保已将适当的Shell集成钩子添加到Cygwin bash配置文件中，如"手动Shell集成安装"部分所述。

### VS Code Shell集成在Fish + Cygwin上的工作原理

对于在Cygwin环境中运行Fish终端的Windows用户：

1.  **（可选）定位Shell集成脚本**：
    在VS Code内的Fish终端中运行以下命令：
    ```bash
    code --locate-shell-integration-path fish
    ```
    这会输出`shellIntegration.fish`脚本的路径。记下此路径。

2.  **更新Fish配置**：
    编辑您的`config.fish`文件（通常位于Cygwin主目录的`~/.config/fish/config.fish`）。在`if status is-interactive`块内或文件末尾添加以下行：

    ```fish
    # 示例config.fish结构
    if status is-interactive
        # 您的其他交互式shell配置...
        # 自动定位集成脚本：
        string match -q "$TERM_PROGRAM" "vscode"; and . (code --locate-shell-integration-path fish)

        # 源VS Code Shell集成脚本
        # 重要：将示例路径替换为您在步骤1中找到的实际路径。
        # 确保路径采用Cygwin可识别的格式（如使用/cygdrive/c/...）。
        # source "/cygdrive/c/Users/YourUser/.vscode/extensions/..../shellIntegration.fish"
    end
    ```
    *请将示例路径替换为步骤1中的实际路径，并正确格式化为Cygwin可识别的路径*。

3.  **配置VS Code终端配置文件**：
    打开您的VS Code `settings.json`文件（Ctrl+Shift+P → "首选项：打开用户设置（JSON）"）。在`terminal.integrated.profiles.windows`下更新或添加Fish配置：

    ```json
    {
      "terminal.integrated.profiles.windows": {
        "fish": {
          "path": "C:\\cygwin64\\bin\\bash.exe",
          "args": [
            "--login",
            "-i",
            "-c",
            "exec fish"
          ],
          "icon": "terminal-bash"
        },
        "fish-direct": {
          "path": "C:\\cygwin64\\bin\\fish.exe",
          "options": ["-l", "-c"],
          "icon": "terminal-fish"
        }
      },
      "terminal.integrated.defaultProfile.windows": "fish"
    }
    ```
    *在Cygwin环境中，使用`bash.exe --login -i -c "exec fish"`通常更可靠。但如果此方法不起作用，请尝试`fish-direct`配置*。

4.  **重启VS Code**：
    完全关闭并重新打开Visual Studio Code以应用更改。

5.  **验证**：
    在VSCode中打开新Fish终端。Shell集成功能（如命令装饰、更好的命令历史导航等）现在应该激活。您可以通过运行简单命令如`echo "Hello from integrated Fish!"`测试基本功能。 <img src="/img/shell-integration/shell-integration-8.png" alt="Fish Cygwin集成示例" width="600" />
    *此设置在Windows系统上使用Cygwin、Fish和Starship提示符时工作可靠，应帮助使用类似配置的用户*。


### VSCode 1.98后Shell集成失败

**问题**：VSCode更新到1.98版本后，Shell集成可能因错误"VSCE输出开始转义序列（]633;C或]133;C）未收到"失败。

**解决方案**：
1. **设置终端命令延迟**：
   - 在Roo Code设置中将终端命令延迟设为50ms
   - 修改设置后重启所有终端
   - 这与旧版默认行为匹配，可能解决此问题。但有些用户报告0ms效果更好。这是上游VSCode问题的解决方法。

2. **回退VSCode版本**：
   - 从[VSCode更新](https://code.visualstudio.com/updates/v1_98)下载VSCode v1.98
   - 替换当前VSCode安装
   - 不需要备份Roo设置

3. **WSL特定解决方法**：
   - 如果使用WSL，请确保通过`code .`在WSL内启动VSCode

4. **ZSH用户**：
   - 尝试启用Roo设置中的ZSH相关解决方法
   - 这些设置在任何操作系统上都可能有帮助


### Ctrl+C行为

**问题**：如果Roo尝试运行命令时终端中已有输入，Roo会先按Ctrl+C清除行，这可能会中断正在运行的进程。

**解决方法**：在Roo执行终端命令前确保终端提示符为空（没有部分命令输入）。

### 多行命令问题

**问题**：跨多行的命令可能会混淆Roo，导致输出包含前一个命令的混合内容。

**解决方法**：使用`&&`命令链，保持单行（如`echo a && echo b`）而非多行输入。

### PowerShell特定问题

1. **提前完成**：PowerShell有时会告知Roo一个命令已完成，但输出尚未显示完毕。
2. **重复命令**：PowerShell可能拒绝连续运行相同命令。

**解决方法**：启用"PowerShell计数器解决方法"设置并在设置中设置150ms终端命令延迟以给命令更多完成时间。

### 不完整终端输出

**问题**：有时VS Code不显示或捕获命令的所有输出。

**解决方法**：如果发现输出缺失，尝试关闭并重新打开终端标签，然后重新运行命令。这会刷新终端连接。

---

## 故障排除资源

### 检查调试日志

当Shell集成问题发生时，请检查调试日志：
1. 打开帮助 → 切换开发者工具 → 控制台
2. 设置"显示所有级别"以查看所有日志
3. 查找包含`[Terminal Process]`的日志
4. 检查错误消息中的`preOutput`内容：
   - 空preOutput（`''`）表示VSCode未发送任何数据
   - 这表示潜在的VSCode Shell集成问题，或上游错误
   - Shell集成标记缺失可能需要调整设置以绕过上游错误或本地工作站的shell初始化问题

### 使用VSCode终端集成测试扩展

[VSCode终端集成测试扩展](https://github.com/KJ7LNW/vsce-test-terminal-integration)通过测试不同设置组合帮助诊断Shell集成问题：


1. **当命令停滞时**：
   - 如果看到"命令已运行"警告，点击"重置统计"以重置终端状态
   - 这些警告表示Shell集成未工作
   - 尝试不同设置组合直到找到有效配置
   - 如果确实卡住，通过关闭窗口按F5重启扩展

2. **测试设置**：
   - 系统性尝试不同组合：
      * 终端命令延迟
      * Shell集成设置
   - 记录成功或失败的组合
   - 这有助于识别Shell集成问题的模式

3. **报告问题**：
   - 找到问题配置后
   - 记录确切设置组合
   - 注意环境（操作系统、VSCode版本、shell和任何shell提示符定制）
   - 创建包含这些详细信息的问题以帮助改进Shell集成

### 其他资源

- [VSCode终端输出问题#237208](https://github.com/microsoft/vscode/issues/237208)
- [VSCode终端集成测试仓库](https://github.com/KJ7LNW/vsce-test-terminal-integration)
- [Roo Code Shell集成架构PR](https://github.com/RooCodeInc/Roo-Code/pull/1365)

---

## 支持

如果仍然遇到问题：

1. 检查[Roo Code GitHub Issues](https://github.com/RooCodeInc/Roo-Code/issues)
2. 创建包含以下内容的新问题：
   - 操作系统和VSCode版本
   - Shell类型
   - 复现步骤
   - 错误信息

如需更多帮助，请加入我们的[Discord](https://discord.gg/roocode)。