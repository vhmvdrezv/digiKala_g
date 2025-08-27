import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: provider.cart.isEmpty
          ? Center(child: Text('Empty Cart'))
          : ListView.builder(
        itemCount: provider.cart.length,
        itemBuilder: (_, i) => ProductCard(product: provider.cart[i]),
      ),
    );
  }
}