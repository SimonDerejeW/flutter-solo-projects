import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  void Function(int)? onTabChange;

  BottomNavBar({super.key , required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: GNav(
        padding: EdgeInsets.all(25),
        rippleColor: Colors.grey.shade800,
        color: Colors.grey[400],
        activeColor: Colors.grey[700],
        tabBackgroundColor: Colors.grey.shade200,
        tabBorderRadius: 20,
        mainAxisAlignment: MainAxisAlignment.center,
        gap: 10,
        onTabChange: (value) => onTabChange!(value),
        tabs: [
          GButton(icon: Icons.home, text: 'Shop',),
          GButton(icon: Icons.shopping_cart_outlined, text: "Cart",)
        ],
      ),
    );
  }
}