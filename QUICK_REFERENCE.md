# Quick Reference

## 🚀 Common Commands

```bash
# Install dependencies
flutter pub get

# Run on iOS
flutter run -d ios

# Run on Android
flutter run -d android

# Run tests
flutter test

# Build for production
flutter build ios
flutter build android

# Clean build
flutter clean

# Check for issues
flutter doctor

# Format code
dart format .

# Analyze code
flutter analyze
```

## 📝 Code Snippets

### Create New Screen
```dart
import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/spacing.dart';

class NewScreen extends StatelessWidget {
  const NewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(title: const Text('New Screen')),
      body: const Padding(
        padding: EdgeInsets.all(AppSpacing.md),
        child: Text('Content'),
      ),
    );
  }
}
```

### Create Custom Widget
```dart
import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomWidget({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(title),
    );
  }
}
```

### Add API Service Method
```dart
Future<List<Item>> fetchItems() async {
  try {
    final response = await http.get(Uri.parse('$baseUrl/items'));
    
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load items');
    }
  } catch (e) {
    throw Exception('Error: $e');
  }
}
```

### Create Data Model
```dart
class Item {
  final int id;
  final String name;

  Item({required this.id, required this.name});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }
}
```

### Create Custom Hook
```dart
import 'package:flutter/foundation.dart';

class DataHook extends ChangeNotifier {
  List<Item> _items = [];
  bool _loading = false;
  String? _error;

  List<Item> get items => _items;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchData() async {
    _loading = true;
    notifyListeners();

    try {
      _items = await apiService.fetchItems();
      _error = null;
    } catch (e) {
      _error = e.toString();
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
```

### Use Custom Hook
```dart
final dataHook = DataHook();

@override
void initState() {
  super.initState();
  dataHook.fetchData();
}

@override
Widget build(BuildContext context) {
  return ListenableBuilder(
    listenable: dataHook,
    builder: (context, _) {
      if (dataHook.loading) return CircularProgressIndicator();
      if (dataHook.error != null) return Text(dataHook.error!);
      return ListView(children: dataHook.items.map(...).toList());
    },
  );
}
```

## 🎨 Styling Patterns

### Using Constants
```dart
Container(
  padding: const EdgeInsets.all(AppSpacing.md),
  decoration: BoxDecoration(
    color: AppColors.surface,
    borderRadius: BorderRadius.circular(AppSpacing.sm),
  ),
  child: Text(
    'Content',
    style: TextStyle(color: AppColors.text),
  ),
)
```

### Responsive Spacing
```dart
Column(
  children: [
    Widget1(),
    const SizedBox(height: AppSpacing.md),
    Widget2(),
    const SizedBox(height: AppSpacing.lg),
    Widget3(),
  ],
)
```

## 🔐 Auth Patterns

### Check Authentication
```dart
final authService = AuthService();
final isAuth = await authService.isAuthenticated();
```

### Get Current User
```dart
final user = await authService.getUser();
if (user != null) {
  print(user.name);
}
```

### Logout
```dart
await authService.logout();
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => LoginScreen()),
);
```

## 📦 File Organization

### Adding New Feature
1. Create model in `/lib/types/`
2. Create service in `/lib/services/`
3. Create hook in `/lib/hooks/` (if needed)
4. Create screen in `/lib/screens/`
5. Create widgets in `/lib/components/` (if needed)
6. Export in index.dart files

### Import Order
```dart
// 1. Flutter SDK
import 'package:flutter/material.dart';

// 2. External packages
import 'package:http/http.dart' as http;

// 3. Internal imports
import '../constants/colors.dart';
import '../components/index.dart';
```

## 🐛 Debugging

### Common Issues

**Issue**: White screen on launch
**Fix**: Check main.dart, ensure MaterialApp is returned

**Issue**: Dependencies not found
**Fix**: Run `flutter pub get`

**Issue**: Build errors
**Fix**: Run `flutter clean` then `flutter pub get`

**Issue**: Products not loading
**Fix**: Check internet connection, verify API endpoint

## 📚 Useful Resources

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)
- [Material Design](https://m3.material.io/)
- [FakeStore API](https://fakestoreapi.com/)

