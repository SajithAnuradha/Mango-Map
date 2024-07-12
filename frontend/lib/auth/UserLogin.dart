// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:flutter_application_1/pages/home.dart';

// class UserLogIn extends StatefulWidget {
//   const UserLogIn({Key? key}) : super(key: key);

//   @override
//   State<UserLogIn> createState() => _UserLogIn();
// }

// class _UserLogIn extends State<UserLogIn> {
//   final _userNameController = TextEditingController();
//   String? _userNameError;
//   String? _storedUserName;
//   final _userPasswordController = TextEditingController();
//   String? _userPasswordError;
//   String? _storedUserPassword;

//   @override
//   void dispose() {
//     _userNameController.dispose();
//     _userPasswordController.dispose();
//   }

//   bool _isUserNameValid(String name) {
//     return name.isNotEmpty;
//   }

//   bool _isPasswordValid(String password) {
//     return password.isNotEmpty;
//   }

//   void _submit() {
//     setState(() {
//       if (_isPasswordValid(_userPasswordController.text)) {
//         _userPasswordError = null;
//         _storedUserPassword = _userPasswordController.text;
//       } else {
//         _userPasswordError = "Please check the password again !";
//         _storedUserPassword = null;
//       }
//       if (_isUserNameValid(_userNameController.text)) {
//         _userNameError = null;
//         _storedUserName = _userNameController.text;
//       } else {
//         _userNameError = "Please check user name again !";
//         _storedUserName = null;
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenHeight = MediaQuery.of(context).size.height;
//     double screenWidth = MediaQuery.of(context).size.width;
//     double topPadding = screenHeight * 0.05;
//     return Padding(
//         padding: EdgeInsets.only(top: topPadding), // Top padding of 20 pixels
//         child: Column(
//           children: [
//             TextField(
//               controller: _userNameController,
//               decoration: InputDecoration(
//                 labelText: 'Username / Email',
//                 errorText: _userNameError,
//               ),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: _userPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                   labelText: 'Password', errorText: _userPasswordError),
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(value: false, onChanged: (value) {}),
//                     const Text(
//                       'Remember me',
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16.0,
//                       ),
//                     ),
//                   ],
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: const Text("Forgot Password?"),
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () => {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => const Home(),
//                   ),
//                 )
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 60, vertical: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.01),
//                 ),
//                 animationDuration: const Duration(seconds: 2),
//                 fixedSize: Size(screenWidth * 0.9, 30),
//               ),
//               child: const Text(
//                 "Login",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//             const SizedBox(
//               height: 15,
//             ),
//             const Row(
//               children: [
//                 Expanded(child: Divider()),
//                 Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     'or',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 16.0,
//                       fontWeight: FontWeight.bold,
//                       fontStyle: FontStyle.italic,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: Divider()),
//               ],
//             ),
//             const SizedBox(height: 20),
//             const Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 'Login with',
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16.0,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.facebook,
//                       color: Colors.blue),
//                   onPressed: () {
//                     // Handle Facebook sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 IconButton(
//                   icon: const FaIcon(FontAwesomeIcons.google,
//                       color: Color.fromARGB(255, 0, 145, 65)),
//                   onPressed: () {
//                     // Handle Google sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 IconButton(
//                   icon:
//                       const FaIcon(FontAwesomeIcons.apple, color: Colors.black),
//                   onPressed: () {
//                     // Handle Apple sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 40),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: const TextSpan(
//                       text: "Don't have an account? ",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/userSignup');
//                     },
//                     child: const Text("Sign Up"),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: const TextSpan(
//                       text: "Company User ? ",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.pushNamed(context, '/companyLogin');
//                     },
//                     child: const Text("Compnay user Login"),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/CompanyLogin.dart';
import 'package:flutter_application_1/auth/UserSignUp.dart';
import 'package:flutter_application_1/pages/Others/addPost/addPhotoHome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/pages/home.dart'; // Import your home page

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
    super.dispose();
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
    double topPadding = screenHeight * 0.1; // Adjust the top padding as needed

    return Scaffold(
      appBar: AppBar(
        title: Text('User Login'), // Example: Replace with your app title
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
                controller: _userNameController,
                decoration: InputDecoration(
                  labelText: 'Username / Email',
                  errorText: _userNameError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _userPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: _userPasswordError,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      const Text(
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
                    child: const Text("Forgot Password?"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Addphotohome(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.01),
                  ),
                  animationDuration: const Duration(seconds: 2),
                  fixedSize: Size(screenWidth * 0.9, 30),
                ),
                child: const Text(
                  "Login",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              const Row(
                children: [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
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
              const SizedBox(height: 20),
              const Align(
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
                    icon: const FaIcon(FontAwesomeIcons.facebook,
                        color: Colors.blue),
                    onPressed: () {
                      // Handle Facebook sign-in
                    },
                    iconSize: screenWidth * 0.1,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.google,
                        color: Color.fromARGB(255, 0, 145, 65)),
                    onPressed: () {
                      // Handle Google sign-in
                    },
                    iconSize: screenWidth * 0.1,
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  IconButton(
                    icon: const FaIcon(FontAwesomeIcons.apple,
                        color: Colors.black),
                    onPressed: () {
                      // Handle Apple sign-in
                    },
                    iconSize: screenWidth * 0.1,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const UserSignUp()));
                      },
                      child: const Text("Sign Up"),
                    ),
                  ],
                ),
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                      text: const TextSpan(
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const CompanyLogin()));
                      },
                      child: const Text("Compnay user Login"),
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
}