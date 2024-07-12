// // ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';

import 'auth/Login.dart';

void main() => runApp(MongoMap());

class MongoMap extends StatelessWidget {
  const MongoMap({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}
