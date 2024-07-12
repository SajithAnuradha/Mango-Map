import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/CompanyLogin.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'UserLogin.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _Categoryselector();
}

class _Categoryselector extends State<CategorySelector> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const SizedBox(height: 150),
          CustomButton(
            text: 'User',
            onPressed: () {
              // Navigator.pushNamed(context, '/userLogin');
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserLogIn()));
            },
          ),
          const Row(
            children: <Widget>[
              Expanded(child: Divider(color: Colors.black)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
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
              Expanded(child: Divider(color: Colors.black)),
            ],
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Company',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CompanyLogin()));
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  CustomButton({
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple, // Button color
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
