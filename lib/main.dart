import 'package:flutter/material.dart';

void main () {
  runApp(
    // Membungkus aplikasi dengan ChangeNotifierProvider
    // agar State bisa diakses di mana saja
    ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: const MyApp(),
    ),
  );
}

//1. STATE MODEL (BUSINESS LOGIC) ---
class CartModel extends ChangeNotifier {
  final List<String> _items = [];

  List<String> get items => _items;

  void add(String itemName) {
    _items.add(itemName);

    notifyListeners();
  }

  void removeAll(){
    _items.clear();
    notifyListeners();
  }
}