import 'package:flutter/material.dart';

class ProductsProvider extends ChangeNotifier {
  final List<Map<String, dynamic>> _products = [
    {'name': 'Laptop Pro 15"', 'price': 1299.99, 'date': DateTime.now()},
    {
      'name': 'iPhone 15 Pro',
      'price': 999.00,
      'date': DateTime.now().subtract(const Duration(days: 2)),
    },
    {
      'name': 'AirPods Pro',
      'price': 249.00,
      'date': DateTime.now().subtract(const Duration(days: 5)),
    },
  ];

  String _searchQuery = '';

  List<Map<String, dynamic>> get products {
    if (_searchQuery.isEmpty) {
      return List.unmodifiable(_products);
    }
    return List.unmodifiable(
      _products.where(
        (product) => product['name'].toString().toLowerCase().contains(
          _searchQuery.toLowerCase(),
        ),
      ),
    );
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void addProduct(String name, double price) {
    _products.add({'name': name, 'price': price, 'date': DateTime.now()});
    notifyListeners();
  }

  void editProduct(int index, String name, double price) {
    final targetProduct = products[index];
    final realIndex = _products.indexOf(targetProduct);

    if (realIndex != -1) {
      _products[realIndex] = {
        'name': name,
        'price': price,
        'date': _products[realIndex]['date'],
      };
      notifyListeners();
    }
  }

  void deleteProduct(int index) {
    final targetProduct = products[index];
    final realIndex = _products.indexOf(targetProduct);

    if (realIndex != -1) {
      _products.removeAt(realIndex);
      notifyListeners();
    }
  }
}
