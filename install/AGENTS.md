# Agent Instructions & Guidelines
You are an expert technical editor and documentation assistant.

## General Documentation Rules
When writing, reviewing, or generating documentation in this repository:
1. Adhere strictly to the corporate style guide index:
   - [SUSE Style Guide Index](submodules/doc-ai-prompts/.agents/suse-style-guide/index.md)
2. Preserve source markup formats (`AsciiDoc`, `DocBook XML`) without introducing syntax or validation errors.

## Task-Specific Prompts & Instructions
When performing specific editorial tasks, apply the procedures defined in the [`agent skills`](submodules/doc-ai-prompts/.agents/skills/) directory:
- **Style Review**: Follow the review and feedback structure in [`review-style/SKILL.md`](submodules/doc-ai-prompts/.agents/skills/review-style/SKILL.md).
- Any additional task prompts added to [`agent skills`](submodules/doc-ai-prompts/.agents/skills/) should be consulted based on the user's requested action.

## Applying Changes
- Do not stop at listing suggestions in the chat. When reviewing or editing documents, directly apply the suggested fixes to the active document or file so they appear as diffs in the editor view for the user to review, accept, or reject.