import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UserLogIn extends StatefulWidget {
  const UserLogIn({Key? key}) : super(key: key);

  @override
  State<UserLogIn> createState() => _UserLogIn();
}

class _UserLogIn extends State<UserLogIn> {
  final _userNameController = TextEditingController();
  String? _userNameError;
  String? _storedUserName;
  final _userPasswordController = TextEditingController();
  String? _userPasswordError;
  String? _storedUserPassword;

  @override
  void dispose() {
    _userNameController.dispose();
    _userPasswordController.dispose();
  }

  bool _isUserNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  void _submit() {
    setState(() {
      if (_isPasswordValid(_userPasswordController.text)) {
        _userPasswordError = null;
        _storedUserPassword = _userPasswordController.text;
      } else {
        _userPasswordError = "Please check the password again !";
        _storedUserPassword = null;
      }
      if (_isUserNameValid(_userNameController.text)) {
        _userNameError = null;
        _storedUserName = _userNameController.text;
      } else {
        _userNameError = "Please check user name again !";
        _storedUserName = null;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenHeight * 0.05;
    return Padding(
        padding: EdgeInsets.only(top: topPadding), // Top padding of 20 pixels
        child: Column(
          children: [
            TextField(
              controller: _userNameController,
              decoration: InputDecoration(
                labelText: 'Username / Email',
                errorText: _userNameError,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _userPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', errorText: _userPasswordError),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (value) {}),
                    Text(
                      'Remember me',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: () {},
                  child: Text("Forgot Password?"),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () => _submit(),
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
                "Login",
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
                  child: Text(
                    'or',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                Expanded(child: Divider()),
              ],
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login with',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
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
            SizedBox(height: 40),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/userSignup');
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Company User ? ",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/companyLogin');
                    },
                    child: Text("Compnay user Login"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
