import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  String query = '';

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    final results = provider.searchProducts(query);

    return Scaffold(
      appBar: AppBar(title: TextField(onChanged: (val) => setState(() => query = val), decoration: InputDecoration(hintText: 'Search...'))),
      body: ListView.builder(
        itemCount: results.length,
        itemBuilder: (_, i) => ProductCard(product: results[i]),
      ),
    );
  }
}