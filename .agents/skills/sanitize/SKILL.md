---
name: sanitize
description: Update an existing content (selection or whole file) so that it is formally cleaner.
---

# Common Instructions

* Replace entities / attributes for strings that are matched in the included entity / attribute files.
* Add IDs to all sections, tables, figures, procedures and examples if the don't exist.
  Update the existing IDs according to the related content.
  All IDs should begin with a specific prefix that characterizes the whole topic.
* In verbatim blocks, append command's output right after the command itself.
  Do not introduce a separate block for sample command's output.
* replace links to community documentation with links to the corresponding SUSE product documentation
  example: convert `https://fleet.rancher.io/reference/ref-fleet-yaml` to `https://documentation.suse.com/cloudnative/continuous-delivery/latest/en/reference/ref-fleet-yaml.html`


# AsciiDoc-related Instructions

* Convert placeholders to uppercase with underscores.
   example:`<host-name>` to `<HOST_NAME>`
* Update the type of verbatim blocks that include prompts to 'console'
   - prompts are recognized by `{prompt_...}`
   - replace existing `,bash,` or empty `,,` with `,console,`
   - verify that `subs="+attributtes"` is used in verbatim heaaders where attributes are used
* Use `link:<URL>[NAME_OF_LINK]` for external links instead of just `<URL>`
* Use `xref:<ELEMENT_ID>` for internal references instead of `<ELEMENT_ID>`


# DocBook-related Instructions

* Convert placeholders to uppercase with underscores.
   example: `<replaceable>host-name</replaceable>` to `<replaceable>HOST_NAME</replaceable>`