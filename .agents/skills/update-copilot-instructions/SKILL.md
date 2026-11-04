---
name: update-copilot-instructions
description: Synchronize GitHub Copilot instructions non-interactively using the install script.
---

# TASK: Update GitHub Copilot Instructions

Execute the prompt installation script in non-interactive Copilot sync mode to update Copilot instruction files (`.github/copilot-instructions.md` and `.github/instructions/*.instructions.md`) in the repository root without requiring path or file confirmations.

## Instructions

1. Run the installation script non-interactively from the documentation repository root:
   ```bash
   ./submodules/doc-ai-prompts/install.sh -u -y
   ```
2. Verify that the files were created or updated in `.github/copilot-instructions.md` and `.github/instructions/`.
3. Report the synchronization status and any updated files to the user.

