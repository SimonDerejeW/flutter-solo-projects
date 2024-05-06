import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/models/shoe.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  //add shoe to cart
  void addShoeToCart(Shoe shoe){
    Provider.of<Cart>(context , listen: false).addToCart(shoe);

    showDialog(context: context,
     builder: (context) => AlertDialog(
      title: Text("Successfully Added!"),
      content: Text("Check your Cart"),
     )
     );
  }



  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (context, value, child) => Column(
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
            //Create Shoe
            Shoe shoe = value.getShoeList()[index];

            //Return Shoe
            return ShoeTile(
              shoe: shoe,
              onTap: () => addShoeToCart(shoe),
              
              );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: Divider(
              color: Colors.transparent,
          ),)

      ],
    ),
    );
  }
}