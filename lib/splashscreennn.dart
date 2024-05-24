import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/home-base.dart';
import 'package:flutter_application_1/login.dart';

class splashscreennn extends StatefulWidget {
  const splashscreennn({super.key});

  @override
  State<splashscreennn> createState() => _splashscreennnState();
}

class _splashscreennnState extends State<splashscreennn> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => (HomeScreen())));
      } else {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => (LoginScreen())));
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //Image.network('https://hips.hearstapps.com/hmg-prod/images/pritika-swarup-wearing-a-brown-blusa-white-shoes-and-black-news-photo-1672741251.jpg?crop=0.668xw:1.00xh;0,0&resize=1200:*'),
          Positioned.fill(
            child: Image.network(
              'https://paradiseinvitations.com/cdn/shop/products/13_924159bc-15c0-4c53-9e42-08d0f310c779_1024x1024.jpg?v=1632405644',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  'Card Application',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 33,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 51),
              CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 0, 0, 0)))
            ],
          ),
        ],
      ),
    );
  }
}
