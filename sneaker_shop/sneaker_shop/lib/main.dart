import 'package:flutter/material.dart';
import 'package:sneaker_shop/pages/home_page.dart';
import 'package:sneaker_shop/pages/intro_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.light().copyWith(
      //   textTheme: GoogleFonts.poppinsTextTheme().copyWith(
      // displayLarge: GoogleFonts.poppins(
      //     fontSize: 40,
      //     fontWeight: FontWeight.bold
      // ),
      // displayMedium: GoogleFonts.poppins(
      //   fontSize: 17,
      //   fontWeight: FontWeight.bold
      // ),
      // ),
      // ),
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      routes: {
        '/homepage' : (context) => HomePage(),
      },
    );
  }
}

