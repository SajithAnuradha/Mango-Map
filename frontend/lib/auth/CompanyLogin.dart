// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class CompanyLogin extends StatefulWidget {
//   const CompanyLogin({Key? key}) : super(key: key);

//   @override
//   State<CompanyLogin> createState() => _CompanyLogin();
// }

// class _CompanyLogin extends State<CompanyLogin> {
//   final _companyNameController = TextEditingController();
//   String? _companyNameError;
//   String? _storedCompanyName;
//   final _companyPasswordController = TextEditingController();
//   String? _companyPasswordError;
//   String? _storedCompanyPassword;

//   @override
//   void dispose() {
//     _companyNameController.dispose();
//     _companyPasswordController.dispose();
//   }

//   bool _isCompanyNameValid(String name) {
//     return name.isNotEmpty;
//   }

//   bool _isPasswordValid(String password) {
//     return password.isNotEmpty;
//   }

//   void _submit() {
//     setState(() {
//       if (_isPasswordValid(_companyPasswordController.text)) {
//         _companyPasswordError = null;
//         _storedCompanyPassword = _companyPasswordController.text;
//       } else {
//         _companyPasswordError = "Please check the password again !";
//         _storedCompanyPassword = null;
//       }
//       if (_isCompanyNameValid(_companyNameController.text)) {
//         _companyNameError = null;
//         _storedCompanyName = _companyNameController.text;
//       } else {
//         _companyNameError = "Please check company name again !";
//         _storedCompanyName = null;
//       }
//     });
//     if (_storedCompanyName != null && _storedCompanyPassword != null) {
//       fetchData();
//     }
//   }

//   Future<void> fetchData() async {
//     // APi for verify the company login with the backend
//     final url = Uri.parse('https://dummy.restapiexample.com/api/v1/create');

//     Map<String, dynamic> data = {
//       // this data is for sample. this should be password and username
//       "status": "success",
//       "data": {"name": "test", "salary": "123", "age": "23", "id": 25}
//     };

//     try {
//       final response = await http.post(
//         url,
//         body: jsonEncode(data), // for post request
//         headers: {"Content-Type": "application/json"},
//       );
//       if (response.statusCode == 200) {
//         final data = jsonDecode(response.body) as Map<String, dynamic>;

//         print(data);
//         // route to the main dashboard if success
//         // after successful login, user should route to relavent page
//         // if not valid login
//         //  _companyNameError = "Invalid company. Try again !";
//         // _storedCompanyName = null;
//         // _companyPasswordError = "Invalid password. Try again !";
//         // _storedCompanyPassword = null;
//       } else {
//         print('Error: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
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
//               controller: _companyNameController,
//               decoration: InputDecoration(
//                 labelText: 'Company Name / Email',
//                 errorText: _companyNameError,
//               ),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             TextField(
//               controller: _companyPasswordController,
//               obscureText: true,
//               decoration: InputDecoration(
//                   labelText: 'Password', errorText: _companyPasswordError),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     Checkbox(value: false, onChanged: (value) {}),
//                     Text(
//                       "Remember me",
//                       style: TextStyle(
//                         color: Colors.grey,
//                         fontSize: 16.0,
//                         fontWeight: FontWeight.bold,
//                         fontStyle: FontStyle.italic,
//                       ),
//                     ),
//                   ],
//                 ),
//                 TextButton(
//                   onPressed: () {},
//                   child: Text("Forgot Password?"),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () => _submit(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.purple,
//                 padding: EdgeInsets.symmetric(horizontal: 60, vertical: 1),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(screenWidth * 0.01),
//                 ),
//                 animationDuration: Duration(seconds: 2),
//                 fixedSize: Size(screenWidth * 0.9, 30),
//               ),
//               child: Text(
//                 "Login",
//                 style: TextStyle(fontSize: 20, color: Colors.white),
//               ),
//             ),
//             SizedBox(
//               height: 15,
//             ),
//             Row(
//               children: [
//                 Expanded(child: Divider()),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 10),
//                   child: Text(
//                     "or",
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
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Login with",
//                 style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 16.0,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: <Widget>[
//                 IconButton(
//                   icon: FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
//                   onPressed: () {
//                     // Handle Facebook sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 IconButton(
//                   icon: FaIcon(FontAwesomeIcons.google,
//                       color: Color.fromARGB(255, 0, 145, 65)),
//                   onPressed: () {
//                     // Handle Google sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//                 SizedBox(width: screenWidth * 0.05),
//                 IconButton(
//                   icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black),
//                   onPressed: () {
//                     // Handle Apple sign-in
//                   },
//                   iconSize: screenWidth * 0.1,
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       text: "Don't have an Account ? ",
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
//                       Navigator.pushNamed(context, '/companySignup');
//                     },
//                     child: Text("Sign Up"),
//                   ),
//                 ],
//               ),
//             ),
//             Center(
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   RichText(
//                     text: TextSpan(
//                       text: "Are you a traveller ? ",
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
//                       Navigator.pushNamed(context, '/userLogin');
//                     },
//                     child: Text("Traveller Login"),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/CompanySignUp.dart';
import 'package:flutter_application_1/auth/UserLogin.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    super.dispose();
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
    if (_storedCompanyName != null && _storedCompanyPassword != null) {
      fetchData();
    }
  }

  Future<void> fetchData() async {
    final url = Uri.parse('https://dummy.restapiexample.com/api/v1/create');

    Map<String, dynamic> data = {
      "status": "success",
      "data": {"name": "test", "salary": "123", "age": "23", "id": 25}
    };

    try {
      final response = await http.post(
        url,
        body: jsonEncode(data),
        headers: {"Content-Type": "application/json"},
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        print(data);
        // Navigate to dashboard or handle success case
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    double topPadding = screenHeight * 0.05;

    return MaterialApp(
      // Wrap with MaterialApp for navigation and material design features
      home: Scaffold(
        appBar: AppBar(
          title: Text('Company Login'), // Replace with your app title
        ),
        body: Padding(
          padding: EdgeInsets.only(top: topPadding),
          child: SingleChildScrollView(
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
                  controller: _companyNameController,
                  decoration: InputDecoration(
                    labelText: 'Company Name / Email',
                    errorText: _companyNameError,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  controller: _companyPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    errorText: _companyPasswordError,
                  ),
                ),
                SizedBox(height: 20),
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
                SizedBox(height: 20),
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
                SizedBox(height: 15),
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
                      icon:
                          FaIcon(FontAwesomeIcons.facebook, color: Colors.blue),
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const CompanysignUp()));
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
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const UserLogIn()));
                        },
                        child: Text("Traveller Login"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
