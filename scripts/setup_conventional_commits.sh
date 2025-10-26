Aqui está a versão com todos os comentários em inglês:
bash# ═══════════════════════════════════════════════════════════
# Conventional Commits Setup
# ═══════════════════════════════════════════════════════════

echo ""
echo "# ─────────────────────────────────────────────────────"
echo "# Ask about Conventional Commits"
echo "# ─────────────────────────────────────────────────────"
echo ""

# Check if Git repository exists in current directory
if [[ ! -d ".git" ]]; then
    echo "⚠️  No Git repository found in current directory."
    echo ""
    read -p "Do you want to initialize a Git repository? (y/n): " init_git
    
    # If user wants to initialize Git, do it
    if [[ "$init_git" == "y" || "$init_git" == "Y" ]]; then
        git init
        echo "✅ Git repository initialized!"
        echo ""
    else
        # Skip Conventional Commits if user doesn't want Git
        echo "ℹ️  Skipping Conventional Commits (Git repository required)."
        echo ""
        # Continue to next part of setup without exiting
        return 0 2>/dev/null || :
    fi
else
    # Git repository already exists
    echo "✓ Git repository detected"
    echo ""
fi

# Ask user if they want to activate Conventional Commits
read -p "Do you want to activate Conventional Commits for this project? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    echo ""
    echo "📥 Fetching Conventional Commits setup from GitHub..."
    
    # GitHub raw URL for the setup script
    GITHUB_URL="https://raw.githubusercontent.com/aldenirsrv/CLEAN_ARCHITECTURE_GENERATOR/main/scripts/setup_conventional_commits.sh"
    
    # Try to download and execute script from GitHub
    if curl -fsSL "$GITHUB_URL" | bash; then
        echo "✅ Conventional Commits hook installed!"
    else
        # If download fails, show message but continue setup process
        echo "⚠️  Failed to download from GitHub."
        echo "    You can install it manually later by running:"
        echo "    curl -fsSL \"$GITHUB_URL\" | bash"
        echo ""
        echo "ℹ️  Continuing setup process..."
    fi
else
    # User chose not to activate Conventional Commits
    echo "ℹ️  Skipping Conventional Commits setup."
fi

echo ""




## 🎯 Execution flow:

### Scenary 1: Git already exists
```
✓ Git repository detected
Do you want to activate Conventional Commits? (y/n): y
→ Install Conventional Commits
```

### Scenary 2: Git do not exists, user initialize
```
⚠️  No Git repository found
Do you want to initialize a Git repository? (y/n): y
✅ Git repository initialized!

Do you want to activate Conventional Commits? (y/n): y
→ Install Conventional Commits
```

### Scenary 3: Git do not exists, user excuse
```
⚠️  No Git repository found
Do you want to initialize a Git repository? (y/n): n
ℹ️  Skipping Conventional Commits (Git repository required)
→ Continua para próxima parte do setup
```

### Scenary 4: Git already exists, user excuse Conventional Commits
```
✓ Git repository detected
Do you want to activate Conventional Commits? (y/n): n
ℹ️  Skipping Conventional Commits setup
→ Continua para próxima parte do setup
```