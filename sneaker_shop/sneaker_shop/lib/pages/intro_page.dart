// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey[300],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Container(
                padding: const EdgeInsets.all(8.0),
                width: 300,
                child: Image.asset('assets/logo.png', height: 260,),
              ),
          
              const SizedBox(height: 30,),
              //title
          
              Text(
                'Just Buy It',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25
                ),
              ),
              
            const SizedBox(height: 20,),
          
          
              //subtitle
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 17.0),
                child: Text(
                  'Brand new sneakers and custom kicks made with premium quality.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 14
                    
                  ),
                  ),
              ),
          
              const SizedBox(height: 50,),      
          
              //button
          
              GestureDetector(
                onTap: (){Navigator.pushNamed(context, '/homepage');},
                child: Container(
                  
                  padding: EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Colors.grey[900],
                    borderRadius: BorderRadius.circular(12)
                    
                  ),
                  child: Center(child: Text("Shop Now", style: TextStyle(color: Colors.white),)),
                ),
              )      
              
              
                
                
                
                
                
            ],
          ),
        ),
      ),
    );
  }
}