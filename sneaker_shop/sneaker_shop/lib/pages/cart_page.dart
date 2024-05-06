import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/cart_tile.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Title
            Text("My Cart" , style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),),
        
            const SizedBox(height: 10,),
        
            //Cart
            Expanded(
              child: ListView.builder(
                itemCount: value.getUserCart().length,
                itemBuilder: (context , index){
                  Shoe individualShoe = value.getUserCart()[index];
              
                  return CartItem(
                    shoe: individualShoe,
                  );
                }),
            )
          ],
        ),
      ),);
      
  }
}