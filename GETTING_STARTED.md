# Getting Started Guide

## 🚀 Quick Start

### 1. Prerequisites

Ensure you have Flutter installed:
```bash
flutter doctor
```

If not installed, visit: https://docs.flutter.dev/get-started/install

### 2. Installation

```bash
# Navigate to project
cd IPMobileFlutter

# Install dependencies
flutter pub get

# Verify setup
flutter doctor
```

### 3. Run the App

**iOS Simulator:**
```bash
flutter run -d ios
```

**Android Emulator:**
```bash
flutter run -d android
```

**Physical Device:**
```bash
# List available devices
flutter devices

# Run on specific device
flutter run -d <device-id>
```

### 4. Test the App

**Login Credentials:**
- Email: `admin@yopmail.com`
- Password: `Admin@123`

**Test Flow:**
1. App opens to splash screen (2 seconds)
2. Redirects to login screen
3. Enter credentials and login
4. View dashboard with products
5. Pull down to refresh products
6. Click logout to return to login
7. Try signup flow

## 📁 Project Structure Overview

```
lib/
├── main.dart              # App entry point
├── components/            # Reusable widgets
├── screens/               # App screens
├── services/              # API & auth logic
├── hooks/                 # State management
├── utils/                 # Helper functions
├── constants/             # Colors, spacing
└── types/                 # Data models
```

## 🎨 Key Concepts

### Widgets
Flutter uses widgets for everything. Our custom widgets:
- `CustomButton` - Reusable button with loading state
- `CustomCard` - Card container with consistent styling

### State Management
We use `ChangeNotifier` for shared state:
- `ProductsHook` - Manages product data and loading states

### Services
Business logic separated from UI:
- `AuthService` - Handles login, signup, logout
- `ApiService` - Fetches data from external APIs

### Constants
Centralized design system:
- `AppColors` - Color palette
- `AppSpacing` - Spacing scale

## 🔧 Development Workflow

### Making Changes

1. **Add a new screen:**
```bash
# Create file
touch lib/screens/new_screen.dart

# Export in index
echo "export 'new_screen.dart';" >> lib/screens/index.dart
```

2. **Add a new widget:**
```bash
# Create file
touch lib/components/new_widget.dart

# Export in index
echo "export 'new_widget.dart';" >> lib/components/index.dart
```

3. **Hot reload:**
Press `r` in terminal or save file in IDE

4. **Hot restart:**
Press `R` in terminal

### Debugging

**Enable debug mode:**
```bash
flutter run --debug
```

**View logs:**
```bash
flutter logs
```

**Inspect widget tree:**
Use Flutter DevTools in your IDE

## 📦 Adding Dependencies

1. Edit `pubspec.yaml`:
```yaml
dependencies:
  new_package: ^1.0.0
```

2. Install:
```bash
flutter pub get
```

3. Import in code:
```dart
import 'package:new_package/new_package.dart';
```

## 🐛 Troubleshooting

### Build Issues
```bash
flutter clean
flutter pub get
flutter run
```

### iOS Issues
```bash
cd ios
pod install
cd ..
flutter run -d ios
```

### Android Issues
```bash
cd android
./gradlew clean
cd ..
flutter run -d android
```

### Dependency Conflicts
```bash
flutter pub upgrade
```

## 📚 Learning Resources

- **Flutter Docs**: https://docs.flutter.dev/
- **Dart Docs**: https://dart.dev/guides
- **Widget Catalog**: https://docs.flutter.dev/ui/widgets
- **Cookbook**: https://docs.flutter.dev/cookbook

## 🎯 Next Steps

1. Explore the code in `lib/` folder
2. Read `ARCHITECTURE.md` for design details
3. Check `FEATURES.md` for feature documentation
4. Review `APP_FLOW.md` for flow diagrams
5. Try modifying colors in `lib/constants/colors.dart`
6. Add a new screen following existing patterns

## 💡 Tips

- Use `const` constructors for better performance
- Follow the existing folder structure
- Keep widgets small and focused
- Extract reusable logic to hooks
- Use the design system constants
- Write self-documenting code

