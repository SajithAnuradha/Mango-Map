import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/CompanyLogin.dart';
import 'package:flutter_application_1/auth/UserLogin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import './response/User.dart';

Future<User> createUser(String firstName, String lastName, String email,
    String userName, String password) async {
  final response = await http.post(
    Uri.parse("http://localhost:8888/api/v1/register/normal"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      "firstName": firstName,
      "lastName": lastName,
      'email': email,
      'username': userName,
      'password': password,
    }),
  );

  if (response.statusCode == 200) {
    return new User(id: json.decode(response.body)['id'], userName: userName);
  } else {
    throw Exception('Failed to create user.');
  }
}

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUp();
}

class _UserSignUp extends State<UserSignUp> {
  final _firstNameController = TextEditingController();
  String? _firstNameError = '';
  String? _storedFirstName = '';
  final _lastNameController = TextEditingController();
  String? _lastNameError = '';
  String? _storedLastName = '';
  final _emailController = TextEditingController();
  String? _emailError;
  String? _storedEmail;
  final _userNameController = TextEditingController();
  String? _userNameError;
  String? _storedUserName;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _passwordError;
  String? _confirmPasswordError;

  Future<User>? _futureUser;

  bool isLoading = false;

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userNameController.dispose();
    super.dispose();
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty; // Add any additional validation logic if needed
  }

  bool _doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool _isUserNameValid(String name) {
    return name.isNotEmpty;
  }

  void _submit() {
    setState(() {
      isLoading = true;
      if (_isValidEmail(_emailController.text)) {
        _emailError = null;
        _storedEmail = _emailController.text;
        // Handle successful email validation (e.g., store the email or navigate to another screen)
      } else {
        _emailError = 'Please enter a valid email';
        _storedEmail = null;
      }

      final password = _passwordController.text;
      final confirmPassword = _confirmPasswordController.text;

      if (_isPasswordValid(password) &&
          _doPasswordsMatch(password, confirmPassword)) {
        _passwordError = null;
        _confirmPasswordError = null;
        // Handle successful password validation and matching (e.g., proceed to next step)
      } else {
        if (!_isPasswordValid(password)) {
          _passwordError = 'Please enter a valid password';
        } else {
          _passwordError = null;
        }

        if (!_doPasswordsMatch(password, confirmPassword)) {
          _confirmPasswordError = 'Passwords do not match';
        } else {
          _confirmPasswordError = null;
        }
      }

      if (_isUserNameValid(_userNameController.text)) {
        _userNameError = null;
        _storedUserName = _userNameController.text;
      } else {
        _userNameError = "Please enter a valid user name";
        _storedUserName = null;
      }

      if (_firstNameController.text.isNotEmpty) {
        _firstNameError = null;
        _storedFirstName = _firstNameController.text;
      } else {
        _firstNameError = "Please enter a valid first name";
        _storedFirstName = null;
      }

      if (_lastNameController.text.isNotEmpty) {
        _lastNameError = null;
        _storedLastName = _lastNameController.text;
      } else {
        _lastNameError = "Please enter a valid last name";
        _storedLastName = null;
      }
    });

    _futureUser = createUser(_storedFirstName!, _storedLastName!, _storedEmail!,
        _storedUserName!, _passwordController.text);

    if (_futureUser != null) {
      _futureUser!
          .then((value) => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const UserLogIn())))
          .catchError((error) => print("Error: $error"));
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenHeight * 0.05;

    return Scaffold(
      appBar: AppBar(
        title: Text('User Sign Up'), // Example: Replace with your app title
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.1),
          child: Column(
            children: [
              FractionallySizedBox(
                widthFactor: 0.7,
                child: Image.asset(
                  'assets/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(height: topPadding),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  errorText: _firstNameError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _lastNameController,
                decoration: InputDecoration(
                  labelText: 'Last Name',
                  errorText: _lastNameError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'User name',
                  errorText: _userNameError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: _emailError,
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _passwordError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  errorText: _confirmPasswordError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () => isLoading ? null : _submit(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01),
                  ),
                  animationDuration: Duration(seconds: 1),
                  fixedSize: Size(screenWidth * 0.9, 30),
                ),
                child: isLoading
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : Text(
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
                    child: Text(
                      "or",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16.0,
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
                  "Sign in with",
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
                        text: "Have an Account ? ",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserLogIn()));
                      },
                      child: Text("Log in"),
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
                        text: "company user ? ",
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CompanyLogin()));
                      },
                      child: Text("company Log in"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  FutureBuilder<User> buildFutureBuilder() {
    return FutureBuilder<User>(
      future: _futureUser,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text("User registered successfully");
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        return const CircularProgressIndicator();
      },
    );
  }
}
