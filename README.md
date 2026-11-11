# TaskPulse (iOS)

TaskPulse es una aplicación nativa para iOS orientada a la gestión y seguimiento de tareas diarias, construida bajo estándares de arquitectura limpia y diseño modular en UIKit.

---

## 🛠️ Tech Stack & Herramientas

- **Lenguaje:** Swift 5+
- **UI Framework:** UIKit (100% Programmatic UI / No Storyboards)
- **Arquitectura:** MVVM-R (Model-View-ViewModel-Router) + Builder Pattern
- **Persistencia:** UserDefaults (Configuraciones) & Core Data (Persistencia local)
- **Frameworks Nativos:** `LocalAuthentication` (Biometría), `Combine` / `Closures`
- **Control de Versiones:** Git / GitFlow (GitHub & Sourcetree)

---

## 📐 Arquitectura del Proyecto

El proyecto implementa un desacoplamiento estricto por capas y modularización mediante carpetas, garantizando la navegabilidad del código y facilitando las pruebas unitarias:

- **Core:** Extensiones de UI, constantes globales y utilidades reutilizables.
- **Services:** Capa de servicios independientes (Autenticación biométrica, persistencia, red).
- **Modules:** Módulos de pantalla autónomos instanciados mediante el patrón Builder.
  - `View`: Únicamente responsable de la renderización visual y gestión de `UIAlertController`.
  - `ViewModel`: Lógica de presentación pura (desacoplada de UIKit) mediante *bindings* basados en closures.
  - `Router`: Manejo aislado de la navegación de la pantalla.
  - `Builder`: Encargado del ensamblaje e inyección de dependencias del módulo.

---

## 🔒 Reglas de Negocio Destacadas

### Autenticación Biométrica (Face ID / Touch ID)
- Control del ciclo de vida del servicio vía `LocalAuthentication`.
- **Flujo de primer inicio:** La autenticación biométrica requiere de un inicio de sesión manual exitoso previo en el dispositivo (`hasLoggedInBeforeKey`).
- Intercepción de errores en la capa de presentación mediante alertas nativas si la biometría no está disponible o el usuario no cumple los criterios de primer inicio.

---

## 📁 Estructura del Repositorio

```text
TaskPulse/
├── App/
│   ├── AppDelegate.swift
│   └── SceneDelegate.swift
├── Core/
│   ├── Constants/
│   └── Extensions/
├── Services/
│   └── BiometricAuth/
└── Modules/
    └── Login/
        ├── LoginBuilder.swift
        ├── LoginRouter.swift
        ├── LoginViewController.swift
        └── LoginViewModel.swift
