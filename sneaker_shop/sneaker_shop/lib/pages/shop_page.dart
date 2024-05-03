import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/models/shoe.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search Bar
        Container(
          padding: EdgeInsets.all(12),
          margin: EdgeInsets.only(bottom: 30, left: 30, right: 30),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8)
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Search", style: TextStyle(color: Colors.grey),),
              Icon(Icons.search , color: Colors.grey)
            ],
          ),
        ),

        // Message
        const Text(
          "everyone flies .... some fly longer",
          style: TextStyle(
            color: Colors.grey,
            fontSize: 17,
            
          ),
        ),
        const SizedBox(height: 10,),

        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Hot Picks 🔥', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text("See All", style: TextStyle(color: Colors.blue),)
            ],
          ),
        ),

        Expanded(
          child: ListView.builder
          ( itemCount: 4,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context , index){
            Shoe shoe = Shoe(name: 'Kobe Bryant', price: "\$250", description: "Cool shoe", imagePath: 'assets/nike.jpg');
            return ShoeTile(shoe: shoe);
          }),
        )
      ],
    );
  }
}