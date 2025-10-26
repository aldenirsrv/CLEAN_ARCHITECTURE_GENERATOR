## 🗂️ Domain Layer: Core Business Logic

The domain layer represents the heart of your application's business logic. It contains **pure**, framework-agnostic code that models your core business concepts and rules. This layer has **no dependencies** on any other layer.

### Key Principles

Entities, services, and value objects represent core business concepts with clear responsibilities.

**They are:**
- **Pure** – No side effects or external dependencies
- **SOLID** – Follow established design principles for maintainability
- **Self-contained** – Encapsulate business rules and validation
- **Framework-agnostic** – Independent of any technical implementation details

### Directory Structure
```
src/
 ├── domain/                 
 │   ├── entities/           # Business objects with identity
 │   ├── services/           # Domain operations and workflows
 │   └── value_objects/      # Immutable, identity-less values
```

### 🟠 Domain Layer: Core Business Logic
![Clean Architecture - Domain Layer](../diagrams/clean_arch_domain_layer.mermaid)

### Component Responsibilities
- **Entities** – Business objects with unique identity and lifecycle (e.g., User, Order, Product)
- **Services** – Complex domain operations that don't naturally belong to a single entity
- **Value Objects** – Immutable objects defined by their attributes, not identity (e.g., Email, Money, DateRange)

## Rules
- ✅ Pure business logic only
- ✅ No framework dependencies
- ✅ No infrastructure concerns
- ❌ Never import from outer layers

### SOLID in Practice

- **Single Responsibility** – Each entity/value object represents one business concept
- **Open/Closed** – Extend behavior through composition, not modification
- **Liskov Substitution** – Derived types maintain behavioral contracts
- **Interface Segregation** – Domain interfaces are focused and minimal
- **Dependency Inversion** – Domain depends on nothing; other layers depend on it

### Design Guidelines

- **No Infrastructure Dependencies** – Never import from infrastructure, application, or external frameworks
- **Rich Domain Models** – Embed business logic within entities, not in services
- **Immutable Value Objects** – Once created, they cannot be modified
- **Ubiquitous Language** – Use business terminology, not technical jargon

### 📚 References

- Uncle Bob – [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- Bixlabs – [An Introduction to Clean Architecture](https://bixlabs.com/clean-architecture/)
- Martin Fowler – [Domain-Driven Design](https://martinfowler.com/bliki/DomainDrivenDesign.html)