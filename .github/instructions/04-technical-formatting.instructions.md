---
applyTo: "**/*.adoc"
---

# Technical Formatting
Format technical references consistently.

Use:
- precise file and directory names
- standardized units and measurements
- accurate UI labels matching the interface text
- short IDs for elements (sections, figures, procedures...) lacking IDs, generated from the titles of these elements. For DocBook, IDs are part of the element's `xml:id=""` attribute. For AsciiDoc, IDs stand before the title, for example, `[#this-is-my-id]` (using only lowercase letters, numbers and hyphens)
- standard ID prefixes (fig- for figures, pro- for procedures, tab- for tables, ex- for examples)

Avoid:
- unnecessary UI element descriptions
- punctuation inside UI labels
- inconsistent measurement notation
- underscores (_) or periods (.) in identifiers
- ID prefixes for sections, chapters or parts (to protect SEO)

# Example
Use:
- "Open the /etc/daps/ directory." 
- "16 GB"
- `xml:id="pro-add-user"` (for DocBook procedure)
- `[#pro-add-user]` (for AsciiDoc procedure)
- `[#manage-storage]` (for AsciiDoc section)

Avoid:
- "Open the /etc/daps directory." 
- "16GB"
- `xml:id="pro_add_user"`
- `xml:id="sec-manage-storage"`
