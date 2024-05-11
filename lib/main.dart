import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_rolls/models/shop.dart';
import 'package:sushi_rolls/pages/cart_page.dart';
import 'package:sushi_rolls/pages/intro_page.dart';
import 'package:sushi_rolls/pages/menu_page.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => Shop(), child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sushi Rolls',
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/intropage': (context) => const IntroPage(),
        '/menupage': (context) => const MenuPage(),
        '/cartpage': (context) => const CartPage(),
      },
    );
  }
}
