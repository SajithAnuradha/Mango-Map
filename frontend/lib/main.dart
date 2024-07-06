import 'package:flutter/material.dart';
import '../pages/map_screen.dart';
import '../pages/trending_screen.dart';
import 'package:flutter_application_1/pages/Others/addPost/addPhotoHome.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mango Map Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MapScreen(),
    );
  }
}

