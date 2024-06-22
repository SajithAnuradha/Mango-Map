import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Categoryselector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 150),
          CustomButton(
            text: 'User',
            onPressed: () {
              // Handle User button press
            },
          ),
          Row(
            children: <Widget>[
              Expanded(child: Divider(color: Colors.black)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Text('or'),
              ),
              Expanded(child: Divider(color: Colors.black)),
            ],
          ),
          SizedBox(height: 20),
          CustomButton(
            text: 'Company',
            onPressed: () {
              // Handle Company button press
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
