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

Execute the interactive installation script from your documentation repository root:

```bash
./submodules/doc-ai-prompts/install.sh
```

Alternatively, you can run it from inside the submodule directory:

```bash
cd submodules/doc-ai-prompts
./install.sh
```

You can also explicitly pass the path to the target documentation repository:

```bash
./install.sh /path/to/doc-repo
```

## 3. What Gets Installed

The script interactively asks for confirmation before creating or overwriting any files or directories. It deploys the following to the root of your documentation repository:

* **`AGENTS.md`**: Core agent instructions and guidelines referencing the style guide and skills.
* **`GEMINI.md`**: Symlink pointing to `AGENTS.md` for Gemini Code Assist.
* **`.agents`**: Symlink pointing to the submodule's `.agents` directory.
* **`.github/copilot-instructions.md`**: GitHub Copilot instructions installed as a regular file (dereferenced from the style guide so Copilot can read it without traversing submodules).
