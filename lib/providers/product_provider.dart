import 'package:flutter/foundation.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<Product> products = [];
  List<Product> cart = [];
  final ApiService _api = ApiService();

  Future<void> fetchProducts() async {
    if (products.isEmpty) {
      products = await _api.fetchProducts();
      notifyListeners();
    }
  }

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  List<Product> searchProducts(String query) {
    return products.where((p) => p.title.toLowerCase().contains(query.toLowerCase())).toList();
  }
}