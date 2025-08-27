import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  final List<String> categories = ['Electronics', 'Clothes', 'Books']; // Mock categories

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Categories')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (_, i) => ListTile(title: Text(categories[i]), onTap: () {}), // Can navigate to category products
      ),
    );
  }
}