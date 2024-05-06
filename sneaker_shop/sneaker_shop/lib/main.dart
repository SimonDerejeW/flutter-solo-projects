import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/cart.dart';
import 'package:sneaker_shop/pages/home_page.dart';
import 'package:sneaker_shop/pages/intro_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async{
  //Initializing Hive
  await Hive.initFlutter();

  //Opening a hive box
  var box = await Hive.openBox("mYBox");



  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) => MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/homepage' : (context) => HomePage(),
      },
    ),
    );
  }
}

