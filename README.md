# About
This repository contains AI prompts and agent instructions used by the SUSE documentation team.

# Installation
For setup and integration instructions into your documentation repository, see [INSTALL.md](INSTALL.md).

# Style Guide
The official SUSE Style Guide is located at https://documentation.suse.com/style/current/

The `.agents/suse-style-guide/Style-Guide-onefile.md` file contains a minimal version of the SUSE Style Guide presented as AI prompts.

Files in the `.agents/suse-style-guide/` directory contain a simplified version of the SUSE Style Guide divided into multiple topics presented as AI prompts.
They are prefixed with a number that suggests the recommended order of processing.

# Usage

## Manual Usage
To use the Style Guide prompts manually, copy the content of the selected file into an AI coding assistant or other AI-enabled tool.

## Using VS Code / Codium with coding assistants
After following the installation steps in [INSTALL.md](INSTALL.md):

### Running a skill
1. Position the cursor anywhere in the document you want the skill to process. If you only want to target a specific section, select it.
2. Go to the coding assistant chat panel.
3. (Optional) Ensure no unrelated files are pinned in the chat context to keep the task focused on the active file.
4. Invoke the desired skill (for example, `review-style`):
   * For Google Antigravity, enter `/<skill-name>` (for example, `/review-style`).
   * For Google Gemini, type `@<skill-name>` (for example, `@review-style`) and enter the related `SKILL.md` file.

   The coding assistant executes the skill.
   In the panel, you see the reasoning for suggested changes.
   In the file pane, you can either **Accept** or **Reject** individual suggested changes or all of them at once.

### Creating content
Add the following sentence to the end of the prompt you ask Gemini to execute:

`Make sure to follow the rules in @GEMINI.md.`


## GitHub Copilot
You can influence GitHub Copilot to make PR reviews based on the Style Guide prompts.
Copilot expects the prompts in the `.github/copilot-instructions.md` file where a condensed version of the prompts resides.

On a GitHub PR page, ask Copilot for a review and it will go through the PR changes and comment on their suspect parts.
