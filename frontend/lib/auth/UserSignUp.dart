import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserSignUp extends StatelessWidget {
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
                  labelText: 'Username',
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
            Row(
              children: [
                Expanded(child: Divider()),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Text("or"),
                ),
                Expanded(child: Divider()),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Sign in with",
                style: TextStyle(fontSize: 16),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
                  onPressed: () {
                    // Handle Facebook sign-in
                  },
                  iconSize: screenWidth * 0.1,
                ),
                SizedBox(width: screenWidth * 0.05),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.google,
                      color: Color.fromARGB(255, 0, 145, 65)),
                  onPressed: () {
                    // Handle Google sign-in
                  },
                  iconSize: screenWidth * 0.1,
                ),
                SizedBox(width: screenWidth * 0.05),
                IconButton(
                  icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
                  onPressed: () {
                    // Handle Apple sign-in
                  },
                  iconSize: screenWidth * 0.1,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: "Already have an account? ",
                style: TextStyle(color: Colors.black),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Login',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
