{\rtf1\ansi\ansicpg1252\cocoartf2870
\cocoatextscaling0\cocoaplatform0{\fonttbl\f0\fswiss\fcharset0 Helvetica;}
{\colortbl;\red255\green255\blue255;}
{\*\expandedcolortbl;;}
\margl1440\margr1440\vieww11520\viewh8400\viewkind0
\pard\tx720\tx1440\tx2160\tx2880\tx3600\tx4320\tx5040\tx5760\tx6480\tx7200\tx7920\tx8640\pardirnatural\partightenfactor0

\f0\fs24 \cf0 # TaskPulse (iOS)\
\
TaskPulse es una aplicaci\'f3n nativa para iOS orientada a la gesti\'f3n y seguimiento de tareas diarias, construida bajo est\'e1ndares de arquitectura limpia y dise\'f1o modular en UIKit.\
\
---\
\
## \uc0\u55357 \u57056 \u65039  Tech Stack & Herramientas\
\
- **Lenguaje:** Swift 5+\
- **UI Framework:** UIKit (100% Programmatic UI / No Storyboards)\
- **Arquitectura:** MVVM-R (Model-View-ViewModel-Router) + Builder Pattern\
- **Persistencia:** UserDefaults (Configuraciones) & Core Data (Persistencia local)\
- **Frameworks Nativos:** `LocalAuthentication` (Biometr\'eda), `Combine` / `Closures`\
- **Control de Versiones:** Git / GitFlow (GitHub & Sourcetree)\
\
---\
\
## \uc0\u55357 \u56528  Arquitectura del Proyecto\
\
El proyecto implementa un desacoplamiento estricto por capas y modularizaci\'f3n mediante carpetas, garantizando la navegabilidad del c\'f3digo y facilitando las pruebas unitarias:\
\
- **Core:** Extensiones de UI, constantes globales y utilidades reutilizables.\
- **Services:** Capa de servicios independientes (Autenticaci\'f3n biom\'e9trica, persistencia, red).\
- **Modules:** M\'f3dulos de pantalla aut\'f3nomos instanciados mediante el patr\'f3n Builder.\
  - `View`: \'danicamente responsable de la renderizaci\'f3n visual y gesti\'f3n de `UIAlertController`.\
  - `ViewModel`: L\'f3gica de presentaci\'f3n pura (desacoplada de UIKit) mediante *bindings* basados en closures.\
  - `Router`: Manejo aislado de la navegaci\'f3n de la pantalla.\
  - `Builder`: Encargado del ensamblaje e inyecci\'f3n de dependencias del m\'f3dulo.\
\
---\
\
## \uc0\u55357 \u56594  Reglas de Negocio Destacadas\
\
### Autenticaci\'f3n Biom\'e9trica (Face ID / Touch ID)\
- Control del ciclo de vida del servicio v\'eda `LocalAuthentication`.\
- **Flujo de primer inicio:** La autenticaci\'f3n biom\'e9trica requiere de un inicio de sesi\'f3n manual exitoso previo en el dispositivo (`hasLoggedInBeforeKey`).\
- Intercepci\'f3n de errores en la capa de presentaci\'f3n mediante alertas nativas si la biometr\'eda no est\'e1 disponible o el usuario no cumple los criterios de primer inicio.\
\
---\
\
## \uc0\u55357 \u56513  Estructura del Repositorio\
\
```text\
TaskPulse/\
\uc0\u9500 \u9472 \u9472  App/\
\uc0\u9474    \u9500 \u9472 \u9472  AppDelegate.swift\
\uc0\u9474    \u9492 \u9472 \u9472  SceneDelegate.swift\
\uc0\u9500 \u9472 \u9472  Core/\
\uc0\u9474    \u9500 \u9472 \u9472  Constants/\
\uc0\u9474    \u9492 \u9472 \u9472  Extensions/\
\uc0\u9500 \u9472 \u9472  Services/\
\uc0\u9474    \u9492 \u9472 \u9472  BiometricAuth/\
\uc0\u9492 \u9472 \u9472  Modules/\
    \uc0\u9492 \u9472 \u9472  Login/\
        \uc0\u9500 \u9472 \u9472  LoginBuilder.swift\
        \uc0\u9500 \u9472 \u9472  LoginRouter.swift\
        \uc0\u9500 \u9472 \u9472  LoginViewController.swift\
        \uc0\u9492 \u9472 \u9472  LoginViewModel.swift}