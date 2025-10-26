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
# 📄 PYTHON INITIALIZATION FILES WITH COMMENTS
# ============================================================================
echo "🐍 Creating Python __init__.py files with layer comments..."

# Root src __init__.py
cat > src/__init__.py << 'EOF'
# 🏗️ Source Code Root - Clean Architecture Implementation
EOF

# Domain Layer
cat > src/domain/__init__.py << 'EOF'
# 🟠 Domain Layer - Core Business Logic (Enterprise Business Rules)
# Contains entities, value objects, and domain services.
# This layer has no dependencies on other layers.
EOF

cat > src/domain/entities/__init__.py << 'EOF'
# 🟠 Domain/Entities - Business objects with identity and lifecycle
EOF

cat > src/domain/services/__init__.py << 'EOF'
# 🟠 Domain/Services - Domain operations and business workflows
EOF

cat > src/domain/value_objects/__init__.py << 'EOF'
# 🟠 Domain/Value Objects - Immutable, identity-less values
EOF

# Application Layer
cat > src/application/__init__.py << 'EOF'
# 🔴 Application Layer - Use Cases & Orchestration (Application Business Rules)
# Contains use cases, ports (interfaces), and DTOs.
# Depends only on the Domain layer.
EOF

cat > src/application/interfaces/__init__.py << 'EOF'
# 🔴 Application/Interfaces - Port definitions (repositories, services, gateways)
EOF

cat > src/application/use_cases/__init__.py << 'EOF'
# 🔴 Application/Use Cases - Business workflows and orchestration logic
EOF

cat > src/application/dtos/__init__.py << 'EOF'
# 🔴 Application/DTOs - Data Transfer Objects for crossing boundaries
EOF

# Infrastructure Layer
cat > src/infrastructure/__init__.py << 'EOF'
# 🔵 Infrastructure Layer - Technical Implementation (Frameworks & Drivers)
# Contains adapters that implement application interfaces.
# Depends on Application and Domain layers.
EOF

cat > src/infrastructure/repositories/__init__.py << 'EOF'
# 🔵 Infrastructure/Repositories - Data persistence implementations
EOF

cat > src/infrastructure/external/__init__.py << 'EOF'
# 🔵 Infrastructure/External - Third-party services, APIs, messaging systems
EOF

cat > src/infrastructure/config/__init__.py << 'EOF'
# 🔵 Infrastructure/Config - Framework setup and dependency injection
EOF

# Main Layer
cat > src/main/__init__.py << 'EOF'
# 🟣 Main Layer - Entry Points & Delivery Mechanisms (Interface Adapters)
# Contains controllers, routes, presenters, and middleware.
# This is the outermost layer that wires everything together.
EOF

cat > src/main/controllers/__init__.py << 'EOF'
# 🟣 Main/Controllers - HTTP/API request handlers
EOF

cat > src/main/routes/__init__.py << 'EOF'
# 🟣 Main/Routes - Route definitions and API endpoints
EOF

cat > src/main/presenters/__init__.py << 'EOF'
# 🟣 Main/Presenters - Response formatting and view models
EOF

cat > src/main/middleware/__init__.py << 'EOF'
# 🟣 Main/Middleware - Authentication, logging, error handling
EOF

cat > src/main/cli/__init__.py << 'EOF'
# 🟣 Main/CLI - Command-line interface commands
EOF

# Tests
cat > tests/__init__.py << 'EOF'
# 🧪 Tests Root - All test suites
EOF

cat > tests/unit/__init__.py << 'EOF'
# 🧪 Unit Tests - Fast, isolated tests for individual components
EOF

cat > tests/unit/domain/__init__.py << 'EOF'
# 🧪 Unit Tests/Domain - Tests for domain entities, value objects, and services
EOF

cat > tests/unit/application/__init__.py << 'EOF'
# 🧪 Unit Tests/Application - Tests for use cases and application logic
EOF

cat > tests/unit/infrastructure/__init__.py << 'EOF'
# 🧪 Unit Tests/Infrastructure - Tests for repositories and external adapters
EOF

cat > tests/unit/main/__init__.py << 'EOF'
# 🧪 Unit Tests/Main - Tests for controllers, routes, and presenters
EOF

cat > tests/integration/__init__.py << 'EOF'
# 🧪 Integration Tests - Tests for layer interactions and system integration
EOF

cat > tests/integration/api/__init__.py << 'EOF'
# 🧪 Integration Tests/API - End-to-end API testing
EOF

cat > tests/integration/database/__init__.py << 'EOF'
# 🧪 Integration Tests/Database - Database interaction testing
EOF

cat > tests/integration/external/__init__.py << 'EOF'
# 🧪 Integration Tests/External - Third-party service integration testing
EOF

cat > tests/e2e/__init__.py << 'EOF'
# 🧪 E2E Tests - Complete user workflow and acceptance tests
EOF

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

echo ""
echo "✅ Clean Architecture structure created successfully!"
echo "📝 All __init__.py files include layer-specific comments"
echo "🎉 You're ready to start developing!"