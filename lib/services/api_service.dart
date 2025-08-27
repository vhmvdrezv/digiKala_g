import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../utils/constants.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('${AppUrls.baseUrl}/products'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['products'] as List;
      return data.map((json) => Product.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load products');
    }
  }
}