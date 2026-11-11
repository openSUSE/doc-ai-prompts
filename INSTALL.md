# Installation Guide

To integrate these AI prompts and agent instructions into your documentation repository, add this repository as a Git submodule and run the installation script.

## 1. Add Submodule

In the root directory of your documentation repository, add this repository as a submodule in `submodules/doc-ai-prompts`:

```bash
git submodule add https://github.com/openSUSE/doc-ai-prompts.git submodules/doc-ai-prompts
```

> **Tip:** To prevent Git from reporting changes within the submodule in your documentation repository status, run:
> ```bash
> git config submodule.submodules/doc-ai-prompts.ignore all
> ```

## 2. Run Installation Script

Execute the installation script from your documentation repository root:

```bash
./submodules/doc-ai-prompts/install.sh
```

### Script Options

* **`-u, --update-copilot-instructions`**: Synchronize only the GitHub Copilot instruction files (`.github/copilot-instructions.md` and `.github/instructions/*.instructions.md`) without re-running the full interactive setup.
* **`-y, --yes`**: Non-interactive mode (automatically confirm updates, useful for CI or scripts).
* **`-h, --help`**: Display available options.

You can also pass the path to the target documentation repository explicitly:

```bash
./submodules/doc-ai-prompts/install.sh [OPTIONS] /path/to/doc-repo
```

## 3. What Gets Installed

The script checks for changes before modifying any files. It deploys the following to your documentation repository:

* **`AGENTS.md`**: Core agent instructions and guidelines referencing the style guide and skills.
* **`GEMINI.md`**: Symlink pointing to `AGENTS.md` for Gemini Code Assist.
* **`.agents`**: Symlink pointing to the submodule's `.agents` directory.
* **`.github/instructions/*.instructions.md`**: Modular GitHub Copilot instruction files corresponding to each numbered topic in `.agents/suse-style-guide/`.

## 4. Updating Instructions

When prompt files in the submodule are updated, refresh Copilot instruction files at any time using either:

* **Via AI assistant skill:** Run `/update-copilot-instructions` (or `@update-copilot-instructions`) in your assistant chat.
* **Via command line:**
  ```bash
  ./submodules/doc-ai-prompts/install.sh -u
  ```
