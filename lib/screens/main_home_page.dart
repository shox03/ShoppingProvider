import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/core/widgets/bottom_nav/bottom_navbar.dart';
import 'package:shopping_provider/providers/my_bottom_provider.dart';
import 'package:shopping_provider/screens/my_cart_page/my_cart_page.dart';
import 'package:shopping_provider/screens/my_home_page/my_home_page.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: context.watch<MyBottomProvider>().index == 0
          ? const MyHomePage()
          : MyCartPage(),
      bottomNavigationBar: const MyBottom(),
    );
  }
}
