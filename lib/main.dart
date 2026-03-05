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