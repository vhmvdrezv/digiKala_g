import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';
import 'category_screen.dart';
import 'search_screen.dart'; // Added for search
import 'cart_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ProductProvider>(context);
    provider.fetchProducts(); // Fetch on load

    return Scaffold(
      appBar: AppBar(title: Text('Home'), actions: [IconButton(icon: Icon(Icons.search), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => SearchScreen()))) ]),
      body: Column(
        children: [
          ListTile(title: Text('Categories'), onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => CategoryScreen()))),
          Expanded(
            child: provider.products.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
              itemCount: provider.products.length,
              itemBuilder: (_, i) => ProductCard(product: provider.products[i]),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'), BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'), BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')],
        onTap: (index) {
          if (index == 1) Navigator.push(context, MaterialPageRoute(builder: (_) => CartScreen()));
          if (index == 2) Navigator.push(context, MaterialPageRoute(builder: (_) => ProfileScreen()));
        },
      ),
    );
  }
}