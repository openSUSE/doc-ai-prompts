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

## Using VS Code or VSCodium with Gemini Code Assist

### Setting up
1. Include this repository as a submodule in your documentation repository.
2. In the repository root, create the following symlinks pointing to files in the submodule:
    1. `ln -s <path_to_submodule_dir>/.gemini`
    2. `ln -s <path_to_submodule_dir>/vscode/workspace.code-workspace`
    3. `ln -s <path_to_submodule_dir>/prompts/review-style.prompt.md`

### Opening the workspace
Open the workspace using the workspace file `workspace.code-workspace`. It contains configuration settings for Gemini Code Assist that avoid conflicting with personal settings in `.vscode/`.

* From the command line: `codium <path_to_repo>/workspace.code-workspace`
* From within the editor: Select **File** > **Open Workspace from File...** and select `<path_to_repo>/workspace.code-workspace`.

### Reviewing
1. Position the cursor anywhere in the document you want to review. If you only want to review a section, select it.
2. Go to the Gemini Code Assist chat panel.
    1. Make sure the context only consists of the current file.
    2. Enter `@review-style.prompt.md`.
    3. Gemini starts the review. In the panel, you see the reasoning for suggested changes. In the file pane, you can either **Accept** or **Reject** suggested changes.

### Creating content
Add the following sentence to the end of the prompt you ask Gemini to execute:

`Make sure to follow the rules in @review-style.prompt.md.`


## Usage: Github Copilot
You can influence the GitHub Copilot to make PR reviews based on the Style Guide AI prompts.
Copilot expects the prompts in the `.github/instructions/` directory as files ending with `*.instructions.md`.
You don't have to copy and rename the prompt files manually - this can be automatized using a pre-commit hook.
To use it, copy the file `tools/pre-commit` to `.git/hooks/pre-commit` and on next commit, the Copiolot instructions files will be created automatically.

Then on a GitHub PR page, as the Copilot for review and it will go through the PR changes and comment on their suspect parts.
