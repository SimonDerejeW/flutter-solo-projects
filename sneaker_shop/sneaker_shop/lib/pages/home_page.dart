import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/bottom_nav.dart';
import 'package:sneaker_shop/pages/cart_page.dart';
import 'package:sneaker_shop/pages/shop_page.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selected_idx = 0;

  final List<Widget> _pages = [

     const ShopPage() , const CartPage()
  ];

  void navigateBottomBar(int index){
    setState(() {
      _selected_idx = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Builder (
          builder:(context) => IconButton( onPressed: (){
          Scaffold.of(context).openDrawer();
        }, 
        icon: const  Icon(Icons.menu)),
      ),
      backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [DrawerHeader(child: Image.asset('assets/logo.png', color: Colors.white,)),

            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.home, color: Colors.white,),
                title: Text("Home", style: TextStyle(color: Colors.white),),
              
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: ListTile(
                leading: Icon(Icons.info, color: Colors.white,),
                title: Text("About", style: TextStyle(color: Colors.white),),
              
              ),
            ),],
            ),
            const Padding(
              padding: EdgeInsets.only(left: 80, bottom: 15),
              child: ListTile(
                leading: Icon(Icons.logout, color: Colors.white,),
                title: Text("Logout", style: TextStyle(color: Colors.white),),
              
              )),
          ],
        ),
      ),
      body: _pages[_selected_idx],
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
    );
  }
}