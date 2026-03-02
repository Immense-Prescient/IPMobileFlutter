import 'package:flutter/foundation.dart';
import '../services/api_service.dart';
import '../types/product.dart';

class ProductsHook extends ChangeNotifier {
  final ApiService _apiService = ApiService();

  List<Product> _products = [];
  bool _loading = false;
  String? _error;

  List<Product> get products => _products;
  bool get loading => _loading;
  String? get error => _error;

  Future<void> fetchProducts() async {
    _loading = true;
    _error = null;
    notifyListeners();

    try {
      _products = await _apiService.fetchProducts();
      _error = null;
    } catch (e) {
      _error = e.toString();
      _products = [];
    } finally {
      _loading = false;
      notifyListeners();
    }
  }
}
