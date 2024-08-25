import 'package:flutter/material.dart';
import 'package:grocery_app_flutter/models/shop.dart';
import 'package:grocery_app_flutter/pages/cart_page.dart';
import 'package:grocery_app_flutter/pages/home_page.dart';
import 'package:grocery_app_flutter/pages/intro_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Shop(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroPage(),
        routes: {
          '/intropage': (context) => const IntroPage(),
          '/homepage': (context) => HomePage(),
          '/cartpage': (context) => const CartPage(),
        },
      ),
    );
  }
}
