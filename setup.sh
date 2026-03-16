#!/usr/bin/env bash
set -euo pipefail

# ─────────────────────────────────────────────
# claude-code-kit setup
# Creates symlinks for commands and global CLAUDE.md
# Safe to re-run — idempotent
# ─────────────────────────────────────────────

KIT_DIR="$(cd "$(dirname "$0")" && pwd)"
CLAUDE_DIR="$HOME/.claude"
COMMANDS_DIR="$CLAUDE_DIR/commands"
GLOBAL_CLAUDE="$CLAUDE_DIR/CLAUDE.md"

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m'

# ─────────────────────────────────────────────
# Status command
# ─────────────────────────────────────────────
if [[ "${1:-}" == "status" ]]; then
    echo ""
    echo -e "${BOLD}claude-code-kit status${NC}"
    echo "======================"

    needs_fix=0

    # Check global CLAUDE.md
    if [[ -L "$GLOBAL_CLAUDE" ]] && [[ "$(readlink "$GLOBAL_CLAUDE")" == "$KIT_DIR/global-claude.md" ]]; then
        echo -e "  Global CLAUDE.md    ${GREEN}✓ linked${NC}"
    elif [[ -f "$GLOBAL_CLAUDE" ]]; then
        echo -e "  Global CLAUDE.md    ${YELLOW}⚠ exists but not linked to kit${NC}"
        needs_fix=$((needs_fix + 1))
    else
        echo -e "  Global CLAUDE.md    ${RED}✗ not linked${NC}"
        needs_fix=$((needs_fix + 1))
    fi

    # Check commands
    for cmd_file in "$KIT_DIR"/commands/*.md; do
        cmd_name="$(basename "$cmd_file" .md)"
        target="$COMMANDS_DIR/$cmd_name.md"
        if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$cmd_file" ]]; then
            echo -e "  commands/$cmd_name $(printf '%*s' $((18 - ${#cmd_name})) '')${GREEN}✓ linked${NC}"
        else
            echo -e "  commands/$cmd_name $(printf '%*s' $((18 - ${#cmd_name})) '')${RED}✗ not linked${NC}"
            needs_fix=$((needs_fix + 1))
        fi
    done

    echo ""
    if [[ $needs_fix -eq 0 ]]; then
        echo -e "  ${GREEN}All good. Nothing to do.${NC}"
    else
        echo -e "  ${YELLOW}${needs_fix} item(s) need linking. Run: ${BOLD}./setup.sh${NC}"
    fi
    echo ""
    exit 0
fi

# ─────────────────────────────────────────────
# Install
# ─────────────────────────────────────────────
echo ""
echo -e "${BOLD}claude-code-kit setup${NC}"
echo "======================"

# Ensure directories exist
mkdir -p "$COMMANDS_DIR"

linked=0
skipped=0
warned=0

link_file() {
    local source="$1"
    local target="$2"
    local label="$3"

    if [[ -L "$target" ]] && [[ "$(readlink "$target")" == "$source" ]]; then
        echo -e "  ${CYAN}skip${NC}  $label (already linked)"
        skipped=$((skipped + 1))
    elif [[ -f "$target" ]]; then
        echo -e "  ${YELLOW}warn${NC}  $label exists and is not a kit symlink — skipping"
        echo -e "        To fix: rm \"$target\" && ./setup.sh"
        warned=$((warned + 1))
    else
        ln -s "$source" "$target"
        echo -e "  ${GREEN}link${NC}  $label"
        linked=$((linked + 1))
    fi
}

# Global CLAUDE.md
link_file "$KIT_DIR/global-claude.md" "$GLOBAL_CLAUDE" "Global CLAUDE.md → ~/.claude/CLAUDE.md"

# Commands
for cmd_file in "$KIT_DIR"/commands/*.md; do
    cmd_name="$(basename "$cmd_file")"
    link_file "$cmd_file" "$COMMANDS_DIR/$cmd_name" "commands/$cmd_name"
done

echo ""
echo -e "  Done: ${GREEN}$linked linked${NC}, ${CYAN}$skipped unchanged${NC}, ${YELLOW}$warned warnings${NC}"

if [[ $warned -gt 0 ]]; then
    echo ""
    echo -e "  ${YELLOW}Some files were skipped because they already exist.${NC}"
    echo -e "  ${YELLOW}Review the warnings above and remove conflicts manually.${NC}"
fi

echo ""
