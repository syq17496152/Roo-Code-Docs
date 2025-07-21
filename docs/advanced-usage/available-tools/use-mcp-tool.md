# use_mcp_tool

`use_mcp_tool` 工具可与连接的 Model Context Protocol (MCP) 服务器提供的外部工具进行交互。它通过标准化协议扩展 Roo 的功能，提供特定领域的专用功能。

---

## 参数

该工具接受以下参数：

- `server_name` (必填)：提供工具的 MCP 服务器名称
- `tool_name` (必填)：要执行的工具名称
- `arguments` (必填/可选)：包含工具输入参数的 JSON 对象，遵循工具的输入模式。对于不需要输入的工具可能是可选的。

---

## 功能说明

此工具允许 Roo 访问外部 MCP 服务器提供的专用功能。每个 MCP 服务器可以提供多个具有独特能力的工具，将 Roo 的功能扩展到内置功能之外。系统会根据模式验证参数，管理服务器连接，并处理各种内容类型（文本、图像、资源）的响应。

---

## 使用场景

- 当需要核心工具中不可用的专业化功能时
- 当需要执行特定领域操作时
- 当需要集成外部系统或服务时
- 当处理需要特定处理或分析的数据时
- 当需要通过标准化接口访问专有工具时

---

## 主要功能

- 使用 `@modelcontextprotocol/sdk` 库实现标准化的 MCP 协议
- 支持多种传输机制（StdioClientTransport, StreamableHTTPClientTransport 和 SSEClientTransport）
- 在客户端和服务器端使用 Zod 模式验证参数
- 处理多种响应内容类型：文本、图像和资源引用
- 管理服务器生命周期，在服务器代码更改时自动重启
- 提供 "始终允许" 机制以绕过可信工具的批准流程
- 与配套的 `access_mcp_resource` 工具配合使用
- 维护适当的错误跟踪和失败操作处理
- 支持可配置的超时设置（1-3600秒，默认：60秒）
- 允许文件监视器自动检测并重新加载服务器更改

---

## 局限性

- 依赖外部 MCP 服务器可用并已连接
- 仅限于已连接服务器提供的工具
- 不同 MCP 服务器的工具功能各不相同
- 网络问题可能影响可靠性和性能
- 执行前需要用户批准（除非在 "始终允许" 列表中）
- 无法同时执行多个 MCP 工具操作

---

## 服务器配置

MCP 服务器可以在全局或项目级别配置：

- **全局配置**：通过 VS Code 中的 Roo Code 扩展设置进行管理。这些设置适用于所有项目，除非被覆盖。
- **项目级配置**：在项目根目录下的 `.roo/mcp.json` 文件中定义。
 - 这允许项目特定的服务器设置。
 - 如果项目级服务器与全局服务器同名，则优先使用项目级服务器。
 - 由于 `.roo/mcp.json` 可以提交到版本控制中，因此可以简化与团队共享配置。

---

## 工作原理

调用 `use_mcp_tool` 工具时，它遵循以下流程：

1. **初始化和验证**：
   - 系统验证 MCP 集线器是否可用
   - 确认指定的服务器存在且已连接
   - 验证请求的工具在服务器上存在
   - 根据工具的模式定义验证参数
   - 从服务器配置中提取超时设置（默认：60秒）

2. **执行和通信**：
   - 系统选择适当的传输机制：
     - `StdioClientTransport`：用于通过标准I/O与本地进程通信
     - `SSEClientTransport`：用于通过服务器发送事件与HTTP服务器通信
     - `StreamableHTTPClientTransport`：用于通过可流式HTTP事件与HTTP服务器通信
   - 发送包含经验证的服务器名称、工具名称和参数的请求
   - 使用 `@modelcontextprotocol/sdk` 库进行标准化交互
   - 请求执行通过超时处理进行跟踪，以防止操作挂起

3. **响应处理**：
   - 响应可以包括多种内容类型：
     - 文本内容：纯文本响应
     - 图像内容：带MIME类型信息的二进制图像数据
     - 资源引用：访问服务器资源的URI（与 `access_mcp_resource` 配合使用）
   - 系统检查 `isError` 标志以确定是否需要错误处理
   - 结果格式化后显示在 Roo 界面中

4. **资源和错误处理**：
   - 系统使用 WeakRef 模式防止内存泄漏
   - 连续错误计数器跟踪和管理错误
   - 文件监视器监控服务器代码更改并触发自动重启
   - 安全模型要求在执行工具前进行批准，除非在 "始终允许" 列表中

---

## 安全与权限

MCP 架构提供了多项安全特性：

- 默认情况下，执行工具前必须获得用户批准
- 特定工具可以在 "始终允许" 列表中标记为自动批准
- 服务器配置通过 Zod 模式验证确保完整性
- 可配置的超时设置防止操作挂起（1-3600秒）
- 可以通过 UI 启用或禁用服务器连接

---

## 使用示例

- 使用服务器端处理工具分析专用数据格式
- 通过托管在外部服务器上的 AI 模型生成图像或其他媒体
- 执行无需本地实现的复杂领域计算
- 通过受控接口访问专有 API 或服务
- 从专用数据库或数据源检索数据

---

## 使用示例代码

获取天气预报数据并返回文本响应：
```
<use_mcp_tool>
<server_name>weather-server</server_name>
<tool_name>get_forecast</tool_name>
<arguments>
{
  "city": "San Francisco",
  "days": 5,
  "format": "text"
}
</arguments>
</use_mcp_tool>
```

使用返回 JSON 的专用工具分析源代码：
```
<use_mcp_tool>
<server_name>code-analysis</server_name>
<tool_name>complexity_metrics</tool_name>
<arguments>
{
  "language": "typescript",
  "file_path": "src/app.ts",
  "include_functions": true,
  "metrics": ["cyclomatic", "cognitive"]
}
</arguments>
</use_mcp_tool>
```

使用特定参数生成图像：
```
<use_mcp_tool>
<server_name>image-generation</server_name>
<tool_name>create_image</tool_name>
<arguments>
{
  "prompt": "A futuristic city with flying cars",
  "style": "photorealistic",
  "dimensions": {
    "width": 1024,
    "height": 768
  },
  "format": "webp"
}
</arguments>
</use_mcp_tool>
```

通过返回资源引用的工具访问资源：
```
<use_mcp_tool>
<server_name>database-connector</server_name>
<tool_name>query_and_store</tool_name>
<arguments>
{
  "database": "users",
  "type": "select",
  "fields": ["name", "email", "last_login"],
  "where": {
    "status": "active"
  },
  "store_as": "active_users"
}
</arguments>
</use_mcp_tool>
```

无必需参数的工具：
```
<use_mcp_tool>
<server_name>system-monitor</server_name>
<tool_name>get_current_status</tool_name>
<arguments>
{}
</arguments>
</use_mcp_tool>