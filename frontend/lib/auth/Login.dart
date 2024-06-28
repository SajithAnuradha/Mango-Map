import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'CategorySelector.dart';
import 'UserSignUp.dart';
import 'CompanySignUp.dart';
import 'CompanyLogin.dart';
import 'UserLogin.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double fullHeight = MediaQuery.of(context).size.height;

    return Container(
        color: Colors.white,
        height: fullHeight,
        child: Padding(
            padding: EdgeInsets.all(
              MediaQuery.of(context).size.width * 0.1,
            ),
            child: SingleChildScrollView(
                child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Column(
                      children: [
                        FractionallySizedBox(
                          widthFactor: 0.7,
                          child: Image.asset(
                            'assets/logo.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                        MaterialApp(
                          initialRoute: '/',
                          routes: {
                            '/': (context) => CategorySelector(),
                            '/userLogin': (context) => UserLogIn(),
                            '/userSignup': (context) => UserSignUp(),
                            '/companyLogin': (context) => CompanyLogin(),
                            '/companySignup': (contxet) => CompanysignUp()
                          },
                        )
                        // UserLogIn(),
                        // CompanyLogin(),
                        // UserSignUp(),
                        // CompanysignUp(),
                        // CategorySelector(),
                      ],
                    )))));
  }
}
