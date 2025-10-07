# Todo App

A comprehensive, modern, and beautifully themed **Flutter ToDo Application** designed to showcase best practices, scalable architecture, rich features, and professional UI/UX. This project demonstrates skills in Flutter, Firebase, state management, theming, localization, and more.

---

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Technologies Used](#technologies-used)
- [Project Structure](#project-structure)
- [UI/UX & Theming](#uiux--theming)
- [Localization](#localization)
- [How to Run](#how-to-run)
- [Screenshots](#screenshots)
- [Credits](#credits)

---

## Features

### 📝 Task Management
- **Add Tasks:** Quickly add new tasks with title, description, and scheduled time.
- **Edit Tasks:** Modify existing tasks with an intuitive edit screen.
- **Delete Tasks:** Remove tasks permanently.
- **Task Status:** Mark tasks as complete/incomplete with a visual indicator (color-coded).
- **Time Display:** Each task displays scheduled time with a clock icon.

### 📅 Calendar View
- Integrated calendar timeline for date-based task browsing (using `calendar_timeline` package).

### 🎨 Themes & Customization
- **Light/Dark Theme:** Seamless switching with well-designed custom color palettes.
- **Custom Fonts:** Uses Google Fonts for a modern, readable interface.
- **Persistent Preferences:** Theme and language settings are remembered.

### 🌍 Localization
- Fully supports multiple languages (English/Arabic) using Flutter's localization system.
- All labels and text adapt to the selected language.

### ☁️ Firebase Integration
- **Cloud Firestore:** Tasks are stored in Firebase for real-time updates, persistence, and scalability.
- **Typed Models:** Strictly typed Firestore converters for data safety.

### ⚡ Performance and Responsiveness
- Uses `Provider` for efficient state management and UI updates.
- Responsive layouts across devices, including handling of keyboard overlays.

### 🧩 Modular, Scalable Codebase
- Separation of concerns with clear folder structure for screens, models, providers, and shared resources.
- Easy to extend with new features or screens.

---

## Architecture

### Clean Architecture Principles

This project adopts a **Clean Architecture** approach, separating core layers for scalability and maintainability using MVVM architecture design pattern:

- **View Layer:** Widgets (screens, layouts, UI components)
- **ViewModel Layer:** Providers for theme, language, and navigation state and Firebase functions for all network/database operations
- **Model Layer:** Models (e.g., `TaskModel`) encapsulate business data

> **Why Clean Architecture?**
>
> - **Testability:** Logic is decoupled from UI, enabling easier testing.
> - **Scalability:** New features can be added without affecting existing code.
> - **Maintainability:** Separate layers make it easier to fix bugs or update dependencies.

> **Note:** The project leverages MVVM concepts by separating Models (data), Views (UI), and Providers (ViewModels/State).

---

## Technologies Used

- **Flutter**: Cross-platform app development
- **Dart**: Primary programming language
- **Firebase Core & Firestore**: Back-end and real-time data storage
- **Provider**: State management
- **Google Fonts**: Typography
- **calendar_timeline**: Beautiful calendar timeline widget
- **Flutter Localization**: Multilanguage support (`flutter_localizations`, `flutter_gen/gen_l10n`)
- **Material Design**: UI components and guidelines

### Key Packages

| Package                | Use                                      |
|------------------------|------------------------------------------|
| firebase_core          | Firebase initialization                  |
| cloud_firestore        | Real-time NoSQL database                 |
| provider               | State management                         |
| google_fonts           | Custom fonts                             |
| calendar_timeline      | Calendar timeline UI                     |
| flutter_localizations  | Localization framework                   |
| flutter_gen/gen_l10n   | Localization code generation             |

---

## Project Structure

```
lib/
├── layout/
│   ├── home_layout.dart           # Main app layout (tabs, FAB, navigation)
├── screens/
│   ├── auth_layout/
│   │   ├── auth_layout.dart
│   ├── edit_task_tab/
│   │   ├── edit_task_connector.dart
│   │   ├── edit_task_view_model.dart
│   │   ├── view/
│   │   │     ├── custom_text_form_widget.dart
│   │   │     ├── edit_task_tab.dart     # Edit task screen
│   ├── Login_MVVM/
│   │   ├── login_connector.dart
│   │   ├── login_view_model.dart
│   │   ├── login_view_tab.dart
│   │   ├── user_model.dart
│   ├──  settings_tab/
│   │    ├──  settings_tab.dart      # Theme/language settings
│   ├──  Signup_MVVM/
│   │    ├── Signup_connector.dart
│   │    ├── Signup_view_tab.dart
│   │    ├── Signup_ViewModel.dart
│   ├── tasks_tab_MVVM/
│   │   ├── task_model.dart             #data needed for task
│   │   ├── tasks_tab_connector.dart
│   │   ├── tasks_tab_view_model.dart
│   │   ├── view/
│   │   │     ├── tasks_tab.dart         # Task list screen
│   │   │     ├── task_item.dart         # Task list item UI
│   │   │     ├──  add_task_bottom_sheet.dart # Task creation UI using bottomsheet
├── shared/
│   ├── components/
│   │   ├── components.dart
│   │   ├── constants.dart
│   ├── network/
│   │   ├── firebase/
│   │       ├── firebase_functions.dart # All Firestore operations but now is removed adn used inside viewmodels
│   ├── styles/
│   │   ├── colors.dart            # Centralized color definitions
│   │   ├── text_styles.dart       # Text styles for both themes
│   │   ├── theming.dart           # Light/Dark theme data
├── base.dart
├── firebase_options.dart
├── main.dart                      # App entry point, routing, localization
```

---

## UI/UX & Theming

- **Custom Themes:** Fine-tuned light and dark themes, including FAB, bottom navigation, and app bar.
- **Theming Class:** `Theming` provides static theme data for easy switching.
- **Centralized Colors:** `MainColors` class ensures consistent palette.
- **Typography:** `TextStyles` class for scalable, readable text.
- **Modern Widgets:** Floating Action Button, Bottom Navigation Bar, Cards, Calendar, etc.
- **Responsiveness:** Handles different screen sizes, input overlays, and edge cases.

---

## Localization

- **Multi-language:** Built-in support for English and Arabic.
- **Dynamic Switching:** Users can change language at runtime.
- **Generated Files:** Uses `flutter_gen` for auto-generated localization code.
- **RTL/LTR Support:** UI adapts based on language direction.

---

## How to Run

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install)
- [Firebase CLI](https://firebase.google.com/docs/cli)
- A Firebase project (for Firestore setup)

### Steps

1. **Clone the Repository**
    ```bash
    git clone https://github.com/AntoniousEmadkamel/nota_app.git
    cd nota_app
    ```

2. **Install Dependencies**
    ```bash
    flutter pub get
    ```

3. **Configure Firebase**
    - Add your `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) in the appropriate directories.
    - Update `firebase_options.dart` as needed.

4. **Run the App**
    ```bash
    flutter run
    ```

---

## Screenshots

<p align="center">
    
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/splash-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/home-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/task-done-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/task-delete-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/add-new-task-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/settings-light.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/edit-task-light.png" width="120"/>
<br>
<br>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/splash-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/home-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/task-done-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/task-delete-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/add-new-task-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/settings-dark.png" width="120"/>
<img src="https://github.com/AntoniousEmadkamel/nota_app/blob/master/screenshoots/edit-task-dark.png" width="120"/>
</p>

---

## Credits

- **Author:** [Antonious Emad](https://github.com/AntoniousEmadkamel)
- **Packages:** [See above](#technologies-used)
- **Flutter** & **Firebase** communities

---

## Why This Project?

This project is one of real-world Flutter skills, best practices, and advanced features:
- **Clean architecture**
- **Firebase integration**
- **Beautiful, accessible UI**
- **Theming and localization**
- **Scalable and maintainable codebase**

Feel free to fork, modify, or use as inspiration for your own projects!

---
