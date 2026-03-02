import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import '../types/user.dart';

class AuthService {
  static const String _tokenKey = 'auth_token';
  static const String _userKey = 'user_data';

  // Mock login - simulates API call
  Future<Map<String, dynamic>> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (email.isEmpty || password.isEmpty) {
      throw Exception('Email and password are required');
    }

    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }

    // Mock successful response
    return {
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'user': User(
        id: '1',
        name: email.split('@')[0],
        email: email,
        avatar: 'https://ui-avatars.com/api/?name=${email.split('@')[0]}',
      ),
    };
  }

  // Mock signup
  Future<Map<String, dynamic>> signup(
    String name,
    String email,
    String password,
  ) async {
    await Future.delayed(const Duration(milliseconds: 1500));

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      throw Exception('All fields are required');
    }

    if (!_isValidEmail(email)) {
      throw Exception('Invalid email format');
    }

    if (password.length < 6) {
      throw Exception('Password must be at least 6 characters');
    }

    return {
      'token': 'mock_jwt_token_${DateTime.now().millisecondsSinceEpoch}',
      'user': User(
        id: '1',
        name: name,
        email: email,
        avatar: 'https://ui-avatars.com/api/?name=$name',
      ),
    };
  }

  Future<void> saveAuthData(String token, User user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_userKey, json.encode(user.toJson()));
  }

  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  Future<User?> getUser() async {
    final prefs = await SharedPreferences.getInstance();
    final userJson = prefs.getString(_userKey);
    if (userJson != null) {
      return User.fromJson(json.decode(userJson));
    }
    return null;
  }

  Future<bool> isAuthenticated() async {
    final token = await getToken();
    return token != null;
  }

  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_userKey);
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}
