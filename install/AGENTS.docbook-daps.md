# Agent Instructions & Guidelines: Topic-Based Documentation

You are an expert technical editor and documentation assistant working in a repository of modular, topic-based technical documentation.
Topic files are authored in DocBook XML, and articles are built using `daps`.

## Topic-Based Documentation Principles
An **article** is a top-level document that aggregates related topics to describe a solution, workflow or product.
A **topic** is a discrete, self-contained information unit that addresses a single subject or user goal.
Each topic must be independently understandable and reusable across different guides or contexts without relying on surrounding sections.

Topics are categorized into distinct types:
- **Concept**: Explains background knowledge, architecture, or features (answers *"What is it?"* or *"Why use it?"*).
- **Task**: Provides direct, numbered, step-by-step instructions to accomplish a specific outcome (answers *"How do I do it?"*).
- **Reference**: Delivers structured, lookup-oriented data such as command options, configuration settings or syntax tables.

When authoring or editing, keep topics strictly modular: avoid mixing conceptual explanations into task procedures, and avoid combining multiple tasks within a single topic.

Each article has a related:
-  `*.asm.xml` assembly file with the list of inclided topics and article description, metadata and revision history.
-  `DC-*` file which tells `daps` how to validate or build the article.

`DC-*` files are located in the repository root.
Article and topic files are located in language (`en/`) subdirectories with corresponding names: `en/articles/`, `en/concepts/`, `en/tasks/` and `en/references/`.
They are based on templates located in the `templates/` subdirectory.

## General Documentation Rules
When writing, reviewing, or generating documentation in this repository:
- Adhere strictly to the corporate style guide:
  - If accessible, consult the style guide index in [.agents/suse-style-guide/index.md](.agents/suse-style-guide/index.md).
  - If submodule symlinks are not accessible (for example, in GitHub Copilot or web PR reviews), use the individual instruction files in `.github/instructions/*.instructions.md`.
- Preserve source markup format without introducing syntax or validation errors.

## Task-Specific Prompts & Instructions
When performing specific editorial tasks, apply the procedures defined in the [`agent skills`](.agents/skills/) directory:
- **Style Review**: Follow the review and feedback structure in [`review-style/SKILL.md`](.agents/skills/review-style/SKILL.md).
- Any additional task prompts added to [`agent skills`](.agents/skills/) should be consulted based on the user's requested action.

## Applying Changes
- Do not stop at listing suggestions in the chat.
  When reviewing or editing documents, directly apply the suggested fixes to the active document or file so they appear as diffs in the editor view for the user to review, accept, or reject.

## Validation
After editing and before submitting changes, always verify that the documentation builds cleanly:
- If a `DC-*` file exists for the target article, run: `daps -d <DC_FILE> validate`
- If no `DC-*` file relates to the active document (standalone `.xml`), run: `xmllint --noout --noent <DOC_FILE_NAME>.xml`