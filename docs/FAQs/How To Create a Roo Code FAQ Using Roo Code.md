## **How to Create a New FAQ for Roo Code**

**Version:** 1.1.0
**Author:** mkearl - discord

**Last Updated:** February 4, 2025

## **FAQ Creation**

### **How do I create and submit a new FAQ?**

Creating a new FAQ is simple. You can directly create a new markdown file under the `docs/FAQs` directory and follow the format below.

### **What should I do after creating my FAQ file?**

Once your FAQ file is created, follow these steps to refine and submit it:

#### **1. Review and Adjust Formatting**

Ensure that your FAQ follows the standard Roo Code format:

* Use **clear and concise** language.
* Maintain **consistent** heading styles.
* Apply **proper markdown** formatting for readability.

#### **2. Verify Content Accuracy**

* Ensure all **information is correct** and up-to-date.
* Double-check any **examples, links, or images** used.
* Validate that the FAQ **flows logically** and is easy to understand.
* Add your images and videos to the Assets directory
  * Make sure your have clear names that link your images to your faq
  * Make sure your images are not copywrite protected.
  * Make sure your images are optimised for the web.  .png etc.
  * Make sure you videeos are consise and short but convey a feature or instruction related to your FAQ

### **3. Submit Your FAQ**

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


## Using Roo Code to create the FAQ


1. Use the following prompt example in Roo Code:

   
   1. Create a new markdown file in docs/faqs with the test.md use the FAQ schema @schemas\\faq.schema.json to format the markdown.    My name is John Smith the Title of the FAQ is “How to make a FAQ” Here is the information for the FAQ

      \
      To start something and not finish is a bad thing. .. Use Roo Code to make your coding life better.. … … 

      \

## **Additional Resources**

* [Documentation](#https://docs.roocode.com/)
* [Docs GitHub Repository](#https://github.com/RooVetGit/Roo-Code-Docs)
* [Roo Code Repository](https://github.com/RooVetGit/Roo-Code)

  \

© 2025 Roo Code. All rights reserved.