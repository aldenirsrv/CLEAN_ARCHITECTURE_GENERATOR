#!/bin/bash
set -e

# =========================================
# Setup Project Environment
# =========================================

# Create a virtual environment
python -m venv .venv

# Activate venv
if [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "win32" ]]; then
    source .venv/Scripts/activate   # Windows (Git Bash / PowerShell)
else
    source .venv/bin/activate       # macOS/Linux
fi

# Install dependencies
pip3 install -r requirements.txt

# -----------------------------
# Check installation ### Edit this to check for the specific imports you need
# -----------------------------
python -m openai --version
python -c "import dotenv; print('✅ All imports OK')"

# -----------------------------
# Ask about Conventional Commits
# -----------------------------
### Edit this to ask about the specific features you want to activate  ### TODO: Add more features to the list and add them to the setup_conventional_commits.sh script ###
echo ""
read -p "Do you want to activate Conventional Commits for this project? (y/n): " choice
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
        # Continue to next part of setup without installing hooks
        return 0 2>/dev/null || :
    fi
else
    # Git repository already exists
    echo "✓ Git repository detected"
    echo ""
fi
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
    git status
    echo "ℹ️  Skipping Conventional Commits setup."
fi


echo ""
echo "╔════════════════════════════════════════════════════════╗"
echo "║       🚀 Clean Architecture Setup Generator           ║"
echo "╚════════════════════════════════════════════════════════╝"
echo ""
echo "Select your setup style:"
echo ""
echo "  1️⃣  With Comments (Recommended)"
echo "      └─ Includes detailed explanations in __init__.py files"
echo "      └─ Perfect for learning and documentation"
echo ""
echo "  2️⃣  Simple Structure"
echo "      └─ Minimal setup without comments"
echo "      └─ Clean and straightforward"
echo ""
echo "  ❌  Skip (press 'n')"
echo ""
read -p "Your choice (1/2/n): " choice_clean

case "$choice_clean" in
    1)
        SCRIPT_NAME="clean_arch_with_comment.sh"
        echo ""
        echo "✓ Selected: Setup WITH comments"
        ;;
    2)
        SCRIPT_NAME="clean_arch_simple.sh"
        echo ""
        echo "✓ Selected: Simple setup"
        ;;
    n|N)
        echo ""
        echo "ℹ️  Skipping Clean Architecture scaffolding."
        exit 0
        ;;
    *)
        echo ""
        echo "❌ Invalid choice. Please run again and select 1, 2, or n."
        exit 1
        ;;
esac

echo "📥 Downloading from GitHub..."
echo ""

BASE_URL="https://raw.githubusercontent.com/aldenirsrv/CLEAN_ARCHITECTURE_GENERATOR/main/scripts"
SCRIPT_URL="$BASE_URL/$SCRIPT_NAME"
TEMP_SCRIPT="/tmp/clean_arch_setup_$$.sh"

if curl -fsSL "$SCRIPT_URL" -o "$TEMP_SCRIPT"; then
    chmod +x "$TEMP_SCRIPT"
    echo "🏗️  Running setup script..."
    echo ""
    "$TEMP_SCRIPT"
    rm "$TEMP_SCRIPT"
    echo ""
    echo "✅ Clean Architecture setup completed successfully!"
else
    echo "❌ Failed to download script from GitHub."
    echo "   URL: $SCRIPT_URL"
    echo "   Please check your internet connection and try again."
    exit 1
fi