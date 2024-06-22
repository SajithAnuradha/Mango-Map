import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanysignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenHeight * 0.05;
    return Padding(
        padding: EdgeInsets.only(top: topPadding), // Top padding of 20 pixels
        child: Column(
          children: [
            SizedBox(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Company Name',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Contact No.',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // input location should be a input field here
            SizedBox(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  labelText: 'Location',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                padding: EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(screenWidth * 0.01),
                ),
                animationDuration: Duration(seconds: 2),
                fixedSize: Size(screenWidth * 0.9, 30),
              ),
              child: Text(
                "Sign Up",
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ));
  }
}
