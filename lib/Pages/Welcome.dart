import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Home.dart';

class WelcomePage extends StatefulWidget{
  @override
  State<WelcomePage> createState() => _WelcomePageState();
}
class _WelcomePageState extends State<WelcomePage> {
  final PageController _pageController = PageController();
  int _img=0;
  Timer? _timer;

  @override
  void initState() {
    _changeImg(1);
  }

  void _changeImg(int v){
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 2), (timer){
      setState(() {
        _img += v;
        if (_img >= 7) {_img=0;}
        _pageController.animateToPage(
          _img,
          duration: Duration(milliseconds: 5000), // Duration of the transition
          curve: Curves.bounceOut, // Type of transition curve
        );
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();  // Cancel the timer when the widget is disposed
    _pageController.dispose();  // Dispose of the PageController
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
          controller: _pageController,
          children: [
            Image(image:AssetImage('Assets/image/A4.jpeg'),fit:BoxFit.cover) ,
            Image(image:AssetImage('Assets/image/A6.jpeg'),fit:BoxFit.cover) ,
            Image(image:AssetImage('Assets/image/A5.jpeg'),fit:BoxFit.cover) ,
            Image(image:AssetImage('Assets/image/A7.jpeg'),fit:BoxFit.cover) ,
            Image(image:AssetImage('Assets/image/A9.jpeg'),fit:BoxFit.cover) ,
            Image(image:AssetImage('Assets/image/A10.jpeg'),fit:BoxFit.cover) ,
          ]),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, // Start from the top
                    end: Alignment.bottomCenter, // End at the bottom
                    colors: [Colors.transparent,Colors.white54]
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Welcome To Movie Hub\n         ScreenSwoon',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text('The best streaming movie app of the century entertain you every day',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context)=>HomePage()),
                    );
                  },
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(7.0),
                      child: Text(
                        'Let\'s Go',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}