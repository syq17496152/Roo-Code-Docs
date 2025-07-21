---
sidebar_label: 连接AI提供商
---
import KangarooIcon from '@site/src/components/KangarooIcon';

# 连接您的第一个AI提供商

Roo Code 需要从AI模型提供商获取API密钥才能运行。我们推荐以下选项来访问功能强大的 **Claude 3.7 Sonnet** 模型：

- **OpenRouter (推荐):** 通过单个API密钥访问多个AI模型。适合快速开始且设置最小化。[查看定价](https://openrouter.ai/models?order=pricing-low-to-high)。
- **Anthropic:** 直接访问Claude模型。需要API访问权限，且可能根据您的使用层级有[速率限制](https://docs.anthropic.com/en/api/rate-limits#requirements-to-advance-tier)。详情请查看 [Anthropic定价页面](https://www.anthropic.com/pricing#anthropic-api)。

---

## 获取API密钥

### 选项1: LLM路由器

LLM路由器允许您通过一个API密钥访问多个AI模型，简化了成本管理和模型切换。它们通常提供[有竞争力的定价](https://openrouter.ai/models?order=pricing-low-to-high)。

#### OpenRouter

1. 访问 [openrouter.ai](https://openrouter.ai/)
2. 使用您的Google或GitHub账户登录
3. 导航到 [API密钥页面](https://openrouter.ai/keys) 并创建新密钥
4. 复制您的API密钥 - 您需要在Roo Code设置中使用它

<img src="/img/connecting-api-provider/connecting-api-provider-4.png" alt="OpenRouter API密钥页面" width="600" />

*OpenRouter仪表盘中的"创建密钥"按钮。创建后命名您的密钥并复制它。*

#### Requesty

1. 访问 [requesty.ai](https://requesty.ai/)
2. 使用您的Google账户或电子邮件登录
3. 导航到 [API管理页面](https://app.requesty.ai/api-keys) 并创建新密钥
4. **重要：** 立即复制您的API密钥，因为它不会再次显示

<img src="/img/connecting-api-provider/connecting-api-provider-7.png" alt="Requesty API管理页面" width="600" />

*Requesty API管理页面中的"创建API密钥"按钮。立即复制您的密钥 - 它只显示一次。*

### 选项2: 直接提供商

对于直接访问其原始提供商的特定模型，具有完整功能和能力的访问权限：

#### Anthropic

1. 访问 [console.anthropic.com](https://console.anthropic.com/)
2. 注册账户或登录
3. 导航到 [API密钥部分](https://console.anthropic.com/settings/keys) 并创建新密钥
4. **重要：** 立即复制您的API密钥，因为它不会再次显示

<img src="/img/connecting-api-provider/connecting-api-provider-5.png" alt="Anthropic控制台API密钥部分" width="600" />

*Anthropic控制台API密钥部分中的"创建密钥"按钮。命名您的密钥，设置过期时间，并立即复制它。*

#### OpenAI

1. 访问 [platform.openai.com](https://platform.openai.com/)
2. 注册账户或登录
3. 导航到 [API密钥部分](https://platform.openai.com/api-keys) 并创建新密钥
4. **重要：** 立即复制您的API密钥，因为它不会再次显示

<img src="/img/connecting-api-provider/connecting-api-provider-6.png" alt="OpenAI API密钥页面" width="600" />

*OpenAI平台中的"创建新密钥"按钮。命名您的密钥，并在创建后立即复制。*

---

## 在VS Code中配置Roo Code

一旦您有了API密钥：

1. 通过点击VS Code活动栏中的Roo Code图标 (<KangarooIcon />) 打开Roo Code侧边栏
2. 在欢迎屏幕中，从下拉菜单中选择您的API提供商
3. 将您的API密钥粘贴到相应的字段中
4. 选择您的模型：
   - 对于 **OpenRouter**：选择 `anthropic/claude-3.7-sonnet` ([模型详情](https://openrouter.ai/anthropic/claude-3.7-sonnet))
   - 对于 **Anthropic**：选择 `claude-3-7-sonnet-20250219` ([模型详情](https://www.anthropic.com/pricing#anthropic-api))

:::info 模型选择建议
我们强烈推荐 **Claude 3.7 Sonnet** 以获得最佳体验 - 它通常"开箱即用"。Roo Code已经针对此模型的功能和指令遵循行为进行了广泛优化。

选择替代模型是一个高级功能，会引入复杂性。不同模型在遵循工具指令、解析格式和多步骤操作中保持上下文的能力上有显著差异。如果您确实要尝试其他模型，请选择专为结构化推理和工具使用设计的模型。
:::

5. 点击"开始！"保存您的设置并开始使用Roo Code