import 'package:flutter/material.dart';
import 'package:sneaker_shop/models/shoe.dart';

class Cart extends ChangeNotifier{
  //list of shoes for sale
  List<Shoe> shoeShop = [
    Shoe(
        name: 'Nike Dunk Varsity',
        price: '119.99',
        description: "Lace up and show off that varsity spirit. Are you game?",
        imagePath: 'assets/blue_dunk.png'),
    Shoe(
        name: 'Nike Dunk Low Retro',
        price: '150',
        description: "This basketball icon channels '80s vibes with premium leather in the upper that looks good and breaks in even better. ",
        imagePath: 'assets/dunk.png'),
    Shoe(
        name: 'Nike SB Dunk',
        price: '115.99',
        description: "Bursting through adversity!",
        imagePath: 'assets/sb-dunk.png'), 
    Shoe(
        name: 'KD16',
        price: '139.99',
        description: "It's ideal for the hoopaholic who can't say no to just one more game.",
        imagePath: 'assets/kd.png'),
  ];

  //list of items in user cart
  List<Shoe> userCart = [];

  //get list of shoes for sale
  List<Shoe> getShoeList(){
    return shoeShop;
  }

  //get cart
    List<Shoe> getUserCart(){
    return userCart;
  }

  //add items to cart
  void addToCart(Shoe shoe){
    userCart.add(shoe);
    notifyListeners();
  }

  //remove items from cart
  void removeFromCart(Shoe shoe){
    userCart.remove(shoe);
    notifyListeners();
  }
}
