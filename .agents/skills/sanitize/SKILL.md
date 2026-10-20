---
name: sanitize
description: Update an existing content so that it is formally cleaner.
---

# Common Instructions

1. Convert placeholders to upper case with underscores.
   a) for AsciiDoc content, <host-name> to <HOST_NAME>
   b) for DocBook content, <replaceable>host-name</replaceable> to <replaceable>HOST_NAME</replaceable>
1. Replace entities / attributes for strings that are matched in the included entity / attribute files.
1. Add IDs to all sections, tables, figures, procedures and examples if the don't exist.
   Update the existing IDs according to the related content.
   All IDs should begin with a specific prefix that characterizes the whole topic.
