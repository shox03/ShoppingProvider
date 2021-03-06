import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/providers/cart_provider.dart';
import 'package:shopping_provider/providers/my_bottom_provider.dart';
import 'package:shopping_provider/screens/main_home_page.dart';
import 'package:shopping_provider/screens/my_cart_page/my_cart_page.dart';
import 'package:shopping_provider/screens/my_home_page/my_home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MyBottomProvider()),
        ChangeNotifierProvider(create: (_) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      routes: {
        '/': (context) => const MainHomePage(),
        '/home': (context) => const MyHomePage(),
        '/cart': (context) => MyCartPage(),
      },
      initialRoute: '/',
    );
  }
}