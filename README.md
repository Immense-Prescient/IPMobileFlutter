# IP Mobile Flutter - Demo Project

A professional Flutter demo application showcasing clean architecture and best practices for mobile development.

## 📁 Project Structure

```
IPMobileFlutter/
├── lib/
│   ├── components/       # Reusable UI widgets
│   │   ├── custom_button.dart
│   │   ├── custom_card.dart
│   │   └── index.dart
│   ├── screens/          # Screen widgets
│   │   ├── splash_screen.dart
│   │   ├── login_screen.dart
│   │   ├── signup_screen.dart
│   │   ├── dashboard_screen.dart
│   │   └── index.dart
│   ├── services/         # API and external services
│   │   ├── api_service.dart
│   │   └── auth_service.dart
│   ├── hooks/            # Custom state management
│   │   └── use_products.dart
│   ├── utils/            # Helper functions
│   │   └── formatters.dart
│   ├── constants/        # App constants
│   │   ├── colors.dart
│   │   └── spacing.dart
│   ├── types/            # Data models
│   │   ├── user.dart
│   │   └── product.dart
│   └── main.dart         # App entry point
├── android/              # Android native code
├── ios/                  # iOS native code
└── pubspec.yaml          # Dependencies
```

## 🏗️ Architecture Principles

### 1. Separation of Concerns
- **Components**: Reusable UI widgets
- **Screens**: Page-level widgets
- **Services**: API calls and business logic
- **Hooks**: Shared stateful logic (ChangeNotifier)
- **Utils**: Pure helper functions

### 2. Type Safety
- Dart's strong typing system
- Centralized data models in `lib/types/`

### 3. Scalability
- Modular folder structure
- Easy to add new features
- Clear import/export patterns

### 4. Maintainability
- Consistent naming conventions
- Centralized constants
- Reusable widgets

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (3.0+)
- Dart SDK
- Xcode (for iOS)
- Android Studio (for Android)

### Installation

```bash
cd IPMobileFlutter

# Get dependencies
flutter pub get

# Run on iOS
flutter run -d ios

# Run on Android
flutter run -d android
```

### Login Credentials
- Email: `admin@yopmail.com`
- Password: `Admin@123`

## 📦 Key Features

- Complete authentication flow (Splash → Login → Signup → Dashboard → Logout)
- Persistent authentication with SharedPreferences
- Clean folder structure
- Dart type safety
- Reusable widgets (CustomButton, CustomCard)
- Custom hooks for data fetching (ChangeNotifier pattern)
- Centralized styling constants
- Mock API service layer
- Error handling patterns
- Form validation
- Loading states
- User profile display
- Product listing with real API data

## 🎨 Design System

### Colors
Defined in `lib/constants/colors.dart`:
- Primary, Secondary colors
- Success, Warning, Error states
- Text and background colors

### Spacing
Defined in `lib/constants/spacing.dart`:
- Consistent spacing scale (xs, sm, md, lg, xl, xxl)

## 📝 Code Examples

### Creating a New Screen
```dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surface,
      appBar: AppBar(title: const Text('New Screen')),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Text('New Screen Content'),
      ),
    );
  }
}
```

### Using Custom Hooks
```dart
final productsHook = ProductsHook();
productsHook.fetchProducts();

ListenableBuilder(
  listenable: productsHook,
  builder: (context, _) {
    if (productsHook.loading) return CircularProgressIndicator();
    return ListView(children: productsHook.products.map(...).toList());
  },
)
```

## 🔧 Best Practices Demonstrated

1. **Widget Composition**: Small, focused widgets
2. **ChangeNotifier Pattern**: Reusable state management
3. **Type Safety**: Full Dart type coverage
4. **Error Handling**: Graceful error states
5. **Loading States**: User feedback during async operations
6. **Consistent Styling**: Design system approach
7. **Service Layer**: Abstracted API calls

## 🎯 App Flow

1. **Splash Screen** - Shows app logo with loading animation (2 seconds)
2. **Login Screen** - Email/password authentication with validation
3. **Signup Screen** - New user registration with form validation
4. **Dashboard Screen** - 
   - User profile display with avatar
   - Statistics cards (product count, average price)
   - Product list with API data
   - Logout functionality
5. **Logout** - Clears session and returns to login

## 👥 For Client Presentation

This project demonstrates:
- Complete authentication flow with persistent sessions
- Professional code organization
- Scalable architecture
- Industry best practices
- Clean, maintainable code
- Dart expertise
- Modern Flutter patterns
- Form validation and error handling
- SharedPreferences for data persistence
- Mock API services ready for real backend integration

## 📚 Next Steps

- Add navigation (GoRouter)
- Implement state management (Provider/Riverpod/Bloc)
- Add unit tests
- Add widget tests
- Add integration tests
- Integrate real API endpoints
- Add error logging (Sentry)
- Add analytics (Firebase)

