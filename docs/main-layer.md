## 🗂️ Main Layer: Entry Points & Delivery Mechanisms

The main layer (also called presentation or interface adapters) is the outermost layer that handles communication with the external world. It contains **controllers, routes, CLI commands, and API endpoints** that receive requests, delegate to use cases, and format responses. This layer depends on all other layers.

### Key Principles

The main layer serves as the entry point for all external interactions with your application.

**It is:**
- **Framework-specific** – Contains web frameworks, CLI libraries, or GUI code
- **Thin** – Minimal logic, mostly delegation to use cases
- **Adapter-focused** – Converts external data formats to application DTOs
- **User-facing** – Handles HTTP, GraphQL, CLI, WebSockets, or other protocols

### Directory Structure
```
src/
 ├── main/                   
 │   ├── controllers/        # HTTP/API request handlers
 │   ├── routes/             # Route definitions and middleware
 │   ├── presenters/         # Response formatting and view models
 │   ├── middleware/         # Authentication, logging, error handling
 │   └── cli/                # Command-line interface commands
```

### 🟣 Main Layer: Delivery Mechanisms
![Clean Architecture - Domain Layer](../diagrams/clean_arch_main.mermaid)

### Component Responsibilities

- **Controllers** – Handle HTTP requests, validate input, call use cases, return responses
- **Routes** – Define URL endpoints and map them to controllers
- **Presenters** – Format use case results into JSON, HTML, XML, or other response formats
- **Middleware** – Cross-cutting concerns (auth, logging, rate limiting, CORS)
- **CLI** – Command-line interface for scripts, tasks, and terminal interactions

## Rules

- ✅ Thin controllers that delegate to use cases
- ✅ Request/response handling
- ✅ Dependency injection setup
- ❌ No business logic

### SOLID in Practice

- **Single Responsibility** – Each controller handles one route or resource
- **Open/Closed** – New endpoints added without modifying existing controllers
- **Liskov Substitution** – Different delivery mechanisms (REST, GraphQL) can coexist
- **Interface Segregation** – Controllers depend only on the use cases they need
- **Dependency Inversion** – Controllers depend on application use case interfaces

### Design Guidelines

- **Keep Controllers Thin** – No business logic, only input/output handling
- **Use DTOs** – Convert request data to application DTOs immediately
- **Handle Errors Gracefully** – Translate domain exceptions to appropriate HTTP status codes
- **Validate Early** – Check input format before calling use cases
- **Separate Concerns** – Don't mix routing, validation, and business logic

### Request Flow
```
External Request → Route → Middleware → Controller → Use Case → Presenter → Response
```

### Common Patterns

- **MVC Pattern** – Model-View-Controller for web applications
- **Request/Response Pattern** – Structured input/output objects
- **Decorator Pattern** – Middleware chain for cross-cutting concerns
- **Factory Pattern** – Create controllers with proper dependencies

### 📚 References

- Uncle Bob – [The Clean Architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
- Bixlabs – [An Introduction to Clean Architecture](https://bixlabs.com/clean-architecture/)
- Martin Fowler – [Presentation Layer](https://martinfowler.com/eaaDev/PresentationModel.html)