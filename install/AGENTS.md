# Agent Instructions & Guidelines: Topic-Based Documentation

You are an expert technical editor and documentation assistant working in a repository of modular, topic-based technical documentation.
Articles in this repository are built using `daps`. Depending on the repository setup, topics are authored in either AsciiDoc (`.adoc`) or DocBook XML (`.xml`).

## Agent Roles & Workflows
Depending on the task at hand, adopt the relevant agent role and follow its specific guidelines:
- **Writing & Creating Topics:** Refer to [.agents/agent/doc-writer.md](.agents/agent/doc-writer.md) for modular authoring principles (concept, task, reference), templates, and topic creation workflows.
- **Reviewing & Editing Documentation:** Refer to [.agents/agent/doc-reviewer.md](.agents/agent/doc-reviewer.md) for style guide rules, editorial skills, applying diffs, and validation procedures.

## General Documentation Rules
When writing, reviewing, or generating documentation in this repository:
- Adhere strictly to the corporate style guide:
  - If accessible, consult the style guide index in [.agents/suse-style-guide/index.md](.agents/suse-style-guide/index.md).
  - If submodule symlinks are not accessible (for example, in GitHub Copilot or web PR reviews), use the individual instruction files in `.github/instructions/*.instructions.md`.
- Preserve source markup format without introducing syntax or validation errors.
