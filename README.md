# Simple Counter

A Flutter learning project demonstrating fundamental concepts through a persistent counter application.

## Overview

This app implements a basic counter with increment, decrement, and reset functionality. The counter value persists locally using SharedPreferences, ensuring the state is restored when the app restarts.

## Features

- **Increment/Decrement** — Modify the counter value with dedicated buttons
- **Reset** — Return the counter to zero
- **Local Persistence** — Counter value survives app restarts using SharedPreferences
- **State Management** — Demonstrates StatefulWidget and setState() patterns
- **Clean Architecture** — No global variables, all state contained within the widget

## Concepts Demonstrated

- `StatelessWidget` vs `StatefulWidget`
- Widget tree composition (`Column`, `FloatingActionButton`, `Scaffold`)
- `setState()` for reactive UI updates
- Flutter lifecycle methods (`initState`)
- Async operations with `SharedPreferences`
- Hot reload workflow

## Getting Started

### Prerequisites

- Flutter SDK 3.10.7 or higher
- Dart SDK (included with Flutter)

### Installation

1. Clone the repository
2. Install dependencies:
   ```bash
   flutter pub get
   ```

### Running the App

```bash
flutter run
```

Select your target device when prompted (iOS simulator, Android emulator, or connected device).

### Development

The app supports hot reload for rapid development:

- Press `r` in the terminal to hot reload
- Press `R` to hot restart
- Press `q` to quit

## Project Structure

```
lib/
  └── main.dart          # Main application entry point and counter logic
```

## Dependencies

- `flutter` — Flutter SDK
- `shared_preferences` — Local key-value storage for persistence
- `cupertino_icons` — iOS-style icons

## License

This is a learning project created for educational purposes.
