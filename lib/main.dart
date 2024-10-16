import 'package:flutter/material.dart';
import 'package:movie_rohit/Pages/Home.dart';
import 'package:movie_rohit/Pages/Profile.dart';
import 'package:movie_rohit/Pages/Welcome.dart';
import 'Pages/DropDown.dart';
import 'Pages/start_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: WelcomePage(),
    );
  }
}
