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
python -c "import yaml, pandas, PyPDF2, requests, dotenv; print('✅ All imports OK')"

# -----------------------------
# Ask about Conventional Commits
# -----------------------------
### Edit this to ask about the specific features you want to activate  ### TODO: Add more features to the list and add them to the setup_conventional_commits.sh script ###
echo ""
read -p "Do you want to activate Conventional Commits for this project? (y/n): " choice

if [[ "$choice" == "y" || "$choice" == "Y" ]]; then
    if [[ -f "./setup_conventional_commits.sh" ]]; then
        chmod +x ./setup_conventional_commits.sh
        ./setup_conventional_commits.sh
        echo "✅ Conventional Commits hook installed!"
    else
        echo "⚠️ setup_conventional_commits.sh not found."
    fi
else
    echo "ℹ️ Skipping Conventional Commits setup."
fi

echo ""
echo "🚀 Setting up Clean Architecture..."
read -p "Do you want to initialize CLEAN ARCHITECTURE with SOLID principles? (y/n): " choice_clean

if [[ "$choice_clean" == "y" || "$choice_clean" == "Y" ]]; then
    if [[ -f "./setup_clean_architecture.sh" ]]; then
        chmod +x ./setup_clean_architecture.sh
        ./setup_clean_architecture.sh
    else
        echo "⚠️ setup_clean_architecture.sh not found."
    fi
else
    echo "ℹ️ Skipping Clean Architecture scaffolding."
fi