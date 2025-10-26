Aqui está o script refatorado com melhorias e mais funcionalidades:
bash#!/bin/bash
# =========================================================
# Setup Git commit-msg hook to enforce Conventional Commits
# =========================================================

set -e

HOOK_DIR=".git/hooks"
HOOK_FILE="$HOOK_DIR/commit-msg"

echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║     🚀 Conventional Commits Hook Installer            ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""

# =========================================================
# Validate Git Repository
# =========================================================
if [ ! -d ".git" ]; then
  echo "❌ Error: Not a Git repository"
  echo "   No .git directory found in: $(pwd)"
  echo ""
  echo "💡 Solution: Initialize Git first"
  echo "   Run: git init"
  exit 1
fi

echo "✓ Git repository detected"
echo ""

# =========================================================
# Check for Existing Hook
# =========================================================
if [ -f "$HOOK_FILE" ]; then
  echo "⚠️  Warning: commit-msg hook already exists"
  echo ""
  read -p "Overwrite existing hook? (y/n): " overwrite
  
  if [[ ! "$overwrite" =~ ^[Yy]$ ]]; then
    echo "ℹ️  Installation cancelled."
    exit 0
  fi
  
  # Backup existing hook
  BACKUP_FILE="$HOOK_FILE.backup.$(date +%Y%m%d_%H%M%S)"
  cp "$HOOK_FILE" "$BACKUP_FILE"
  echo "✓ Existing hook backed up to: $BACKUP_FILE"
  echo ""
fi

# =========================================================
# Create Hook Directory
# =========================================================
mkdir -p "$HOOK_DIR"

# =========================================================
# Install commit-msg Hook
# =========================================================
echo "📝 Installing commit-msg hook..."

cat > "$HOOK_FILE" <<'HOOK'
#!/bin/sh
# =========================================================
# Enforce Conventional Commit Style
#
# Format: <type>(<scope>): <description>
#
# Required Format:
#   <type>: <description>                    ✅ Valid
#   <type>(<scope>): <description>           ✅ Valid
#
# Types (required):
#   feat     → A new feature
#   fix      → A bug fix
#   docs     → Documentation only changes
#   style    → Changes that do not affect code meaning
#              (formatting, missing semi-colons, etc.)
#   refactor → Code change that neither fixes a bug nor adds a feature
#   perf     → Performance improvements
#   test     → Adding or correcting tests
#   chore    → Maintenance tasks (build, tooling, configs, etc.)
#   ci       → CI/CD configuration changes
#   build    → Build system or external dependencies
#   revert   → Revert a previous commit
#
# Special Keywords:
#   BREAKING CHANGE: in body or footer → Major version bump
#   ! after type/scope → Breaking change indicator
#
# Examples:
#   feat(auth): add OAuth2 integration
#   fix(api): handle null pointer exception
#   docs(readme): update installation guide
#   feat!: remove deprecated endpoint
#   fix(ui): button alignment on mobile
#
# =========================================================

commit_msg_file=$1
commit_msg=$(cat "$commit_msg_file")

# Skip merge commits
if echo "$commit_msg" | grep -qE "^Merge (branch|pull request)"; then
  exit 0
fi

# Conventional Commits regex (with optional breaking change indicator)
regex="^(feat|fix|docs|style|refactor|perf|test|chore|ci|build|revert)(\([a-z0-9_-]+\))?!?: .+"

if ! echo "$commit_msg" | grep -qE "$regex"; then
  echo ""
  echo "╔════════════════════════════════════════════════════════╗"
  echo "║  ❌ Commit Rejected - Invalid Format                  ║"
  echo "╚════════════════════════════════════════════════════════╝"
  echo ""
  echo "Your commit message:"
  echo "  \"$commit_msg\""
  echo ""
  echo "Required format:"
  echo "  <type>(<scope>): <description>"
  echo ""
  echo "Valid types:"
  echo "  feat, fix, docs, style, refactor, perf, test, chore, ci, build, revert"
  echo ""
  echo "✅ Valid examples:"
  echo "  feat(auth): add login validation"
  echo "  fix(api): handle null values in response"
  echo "  docs(readme): update setup instructions"
  echo "  style(css): fix button alignment"
  echo "  refactor(core): simplify data pipeline"
  echo "  perf(query): optimize DB lookup speed"
  echo "  test(orders): add integration tests"
  echo "  chore(deps): update dependencies"
  echo "  feat!: breaking change - remove old API"
  echo ""
  echo "❌ Invalid examples:"
  echo "  Added new feature"
  echo "  fixed bug"
  echo "  Update README"
  echo ""
  echo "📚 Learn more: https://www.conventionalcommits.org"
  echo ""
  exit 1
fi

# Optional: Check for minimum description length
description=$(echo "$commit_msg" | sed -E 's/^[^:]+: //')
if [ ${#description} -lt 10 ]; then
  echo ""
  echo "⚠️  Warning: Commit description is too short (minimum 10 characters)"
  echo "   Description: \"$description\""
  echo ""
  exit 1
fi

# Success message
echo "✅ Commit message validated successfully!"
exit 0
HOOK

# =========================================================
# Make Hook Executable
# =========================================================
chmod +x "$HOOK_FILE"

echo "✅ Conventional Commits hook installed successfully!"
echo ""
echo "📍 Hook location: $HOOK_FILE"
echo ""

# =========================================================
# Installation Summary
# =========================================================
echo "╔════════════════════════════════════════════════════════╗"
echo "║              🎉 Installation Complete!                ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "Your commits will now be validated automatically."
echo ""
echo "📋 Quick Reference:"
echo ""
echo "  ✅ Valid commit formats:"
echo "     git commit -m \"feat(api): add new endpoint\""
echo "     git commit -m \"fix(auth): resolve login bug\""
echo "     git commit -m \"docs: update README\""
echo "     git commit -m \"feat!: breaking API change\""
echo ""
echo "  ❌ Invalid formats (will be rejected):"
echo "     git commit -m \"added new endpoint\""
echo "     git commit -m \"fixed bug\""
echo "     git commit -m \"Update README\""
echo ""
echo "💡 Tips:"
echo "   • Scope is optional: feat: description"
echo "   • Use ! for breaking changes: feat!: description"
echo "   • Keep descriptions clear and concise"
echo "   • Use present tense: 'add' not 'added'"
echo ""
echo "📚 Full specification: https://www.conventionalcommits.org"
echo ""

# =========================================================
# Optional: Test the Hook
# =========================================================
read -p "Would you like to test the hook now? (y/n): " test_hook

if [[ "$test_hook" =~ ^[Yy]$ ]]; then
  echo ""
  echo "🧪 Testing hook with sample commits..."
  echo ""
  
  # Test valid commit
  echo "feat(test): sample commit for testing" | "$HOOK_FILE" /dev/stdin && \
    echo "  ✅ Valid format accepted" || \
    echo "  ❌ Test failed"
  
  echo ""
  
  # Test invalid commit
  echo "Added new feature" | "$HOOK_FILE" /dev/stdin 2>&1 && \
    echo "  ❌ Invalid format should be rejected" || \
    echo "  ✅ Invalid format correctly rejected"
  
  echo ""
fi

echo "🎯 Setup complete! Happy committing! 🚀"
echo ""