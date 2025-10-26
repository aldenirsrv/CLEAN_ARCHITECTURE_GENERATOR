#!/bin/bash

# 🧹 Clean Architecture Project Generator
# This script creates a complete Clean Architecture structure following SOLID principles
# Run this script from your project root directory

set -e  # Exit on error

echo "🚀 Setting up Clean Architecture in current directory"
echo "📂 Location: $(pwd)"
echo ""

# ============================================================================
# 📁 SOURCE CODE STRUCTURE
# ============================================================================
echo "📦 Creating source code structure..."

# 🟠 Domain Layer - Core Business Logic
mkdir -p src/domain/{entities,services,value_objects}

# 🔴 Application Layer - Use Cases & Orchestration
mkdir -p src/application/{interfaces,use_cases,dtos}

# 🔵 Infrastructure Layer - Technical Implementation
mkdir -p src/infrastructure/{repositories,external,config}

# 🟣 Main Layer - Entry Points & Delivery Mechanisms
mkdir -p src/main/{controllers,routes,presenters,middleware,cli}

# ============================================================================
# 🧪 TEST STRUCTURE
# ============================================================================
echo "🧪 Creating test structure..."

# Unit tests (fast, isolated)
mkdir -p tests/unit/{domain,application,infrastructure,main}

# Integration tests (layer interactions)
mkdir -p tests/integration/{api,database,external}

# E2E tests (complete workflows)
mkdir -p tests/e2e

# ============================================================================
# 📂 ADDITIONAL DIRECTORIES
# ============================================================================
echo "📂 Creating additional directories..."

# Data and configuration
mkdir -p {data,config,logs}

# Documentation
mkdir -p docs/{diagrams,guides}

# Scripts
mkdir -p scripts

# ============================================================================
# 📄 PYTHON INITIALIZATION FILES
# ============================================================================
echo "🐍 Creating Python __init__.py files..."

# Create __init__.py in all Python package directories
find src -type d -exec touch {}/__init__.py \;
find tests -type d -exec touch {}/__init__.py \;

# ============================================================================
# 📝 GENERATE README FILES
# ============================================================================
echo "📝 Creating README files..."

# Root README
cat > README.md << 'EOF'
# 🧹 Clean Architecture Project

This project follows **Clean Architecture** and **SOLID** principles.

## 🗂️ Project Structure
```
src/
 ├── domain/                 # 🟠 Core Business Logic
 │   ├── entities/           # Business objects with identity and lifecycle
 │   ├── services/           # Domain operations and workflows
 │   └── value_objects/      # Immutable, identity-less values
 │
 ├── application/            # 🔴 Use Cases & Orchestration
 │   ├── interfaces/         # Port definitions (repositories, services)
 │   ├── use_cases/          # Business workflows and orchestration
 │   └── dtos/               # Data Transfer Objects for boundaries
 │
 ├── infrastructure/         # 🔵 Technical Implementation
 │   ├── repositories/       # Data persistence implementations
 │   ├── external/           # Third-party services, APIs, messaging
 │   └── config/             # Framework setup, dependency injection
 │
 └── main/                   # 🟣 Entry Points & Delivery Mechanisms
     ├── controllers/        # HTTP/API request handlers
     ├── routes/             # Route definitions and middleware
     ├── presenters/         # Response formatting and view models
     ├── middleware/         # Authentication, logging, error handling
     └── cli/                # Command-line interface commands
```

**Layer Dependencies (Dependency Rule):**
```
main/ ──→ infrastructure/ ──→ application/ ──→ domain/
 🟣           🔵                 🔴             🟠

Outer layers depend on inner layers, never the reverse.
```

## 🚀 Getting Started

1. Install dependencies: `pip install -r requirements.txt`
2. Run tests: `pytest tests/`
3. Start application: `python -m src.main`

EOF