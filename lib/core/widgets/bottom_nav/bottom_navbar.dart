import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_provider/core/constants/colors.dart';
import 'package:shopping_provider/providers/cart_provider.dart';
import 'package:shopping_provider/providers/my_bottom_provider.dart';

class MyBottom extends StatelessWidget {
  const MyBottom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Stack(
              children: [
                const Icon(Icons.add_shopping_cart),
                Positioned(
                  child: CircleAvatar(
                    radius: 6,
                    backgroundColor: Colors.red,
                    child: Text(
                      context
                          .watch<CartProvider>()
                          .listProduct
                          .length
                          .toString(),
                      style: const TextStyle(fontSize: 10),
                    ),
                  ),
                ),
              ],
            ),
            label: "Cart",
          ),
        ],
        currentIndex: context.watch<MyBottomProvider>().index,
        onTap: (index) {
          context.read<MyBottomProvider>().changeIndex(index);
        },
        selectedItemColor: myPrimaryColor,
      ),
    );
  }
}