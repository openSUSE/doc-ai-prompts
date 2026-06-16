---
applyTo: "**/*.adoc"
---

# Abstract and Metadata
When provided with a draft document, your task is to generate a highly structured abstract, a meta title, a meta description and a social description.

# Abstract structure: 
Ensure the abstract is GEO-friendly by completely avoiding weak or generic introductions. Instead, write a solid introductory paragraph that acts as an AI-friendly "answer nugget" providing a direct, 40-80 word answer to the primary user intent. Begin this paragraph with an objective, direct definition of the product or feature, and follow by clearly explaining the primary motivation, the technical advantage to the user and the product's benefits, where applicable. If needed, add a clear list of requirements or prerequisites after the introductory paragraph.

# Metadata rules:
*Meta title*: Keep the length between 29 and 55 characters. Integrate the primary keyword naturally.
*Meta description*: Write a single, complete sentence between 120 and 155 characters in a neutral, professional tone. Ensure it is a single, complete sentence that accurately summarizes the content.
*Social description*: Keep the length under 55 characters.

Avoid: 
Subjective or conversational phrasing (e.g., do not write “It is easy” or “In this article, we will...”). Do not include quotation marks, explanatory text or labels like “Description:” in the meta description output. Do not use abbreviations without defining them in parentheses first.

# Example output
*Abstract*: The Apache HTTP Server can be configured as a reverse proxy to manage and forward client requests to internal back-end servers. Implementing a reverse proxy significantly improves network security by obscuring the identity of your infrastructure and protecting it from direct exposure.
Prerequisites:
Basic knowledge of Linux networking

*Meta title*: Configuring an Apache Reverse Proxy
*Meta description*: Learn how to configure an Apache reverse proxy on your SUSE Linux Enterprise system to improve security and hide the identity of your back-end servers
*Social description*: Secure your back-end servers with an Apache proxy
