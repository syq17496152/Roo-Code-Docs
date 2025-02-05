## **How to Create a New FAQ for Roo Code**

**Version:** 1.1.0
**Author:** Roo - Roo Code
**Last Updated:** February 4, 2025

## **FAQ Creation**

### **How do I create and submit a new FAQ?**

Creating a new FAQ is simple. You can directly create a new markdown file under the `docs/FAQs` directory and follow the format below.

### **What should I do after creating my FAQ file?**

Once your FAQ file is created, follow these steps to refine and submit it:

#### **1\. Review and Adjust Formatting**

Ensure that your FAQ follows the standard Roo Code format:

*   Use **clear and concise** language.
*   Maintain **consistent** heading styles.
*   Apply **proper markdown** formatting for readability.

#### **2\. Verify Content Accuracy**

*   Ensure all **information is correct** and up-to-date.
*   Double-check any **examples, links, or images** used.
*   Validate that the FAQ **flows logically** and is easy to understand.

#### **3\. Submit Your FAQ**

To submit your FAQ, you would typically commit the changes to the repository and create a pull request.  Currently, I do not have the capability to directly create pull requests. You will need to manually submit the changes to the repository.

### **What format should my FAQ follow?**

Your FAQ should adhere to this structure:

```json
{
  "version": "1.0.0",
  "author": {
    "name": "Your Name",
    "email": "your.email@example.com"
  },
  "faqs": [
    {
      "question": "Your Question?",
      "answer": {
        "text": "Your detailed answer."
      },
      "category": "general", 
      "tags": ["relevant", "tags"]
    }
  ],
  "metadata": {
    "footer": {
      "resources": [
        {
          "text": "Documentation",
          "url": "https://docs.roocode.com"
        },
        {
          "text": "GitHub Repository",
          "url": "https://github.com/RooVetGit/Roo-Code"
        },
        {
          "text": "API Reference",
          "url": "https://docs.roocode.com/api"
        }
      ],
      "copyright": "© 2025 Roo Code. All rights reserved."
    }
  }
}
```

## **Additional Resources**

*   [Documentation](#)
*   [GitHub Repository](#)
*   [API Reference](#)

© 2025 Roo Code. All rights reserved.