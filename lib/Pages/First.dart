import 'package:flutter/material.dart';
import 'dart:ui';
import 'Profile.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Image.asset(
            width: double.infinity,
            'Assets/image/man.jpg',
            fit: BoxFit.cover,
          ),

          // Apply blur effect
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
            child: Container(
              color: Colors.black.withOpacity(0)// Adjust opacity for the effect
            ),
          ),

          // Foreground content
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Profile()),
                    );
                  },
                  child: Image.asset(
                    'Assets/image/man.jpg',
                    width: double.infinity,
                    height: 550,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      backgroundColor: Colors.black,
    );
  }
}

