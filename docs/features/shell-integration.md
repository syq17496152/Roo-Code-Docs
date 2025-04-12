# Terminal Shell Integration

Terminal Shell Integration is a key feature that enables Roo Code to execute commands in your terminal and intelligently process their output. This bidirectional communication between the AI and your development environment unlocks powerful automation capabilities.

## What is Shell Integration?

Shell integration is automatically enabled in Roo Code and connects directly to your terminal's command execution lifecycle without requiring any setup from you. This built-in feature allows Roo to:

- Execute commands on your behalf through the [`execute_command`](/features/tools/execute-command) tool
- Read command output in real-time without manual copy-pasting
- Automatically detect and fix errors in running applications
- Observe command exit codes to determine success or failure
- Track working directory changes as you navigate your project
- React intelligently to terminal output without user intervention

When you ask Roo to perform tasks like installing dependencies, starting a development server, or analyzing build errors, shell integration works behind the scenes to make these interactions smooth and effective.

## Troubleshooting Shell Integration

Shell integration is built into Roo Code and works automatically in most cases. If you see "Shell Integration Unavailable" messages or experience issues with command execution, try these solutions:

1. **Update VSCode/Cursor** to the latest version (VSCode 1.93+ required)
2. **Ensure a compatible shell is selected**: Command Palette (`Ctrl+Shift+P` or `Cmd+Shift+P`) → "Terminal: Select Default Profile" → Choose bash, zsh, PowerShell, or fish
3. **Windows PowerShell users**: Run `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` then restart VSCode
4. **WSL users**: Add `. "$(code --locate-shell-integration-path bash)"` to your `~/.bashrc`

## Terminal Integration Settings

Roo Code provides several settings to fine-tune shell integration. Access these in the Roo Code sidebar under Settings → Terminal.

### Basic Settings

#### Terminal Output Limit
<img src="/img/shell-integration/shell-integration.png" alt="Terminal output limit slider set to 500" width="600" />

Controls the maximum number of lines captured from terminal output. When exceeded, lines are removed from the middle to save tokens. Default: 500 lines.

#### Terminal Shell Integration Timeout
<img src="/img/shell-integration/shell-integration-1.png" alt="Terminal shell integration timeout slider set to 15s" width="600" />

Maximum time to wait for shell integration to initialize before executing commands. Increase this value if you experience "Shell Integration Unavailable" errors. Default: 15 seconds.

#### Terminal Command Delay
<img src="/img/shell-integration/shell-integration-2.png" alt="Terminal command delay slider set to 0ms" width="600" />

Adds a delay after command execution to ensure full output capture. Implemented using `PROMPT_COMMAND='sleep N'` in bash/zsh or `start-sleep` in PowerShell. Originally a workaround for VSCode bug #237208, may not be needed on most systems. Default: 0ms (disabled).

### Advanced Settings

#### PowerShell Counter Workaround
<img src="/img/shell-integration/shell-integration-3.png" alt="PowerShell counter workaround checkbox" width="600" />

Appends a unique counter to PowerShell commands to prevent duplicate command issues. Enable this if PowerShell fails to execute identical consecutive commands.

#### Clear ZSH EOL Mark
<img src="/img/shell-integration/shell-integration-4.png" alt="Clear ZSH EOL mark checkbox" width="600" />

Sets `PROMPT_EOL_MARK=""` to clear ZSH end-of-line marks, preventing issues with command output when output ends with special characters like '%'.

#### Oh My Zsh Integration
<img src="/img/shell-integration/shell-integration-5.png" alt="Enable Oh My Zsh integration checkbox" width="600" />

Sets `ITERM_SHELL_INTEGRATION_INSTALLED="Yes"` to enable proper integration with Oh My Zsh. Experimental feature for users of Oh My Zsh.

#### Powerlevel10k Integration
<img src="/img/shell-integration/shell-integration-6.png" alt="Enable Powerlevel10k integration checkbox" width="600" />

Sets `POWERLEVEL9K_TERM_SHELL_INTEGRATION=true` to enable proper integration with the Powerlevel10k ZSH theme.

#### ZDOTDIR Handling
<img src="/img/shell-integration/shell-integration-7.png" alt="Enable ZDOTDIR handling checkbox" width="600" />

Creates a temporary directory for ZDOTDIR to handle ZSH shell integration properly while preserving your ZSH configuration.

## How Shell Integration Works

Shell integration uses terminal sequences to mark different stages of command execution:

1. **Activation**: When you open a terminal, your shell sends an activation sequence (`\x1b]633;A\x07`).

2. **Command Lifecycle**: VSCode tracks each command using Operating System Command (OSC) sequences:
   - OSC 633;A - Mark prompt start
   - OSC 633;B - Mark command start
   - OSC 633;C - Mark command executed
   - OSC 633;D - Mark command finished with exit code
   - OSC 633;E - Set command line
   - OSC 633;P - Set properties like current working directory

3. **Shell-Specific Implementation**:

   | Shell | Initial Activation | Command Start | Command Stop |
   |-------|-------------------|---------------|--------------|
   | Bash | `PROMPT_COMMAND` | `trap DEBUG` | `PROMPT_COMMAND` |
   | Zsh | `precmd` | `preexec` | `precmd` |
   | PowerShell | `prompt` function | `PSConsoleHostReadLine` | `prompt` function |
   | Fish | `fish_prompt` | `fish_preexec` | `fish_prompt` |

4. **Output Capture**: Roo Code captures command text, working directory, start/end times, exit codes, and output streams.

## Troubleshooting Shell Integration

### PowerShell Execution Policy (Windows)

PowerShell restricts script execution by default. To configure:

1. Open PowerShell as Administrator
2. Check current policy: `Get-ExecutionPolicy`
3. Set appropriate policy: `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser`

Common policies:
- `Restricted`: No scripts allowed (default)
- `RemoteSigned`: Local scripts can run; downloaded scripts need signing
- `Unrestricted`: All scripts run with warnings
- `AllSigned`: All scripts must be signed

### Manual Shell Integration Installation

If automatic integration fails, add the appropriate line to your shell configuration:

**Bash** (`~/.bashrc`):
```bash
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path bash)"
```

**Zsh** (`~/.zshrc`):
```bash
[[ "$TERM_PROGRAM" == "vscode" ]] && . "$(code --locate-shell-integration-path zsh)"
```

**PowerShell** (`$Profile`):
```powershell
if ($env:TERM_PROGRAM -eq "vscode") { . "$(code --locate-shell-integration-path pwsh)" }
```

**Fish** (`~/.config/fish/config.fish`):
```fish
string match -q "$TERM_PROGRAM" "vscode"; and . (code --locate-shell-integration-path fish)
```

### Terminal Customization Issues

If you use terminal customization tools:

**Powerlevel10k**:
```bash
# Add before sourcing powerlevel10k in ~/.zshrc
typeset -g POWERLEVEL9K_TERM_SHELL_INTEGRATION=true
```

**Alternative**: Enable the Powerlevel10k Integration setting in Roo Code.

### Verifying Shell Integration Status

Confirm shell integration is active with these commands:

**Bash**:
```bash
set | grep -i '[16]33;'
echo "$PROMPT_COMMAND" | grep vsc
trap -p DEBUG | grep vsc
```

**Zsh**:
```zsh
functions | grep -i vsc
typeset -p precmd_functions preexec_functions
```

**PowerShell**:
```powershell
Get-Command -Name "*VSC*" -CommandType Function
Get-Content Function:\Prompt | Select-String "VSCode"
```

**Fish**:
```fish
functions | grep -i vsc
functions fish_prompt | grep -i vsc
```

Visual indicators of active shell integration:
1. Shell integration indicator in terminal title bar
2. Command detection highlighting
3. Working directory updates in terminal title
4. Command duration and exit code reporting

## Known Issues and Workarounds

### Ctrl+C Behavior

**Issue**: If text is in the terminal when Roo runs a command, shell integration sends Ctrl+C first, breaking output capture.

**Workaround**: Ensure terminal prompt is clean before letting Roo run commands.

### Multi-line Command Issues

**Issue**: Multi-line commands produce unexpected behavior with phantom output from previous commands.

**Workaround**: Use command chaining with `&&` instead of multiple lines (e.g., `echo a && echo b`).

### PowerShell-Specific Issues

1. **Output Buffering**: PowerShell may emit completion markers before output is fully processed.
2. **Duplicate Commands**: PowerShell fails to execute identical consecutive commands.

**Workaround**: Enable the "PowerShell counter workaround" setting and set a terminal command delay of 150ms.

### Incomplete Terminal Output

**Issue**: VSCode may not capture complete command output.

**Workaround**: Close and reopen the terminal, then run the command again.

## Troubleshooting Resources

- [VSCode Terminal Output Issue #237208](https://github.com/microsoft/vscode/issues/237208)
- [VSCode Terminal Integration Test Repository](https://github.com/KJ7LNW/vsce-test-terminal-integration)
- [Roo Code Shell Integration Architecture PR](https://github.com/RooVetGit/Roo-Code/pull/1365)

## Support

If you're still having issues:

1. Check [Roo Code GitHub Issues](https://github.com/RooVetGit/Roo-Code/issues)
2. Create a new issue with:
   - OS and VSCode version
   - Shell type
   - Steps to reproduce
   - Error messages

For additional help, join our [Discord](https://discord.gg/roocode).