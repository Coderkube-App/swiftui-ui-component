# Clean Architecture SwiftUI Template

This project serves as a production-ready, portfolio-grade reference template for building iOS applications using **SwiftUI**, **Clean Architecture**, **MVVM**, and the **Coordinator Pattern** for decoupled navigation. 

It heavily emphasizes code quality, modularity, and testability, making it ideal for scaling complex applications.

## Architecture Overview

This project is strictly structured around Uncle Bob's Clean Architecture principles. Dependencies always point inwards toward the Domain layer, ensuring business logic remains independent of UI frameworks, databases, or external APIs.

### 1. Domain Layer (The Core)
Contains the core business rules. It has absolutely **no dependencies** on other layers.
- **Entities**: Pure business models (`User`).
- **Use Cases**: Encapsulate specific business rules (`FetchUsersUseCase`).
- **Repository Protocols**: Abstract interfaces defining data operations (`UserRepositoryProtocol`).

### 2. Data Layer
Responsible for fetching and mapping data from various sources (Network, CoreData, etc.) to Domain Entities.
- **Data Sources**: Handle actual data fetching (`RemoteUserDataSource`).
- **DTOs (Data Transfer Objects)**: Models representing raw JSON (`UserDTO`).
- **Repositories**: Concrete implementations of Domain repository protocols (`UserRepositoryImpl`), mapping DTOs to Entities.

### 3. Presentation Layer
Handles the UI and View logic.
- **Screens**: SwiftUI Views representing full pages (`UserListView`).
- **Components**: Reusable SwiftUI UI components (`UserRowView`).
- **ViewModels (MVVM)**: Handle UI state (`ViewState`) and format data for views without directly depending on data layers (they use Use Cases).
- **Navigation (Coordinator)**: Decouples navigation from Views. The `AppCoordinator` uses `NavigationStack` and `NavigationPath` to drive routing, meaning views never explicitly push or present other views.

### 4. Dependency Injection (DI)
- **DI Container**: Centralized factory for creating and injecting dependencies. It safely constructs the complex object graphs needed to pass Repositories into UseCases, and UseCases into ViewModels.

## Folder Structure

```
SwiftUICleanArchitectureApp/
├── App/                  # App Entry Point & Lifecycle
├── Core/                 # Shared Utilities, Constants, and Extensions
├── DI/                   # Dependency Injection Container
├── Data/
│   ├── Models/           # DTOs
│   ├── Repositories/     # Concrete Repositories
│   └── Sources/          # Remote/Local Data Sources
├── Domain/
│   ├── Entities/         # Core Business Models
│   ├── Repositories/     # Repository Protocols
│   └── UseCases/         # Business Logic Orchestration
├── Presentation/
│   ├── Components/       # Reusable UI Elements
│   ├── Navigation/       # Coordinators / Routers
│   ├── Screens/          # Full UI Screens
│   └── ViewModels/       # View State Management
└── project.yml           # XcodeGen configuration
```

## Benefits of this Architecture

1. **Scalability**: New features can be added in isolation without breaking existing functionality.
2. **Testability**: Because every layer communicates via protocols, it is trivial to mock Repositories when testing UseCases, or mock UseCases when testing ViewModels.
3. **Maintainability**: Clear separation of concerns means UI changes don't affect business logic, and API changes only require updates to the Data layer.
4. **Reusability**: The Domain layer can be reused across different targets (e.g., an App Clip, macOS app, or Widget) without modification.

## Setup & Usage

This project utilizes [XcodeGen](https://github.com/yonaskolb/XcodeGen) to programmatically generate the `.xcodeproj` file, avoiding merge conflicts in the project file.

To regenerate the project:
1. Ensure XcodeGen is installed: `brew install xcodegen`
2. Run `xcodegen generate` in the root directory.
3. Open `SwiftUICleanArchitectureApp.xcodeproj`.

## Sample Flow Included
A simple **User List** flow is implemented to demonstrate the architecture:
`UserListView` → `UserListViewModel` → `FetchUsersUseCase` → `UserRepositoryImpl` → `RemoteUserDataSource` → `URLSession`.

## License 
This project is licensed under the Apache-2.0 License.
