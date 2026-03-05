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

//2. UI LAYAR ---
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const MyCatalog(),
        '/cart': (context) => const MyCart(), 
      },
    );
  }
}

// Halaman Katalog
class MyCatalog extends StatelessWidget {
  const MyCatalog({super.key});

  @override
  Widget build(BuildContext context) {
    final products = ['Nasi Goreng', 'Sate Ayam', 
    'Es Teh', 'Ayam Bakar', 'kopi' ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Makanan'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () => Navigator.pushNamed(context, '/cart'),
            ), 
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            trailing: AddButton(item: products[index]),
          );
        },
      ),
    );
  }
}