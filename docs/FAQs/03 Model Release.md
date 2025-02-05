## **How to Create a New FAQ for Roo Code**

**Version:** 1.1.0 **Author:** mkearl - discord

**Last Updated:** February 4, 2025


Q: What is the 03 model release?
A: The 03 model release includes o3-mini-high and o3-mini-low models, designed to improve AI-driven interactions and performance across various use cases.


Q: When will o3-mini-high and o3-mini-low be available?
A: These options are expected in the next update, and users who meet access requirements should see them automatically.


## **Access Issues**

Q: Why do I see "I don’t have access" when trying to use o3-mini-high?
A: Some users have reported seeing this issue despite having the necessary permissions. If you experience this, check your dashboard, refresh your session, or wait for the next update.

Q: Can I use o3-mini on Tier 1 access?
A: It is believed that Tier 3 is the minimum requirement for access, but this is unconfirmed. Some users have tried without success on lower tiers.

Q: Is the OpenAI-compatible API working with this model?
A: Some users have reported that OpenAI-compatible endpoints are not working with the current version of the 03 model. (edited)


## Performance and Findings

**NOTE: Users are finding that 03 in general is currently not performing well with tool calling.**


Q: How does o3-mini compare to other models?
A: Early benchmarks suggest that o3-mini-low underperforms compared to models like DeepSeek and o1. However, further benchmarks are expected.


Q: What about o3-mini’s agentic abilities?
A: It is reported that o3-mini’s agentic abilities are significantly behind Claude 3.5’s capabilities.


Q: Are there any notable issues with responses?
A: Some users have encountered errors like "Unexpected API Response: The language model did not provide any

assistant messages." This has been reported across multiple models.


Q: How does o3-mini compare to other models?
A: Early benchmarks suggest that o3-mini-low underperforms compared to models like DeepSeek and o1.

However, further benchmarks are expected.


Q: What about o3-mini’s agentic abilities?
A: It is reported that o3-mini’s agentic abilities are significantly behind Claude 3.5’s capabilities.


Q: Are there any notable issues with responses?
A: Some users have encountered errors like "Unexpected API Response: The language model did not provide any assistant messages." This has been reported across multiple models.


Q: How does o3-mini perform with structured data inputs?
A: Tests suggest o3-mini-high handles structured JSON and tabular data more effectively than o3-mini-low. Formatting prompts with explicit data structures can improve accuracy.


Q: Are there workarounds for rate limits on OpenRouter? A: Yes, users have reported success by using multiple API keys, request batching, and leveraging secondary model endpoints when limits are reached.


## Development and Debugging

Q: How can I optimize my prompts for o3-mini?

A: Users are discussing strategies, such as tweaking prompt formatting and providing structured context, to improve performance.


Q: Is anyone successfully using Roo Code with O3 through OpenRouter?
A: Some users have reported being able to use Roo Code in ask mode, but encountering an "internal server error" when switching to code mode. The cause of this issue is currently unclear, but it may be related to how OpenRouter  or the model handles requests for different execution modes.

API and Integration


Q: Can I use o3-mini through Requesty Router?
A: Yes, users have reported success using Requesty Router to access the model when direct API access fails.


Q: What are the benefits of OpenRouter compared to other options?
A: OpenRouter supports over 120 models, provides unified API access, better cost control, and improved rate limits.


Q: What’s the latest update on OpenAI-compatible endpoints? A: While partial support exists, ongoing inconsistencies suggest it may not yet be a fully viable alternative for production use.


## **Additional Resources**

* [Documentation](#https://docs.roocode.com/)
* [Docs GitHub Repository](#https://github.com/RooVetGit/Roo-Code-Docs)
* [Roo Code Repository](https://github.com/RooVetGit/Roo-Code)

  \

© 2025 Roo Code. All rights reserved.