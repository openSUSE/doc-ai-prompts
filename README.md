# About
This repository contains AI prompts used by the SUSE documentation team.

# Installation
We recommend cloning the content of this repository as a Git submodule into the root of the repository that holds your documentation files:

`> git submodule add https://github.com/openSUSE/doc-ai-prompts.git ai-prompts/`

**TIP**: to stop reporting changes made within the submodule in the parent repo, run this configuration update:

`> git config submodule.ai-prompts.ignore all`

# Style Guide
The official SUSE Style Guide is located at https://documentation.suse.com/style/current/

The `Style-Guide-onefile.md` file contains a minimal version of the SUSE Style Guide presented as an AI prompts.

Files in the `suse-style-guide` directory contain a simplified version of the SUSE Style Guide divided into multiple topics presented as AI promtps.
They are prefixed with a number that suggests the recommended order of processing.

## Usage: Manual
To use the Style Guide prompts manually, just copy the content of the selected file into an AI coding assistant or other AI-enabled tool.

## Usage: Github Copilot
You can influence the GitHub Copilot to make PR reviews based on the Style Guide AI prompts.
Copilot expects the prompts in the `.github/instructions/` directory as files ending with `*.instructions.md`.
You dont have to copy and rename the prompt files manually - this can be automatized using a pre-commit hook.
To use it, copy the file `tools/pre-commit` to `.git/hooks/pre-commit` and on next commit, the Copioot instructions files will be created automatically.

Then on a GitHub PR page, as the Copilot for review and it will go through the PR changes and comment on their suspect parts.
