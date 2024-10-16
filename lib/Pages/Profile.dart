import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_rohit/Pages/Home.dart';
import 'package:movie_rohit/Pages/Welcome.dart';
import 'First.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
              color: Colors.black.withOpacity(0), // Adjust opacity for effect
            ),
          ),
          Padding(
          padding: const EdgeInsets.only(top: 40,left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>FirstPage()));
                    },
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('Assets/image/man.jpg'), // Placeholder image
                    ),
                  ),
                  SizedBox(width: 20),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Manoj Kumhar",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold,color: Colors.grey),
                      ),
                      Text(
                        "kumharmanoj303@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 20),

              // Profile Options
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Browse',style: TextStyle(color: Colors.grey,fontSize: 20),),
                    ListTile(
                      leading: Icon(Icons.home_outlined, color: Colors.grey),
                      title: Text('Home',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                        // Navigate to settings page
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.search, color: Colors.grey),
                      title: Text('Search',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        // Navigate to settings page
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.favorite_outlined, color: Colors.grey),
                      title: Text('Favorite',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        // Navigate to settings page
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.settings, color: Colors.grey),
                      title: Text('Settings',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        // Navigate to settings page
                      },
                    ),

                    SizedBox(height: 10),
                    Text('Others',style: TextStyle(color: Colors.grey,fontSize: 20),),

                    ListTile(
                      leading: Icon(Icons.history, color: Colors.grey),
                      title: const Text('Recently Watched',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        // Navigate to order history page
                      },
                    ),
                    ListTile(
                      leading: Icon(Icons.help_outline, color: Colors.grey),
                      title: Text('Help & Support',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        // Navigate to help & support page
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.logout, color: Colors.grey),
                      title: Text('Logout',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomePage()));
                        // Handle logout
                      },
                    ),

                    ListTile(
                      leading: Icon(Icons.keyboard_return, color: Colors.grey,),
                      title: Text('Go Back',style: TextStyle(color: Colors.white),),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        ],
      ),
      backgroundColor: Color(0xff0e111e),
    );
  }
}
