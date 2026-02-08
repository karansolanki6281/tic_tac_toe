# Tic Tac Toe

A classic two-player Tic Tac Toe game built with **Flutter**. Play on mobile, web, or desktop—one codebase, multiple platforms.

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=flat&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=flat&logo=dart&logoColor=white)

## Features

- **Two players** — X and O take turns on a 3×3 grid
- **Win detection** — Recognizes all winning lines (rows, columns, diagonals)
- **Draw detection** — Declares a draw when the board is full with no winner
- **Auto-reset** — Game resets automatically 2 seconds after a win or draw
- **Simple UI** — Turn indicator, card-style cells with shadows, blue X and red O

## Screenshots

| Gameplay | Winner |
|----------|--------|
| Turn-based play on a clean grid | Winner announcement with auto-reset |

## Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (SDK ^3.6.1 or compatible)
- A device or emulator (Android, iOS, Windows, macOS, Linux, or web browser)

## Getting Started

### 1. Clone and enter the project

```bash
git clone <repository-url>
cd tic_tac_toe
```

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Run the app

**Web**
```bash
flutter run -d chrome
```

**Windows**
```bash
flutter run -d windows
```

**Android / iOS**
```bash
flutter run
```

Or use your IDE’s Run/Debug to pick a device.

## How to Play

1. X always goes first.
2. Tap a cell to place your symbol (X or O).
3. Get three in a row (horizontal, vertical, or diagonal) to win.
4. If all nine cells are filled with no winner, the game is a draw.
5. After a win or draw, the game resets automatically after 2 seconds.

## Project Structure

```
tic_tac_toe/
├── lib/
│   └── main.dart      # App entry point and game logic
├── test/
│   └── widget_test.dart
├── android/           # Android platform files
├── macos/             # macOS platform files
├── web/               # Web platform files
├── windows/           # Windows platform files
├── linux/             # Linux platform files
├── macos/             # macOS platform files
└── pubspec.yaml       # Dependencies and project config
```

## Tech Stack

- **Framework:** Flutter
- **Language:** Dart 3.6+
- **UI:** Material Design (no extra UI packages)

## License

This project is provided as-is for learning and fun. Use and modify as you like.
