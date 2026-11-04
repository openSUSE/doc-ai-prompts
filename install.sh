#!/usr/bin/env bash
#
# install.sh - Install AI prompt files from the doc-ai-prompts submodule
#              into the root of the parent documentation repository.
#
set -euo pipefail

# Preserve script stdin on file descriptor 3 for interactive prompts
exec 3<&0

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INSTALL_SRC="$SCRIPT_DIR/install"

if [[ ! -d "$INSTALL_SRC" ]]; then
    echo "Error: Source install directory not found: $INSTALL_SRC" >&2
    exit 1
fi

COPILOT_ONLY=false
NON_INTERACTIVE=false
TARGET_DIR=""

# Parse arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --update-copilot-instructions|-u)
            COPILOT_ONLY=true
            shift
            ;;
        --yes|-y)
            NON_INTERACTIVE=true
            shift
            ;;
        -h|--help)
            echo "Usage: $(basename "$0") [OPTIONS] [TARGET_DIR]"
            echo
            echo "Options:"
            echo "  -u, --update-copilot-instructions  Sync only GitHub Copilot instructions"
            echo "  -y, --yes                          Non-interactive mode (auto-confirm changes)"
            echo "  -h, --help                         Show this help message"
            exit 0
            ;;
        -*)
            echo "Error: Unknown option: $1" >&2
            exit 1
            ;;
        *)
            TARGET_DIR="$1"
            shift
            ;;
    esac
done

ask_yes_no() {
    local prompt="$1"
    local response=""

    if [[ "$NON_INTERACTIVE" == true ]]; then
        return 0
    fi

    while true; do
        read -r -u 3 -p "$prompt [y/N]: " response || true
        case "${response:-n}" in
            [yY]|[yY][eE][sS])
                return 0
                ;;
            [nN]|[nN][oO]|"")
                return 1
                ;;
            *)
                echo "Please answer 'y' (yes) or 'n' (no)."
                ;;
        esac
    done
}

smart_copy() {
    local src="$1"
    local dest="$2"
    local label="$3"

    mkdir -p "$(dirname "$dest")"

    if [[ -f "$dest" ]] && cmp -s "$src" "$dest"; then
        echo "  Up to date: $label"
        return 0
    fi

    if [[ -f "$dest" ]]; then
        if ask_yes_no "File '$label' has changed. Update?"; then
            cp "$src" "$dest"
            echo "  Updated (real file): $label"
        else
            echo "  Skipped: $label"
        fi
    else
        if ask_yes_no "Create file '$label' in target?"; then
            cp "$src" "$dest"
            echo "  Installed (real file): $label"
        else
            echo "  Skipped: $label"
        fi
    fi
}

# 1. Determine target documentation repository root
if [[ -z "$TARGET_DIR" ]]; then
    # Auto-detect target repository root
    SUPERPROJECT="$(git -C "$SCRIPT_DIR" rev-parse --show-superproject-working-tree 2>/dev/null || true)"
    if [[ -n "$SUPERPROJECT" ]]; then
        DETECTED_TARGET="$SUPERPROJECT"
    elif [[ "$PWD" != "$SCRIPT_DIR" && (-d "$PWD/.git" || -f "$PWD/.git") ]]; then
        DETECTED_TARGET="$PWD"
    elif [[ -d "$SCRIPT_DIR/../.git" || -f "$SCRIPT_DIR/../.git" ]]; then
        DETECTED_TARGET="$(cd "$SCRIPT_DIR/.." && pwd)"
    elif [[ -d "$SCRIPT_DIR/../../.git" || -f "$SCRIPT_DIR/../../.git" ]]; then
        DETECTED_TARGET="$(cd "$SCRIPT_DIR/../.." && pwd)"
    else
        DETECTED_TARGET=""
    fi

    if [[ "$NON_INTERACTIVE" == true || "$COPILOT_ONLY" == true ]]; then
        TARGET_DIR="${DETECTED_TARGET:-$PWD}"
    else
        echo "Target documentation repository root:"
        if [[ -n "$DETECTED_TARGET" ]]; then
            read -r -u 3 -p "Enter path [default: $DETECTED_TARGET]: " INPUT_TARGET || true
            TARGET_DIR="${INPUT_TARGET:-$DETECTED_TARGET}"
        else
            read -r -u 3 -p "Enter path: " TARGET_DIR || true
        fi
    fi
fi

# Resolve absolute path of target directory
if [[ -z "$TARGET_DIR" ]]; then
    echo "Error: No target directory specified." >&2
    exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
    if ask_yes_no "Target directory '$TARGET_DIR' does not exist. Create it?"; then
        mkdir -p "$TARGET_DIR"
    else
        echo "Aborting installation." >&2
        exit 1
    fi
fi

TARGET_DIR="$(cd "$TARGET_DIR" && pwd)"
echo "Target repository: $TARGET_DIR"
echo

# Helper function to sync Copilot instruction files
sync_copilot_instructions() {
    local guide_src="$SCRIPT_DIR/.agents/suse-style-guide"
    local copilot_dest="$TARGET_DIR/.github/instructions"

    echo "Synchronizing GitHub Copilot instructions..."

    # Sync single repository-wide instruction file
    local main_guide="$guide_src/Style-Guide-onefile.md"
    if [[ -f "$main_guide" ]]; then
        smart_copy "$main_guide" "$TARGET_DIR/.github/copilot-instructions.md" ".github/copilot-instructions.md"
    fi

    # Sync modular numbered instruction files (e.g. 00-*, 01-*, etc.)
    if [[ -d "$guide_src" ]]; then
        for f in "$guide_src"/[0-9][0-9]-*.md; do
            [[ -f "$f" ]] || continue
            local base="$(basename "$f" .md)"
            smart_copy "$f" "$copilot_dest/${base}.instructions.md" ".github/instructions/${base}.instructions.md"
        done
    fi
}

# If only updating Copilot instructions, run sync and exit
if [[ "$COPILOT_ONLY" == true ]]; then
    sync_copilot_instructions
    echo
    echo "Copilot instructions update complete."
    exit 0
fi

# 2. Process directories first
while IFS= read -r rel_dir; do
    rel_dir="${rel_dir#./}"
    [[ -z "$rel_dir" || "$rel_dir" == "." ]] && continue
    dest_dir="$TARGET_DIR/$rel_dir"
    if [[ ! -d "$dest_dir" ]]; then
        if ask_yes_no "Directory '$rel_dir' does not exist in target. Create '$dest_dir'?"; then
            mkdir -p "$dest_dir"
            echo "  Created directory: $rel_dir"
        else
            echo "  Skipped directory: $rel_dir"
        fi
    fi
done < <(cd "$INSTALL_SRC" && find . -mindepth 1 -type d)

# 3. Process files and symlinks
while IFS= read -r rel_file; do
    rel_file="${rel_file#./}"
    [[ -z "$rel_file" ]] && continue
    src_path="$INSTALL_SRC/$rel_file"
    dest_path="$TARGET_DIR/$rel_file"
    dest_parent="$(dirname "$dest_path")"

    # Skip copilot-instructions.md here as it is handled by sync_copilot_instructions
    base_name="$(basename "$rel_file")"
    if [[ "$base_name" == "copilot-instructions.md" ]]; then
        continue
    fi

    # Ensure parent directory exists
    if [[ ! -d "$dest_parent" ]]; then
        if ask_yes_no "Parent directory for '$rel_file' does not exist. Create '$dest_parent'?"; then
            mkdir -p "$dest_parent"
            echo "  Created directory: $(dirname "$rel_file")"
        else
            echo "  Skipped: $rel_file (parent directory not created)"
            continue
        fi
    fi

    # Check if destination file or symlink already exists
    file_exists=false
    if [[ -e "$dest_path" || -L "$dest_path" ]]; then
        file_exists=true
    fi

    if [[ "$file_exists" = true ]]; then
        # Check if symlink target is identical
        if [[ -L "$src_path" && -L "$dest_path" ]]; then
            if [[ "$(readlink "$src_path")" == "$(readlink "$dest_path")" ]]; then
                echo "  Up to date: $rel_file"
                continue
            fi
        elif [[ -f "$src_path" && -f "$dest_path" ]]; then
            if cmp -s "$src_path" "$dest_path"; then
                echo "  Up to date: $rel_file"
                continue
            fi
        fi

        if ! ask_yes_no "File '$rel_file' already exists in target. Overwrite?"; then
            echo "  Skipped: $rel_file"
            continue
        fi
        rm -f "$dest_path"
    else
        if ! ask_yes_no "Create file '$rel_file' in target?"; then
            echo "  Skipped: $rel_file"
            continue
        fi
    fi

    if [[ -L "$src_path" ]]; then
        # Leave other symlinks as symlinks
        cp -d "$src_path" "$dest_path"
        echo "  Installed (symlink): $rel_file -> $(readlink "$src_path")"
    else
        # Regular file
        cp "$src_path" "$dest_path"
        echo "  Installed: $rel_file"
    fi
done < <(cd "$INSTALL_SRC" && find . -mindepth 1 \( -type f -o -type l \))

# 4. Symlink .agents/ into the documentation repository root
agents_src="$SCRIPT_DIR/.agents"
agents_dest="$TARGET_DIR/.agents"

if [[ "$TARGET_DIR" != "$SCRIPT_DIR" && -d "$agents_src" ]]; then
    if command -v realpath >/dev/null 2>&1; then
        agents_rel_target="$(realpath -m --relative-to="$TARGET_DIR" "$agents_src")"
    else
        agents_rel_target="$(python3 -c "import os; print(os.path.relpath('$agents_src', '$TARGET_DIR'))")"
    fi

    agents_exists=false
    if [[ -e "$agents_dest" || -L "$agents_dest" ]]; then
        agents_exists=true
    fi

    if [[ "$agents_exists" = true ]]; then
        if [[ -L "$agents_dest" && "$(readlink "$agents_dest")" == "$agents_rel_target" ]]; then
            echo "  Up to date: .agents"
        else
            if ask_yes_no "'.agents' already exists in target. Overwrite with symlink to '$agents_rel_target'?"; then
                rm -rf "$agents_dest"
                ln -s "$agents_rel_target" "$agents_dest"
                echo "  Installed (symlink): .agents -> $agents_rel_target"
            else
                echo "  Skipped: .agents"
            fi
        fi
    else
        if ask_yes_no "Create symlink '.agents' -> '$agents_rel_target' in target?"; then
            ln -s "$agents_rel_target" "$agents_dest"
            echo "  Installed (symlink): .agents -> $agents_rel_target"
        else
            echo "  Skipped: .agents"
        fi
    fi
fi

# 5. Synchronize Copilot instructions
sync_copilot_instructions

echo
echo "Installation complete."
