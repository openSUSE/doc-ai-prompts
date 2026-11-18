---
name: sanitize
description: Update an existing content (selection or whole file) so that it is formally cleaner.
---

# Common Instructions

1. Replace entities / attributes for strings that are matched in the included entity / attribute files.
1. Add IDs to all sections, tables, figures, procedures and examples if the don't exist.
   Update the existing IDs according to the related content.
   All IDs should begin with a specific prefix that characterizes the whole topic.


# AsciiDoc-related Instructions

1. Convert placeholders to uppercase with underscores.

   `<host-name>` to `<HOST_NAME>`
1. Update the type of verbatim blocks that include prompts to 'console'
   * prompts are recognized by `{prompt_...}`
   * replace existing `,bash,` or empty `,,` with `,console,`
   * verify that `subs="+attributtes"` is used in verbatim heaaders where attributes are used
1. Use `link:<URL>[NAME_OF_LINK]` for external links instead of just `<URL>`
1. Use `xref:<ELEMENT_ID>` for internal references instead of `<ELEMENT_ID>`


# DocBook-related Instructions

1. Convert placeholders to uppercase with underscores.

   `<replaceable>host-name</replaceable>` to `<replaceable>HOST_NAME</replaceable>`