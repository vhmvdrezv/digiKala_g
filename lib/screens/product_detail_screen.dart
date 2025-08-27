import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/product.dart';
import '../providers/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text(product.title)),
      body: Column(
        children: [
          Image.network(product.thumbnail, height: 200),
          Text(product.title, style: TextStyle(fontSize: 24)),
          Text(product.description),
          Text('\$${product.price}', style: TextStyle(fontSize: 20, color: Colors.green)),
          ElevatedButton(onPressed: () { provider.addToCart(product); ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Added to Cart'))); }, child: Text('Add to Cart')),
        ],
      ),
    );
  }
}