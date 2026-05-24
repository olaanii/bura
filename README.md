# Bura - Delivery Tracking App

A modern Flutter application for tracking deliveries and managing logistics operations.

## Features

- **Real-time Tracking**: Track deliveries with live map updates and location visualization
- **Order Management**: View and manage multiple orders with status indicators
- **Driver Information**: Access delivery driver details including ratings and contact options
- **Delivery Timeline**: Visual timeline showing delivery progress and estimated arrival times
- **Multiple Service Types**: Support for various delivery services including:
  - Courier (door-to-door)
  - Cargo (bulk shipments)
  - Parcels (small packages)
  - Documents (papers & files)
  - Custom delivery conditions

## Screens

- **Home Screen**: Overview of current delivery status, service type selection, and order history
- **Tracking Screen**: Detailed view of active delivery with driver info, map, and timeline
- **Order Details Screen**: Comprehensive order information and management options

## Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **UI**: Material Design
- **Typography**: Google Fonts

## Getting Started

### Prerequisites

- Flutter SDK (>=3.3.0)
- Dart SDK (>=3.3.0 <4.0.0)

### Installation

1. Clone the repository:
```bash
git clone https://github.com/olaanii/bura.git
cd bura
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── main.dart              # App entry point
├── screens/               # Screen widgets
│   ├── home_screen.dart
│   ├── tracking_screen.dart
│   └── order_details_screen.dart
├── theme/                 # App theming
│   ├── app_colors.dart
│   └── app_theme.dart
└── widgets/               # Reusable widgets
    ├── action_tile.dart
    ├── map_backdrop.dart
    ├── move_top_bar.dart
    ├── order_row.dart
    └── pill.dart
```

## Version

Current version: 0.1.0+1

## License

This project is licensed under the MIT License.
