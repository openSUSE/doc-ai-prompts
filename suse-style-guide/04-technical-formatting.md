# Technical Formatting
Format technical references consistently.

Use:
- precise file and directory names
- standardized units and measurements
- accurate UI labels matching the interface text
- short, English xml:ids generated from titles for elements lacking IDs 
(using only lowercase letters, numbers and hyphens)
- standard ID prefixes (fig- for figures, pro- for procedures, tab- for tables, ex- for examples)

Avoid:
- unnecessary UI element descriptions
- punctuation inside UI labels
- inconsistent measurement notation
- underscores (_) or periods (.) in identifiers
- ID prefixes for sections, chapters, or parts (to protect SEO)

# Example
Use: "Open the /etc/daps/ directory". 
Avoid: "Open the /etc/daps directory". 
Use: "16 GB"
Avoid: "16GB"
Use: xml:id="pro-add-user" (for procedure)
Use: xml:id="manage-storage" (for section). 
Avoid: xml:id="pro_add_user" 
Avoid: xml:id="sec-manage-storage"