import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen ({super.key});
  
  @override
  State<SplashScreen> createState()=> _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{
   @override
     void initState(){
          super.initState();
          //navigate to name screen after 3 seconds
          Timer(
            const Duration(seconds: 3),(){
Navigator.pushReplacementNamed(context, '/name');
            });
   }
   
     @override
     Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //place holder for logo 
            Icon(
              Icons.restaurant_menu,
              size: 80,
              color: Colors.cyan,
            ),

            SizedBox(height: 20,),
            const Text(
              'Welcome to World of Recipes!',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
                ),
              ),
            
          ],
        ),
      ),
    );
   }
}