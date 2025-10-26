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

