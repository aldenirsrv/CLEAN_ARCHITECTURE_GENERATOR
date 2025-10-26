## 🗂️ Application Layer: Orchestrating Business Logic

The application layer orchestrates the flow of data to and from the domain layer. It contains **use cases** that implement specific application behaviors by coordinating domain entities and services. This layer is framework-agnostic but depends on the domain layer.

### Key Principles

The application layer serves as the bridge between external requests and domain logic.

**It is:**
- **Use Case Driven** – Each use case represents a single business operation
- **Dependency Rule Compliant** – Depends only on the domain layer, never on infrastructure
- **Interface Segregated** – Defines contracts for external dependencies (ISP)
- **Framework Independent** – Pure business workflows without framework coupling

### Directory Structure
```
src/
 ├── application/            
 │   ├── interfaces/         # Port definitions (repositories, services)
 │   ├── use_cases/          # Business workflows and orchestration
 │   └── dtos/               # Data Transfer Objects for boundaries
```

### 🔴 Application Layer: Use Cases & Orchestration
![Clean Architecture - Domain Layer](../diagrams/clean_arch_application.mermaid)

### Component Responsibilities
- **Interfaces** – Abstract contracts for repositories, external services, and infrastructure (Dependency Inversion Principle)
- **Use Cases** – Single-responsibility business workflows that orchestrate domain logic (SRP)
- **DTOs** – Simple data structures for crossing architectural boundaries, decoupling internal models from external representations

## Rules
- ✅ Depends only on domain layer
- ✅ Defines interfaces for infrastructure
- ✅ Contains business workflows
- ❌ No framework or database code

### SOLID in Practice

- **Single Responsibility** – Each use case handles one business operation
- **Open/Closed** – New features added through new use cases, not modifying existing ones
- **Liskov Substitution** – Interfaces allow implementations to be swapped without breaking behavior
- **Interface Segregation** – Narrow, focused interfaces prevent unnecessary dependencies
- **Dependency Inversion** – Application depends on abstractions (interfaces), not concrete implementations

### 📚 References

- Uncle Bob – [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- Bixlabs – [An Introduction to Clean Architecture](https://bixlabs.com/clean-architecture/)