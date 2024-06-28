import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanyLogin extends StatefulWidget {
  const CompanyLogin({Key? key}) : super(key: key);

  @override
  State<CompanyLogin> createState() => _CompanyLogin();
}

class _CompanyLogin extends State<CompanyLogin> {
  final _companyNameController = TextEditingController();
  String? _companyNameError;
  String? _storedCompanyName;
  final _companyPasswordController = TextEditingController();
  String? _companyPasswordError;
  String? _storedCompanyPassword;

  @override
  void dispose() {
    _companyNameController.dispose();
    _companyPasswordController.dispose();
  }

  bool _isCompanyNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty;
  }

  void _submit() {
    setState(() {
      if (_isPasswordValid(_companyPasswordController.text)) {
        _companyPasswordError = null;
        _storedCompanyPassword = _companyPasswordController.text;
      } else {
        _companyPasswordError = "Please check the password again !";
        _storedCompanyPassword = null;
      }
      if (_isCompanyNameValid(_companyNameController.text)) {
        _companyNameError = null;
        _storedCompanyName = _companyNameController.text;
      } else {
        _companyNameError = "Please check company name again !";
        _storedCompanyName = null;
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
              controller: _companyNameController,
              decoration: InputDecoration(
                labelText: 'Company Name / Email',
                errorText: _companyNameError,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _companyPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: 'Password', errorText: _companyPasswordError),
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
                      "Remember me",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
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
                    "or",
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
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Login with",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
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
            SizedBox(height: 20),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      text: "Don't have an Account ? ",
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
                      Navigator.pushNamed(context, '/companySignup');
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
                      text: "Are you a traveller ? ",
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
                      Navigator.pushNamed(context, '/userLogin');
                    },
                    child: Text("Traveller Login"),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
