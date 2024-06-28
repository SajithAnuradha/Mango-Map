import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CompanysignUp extends StatefulWidget {
  const CompanysignUp({Key? key}) : super(key: key);

  @override
  State<CompanysignUp> createState() => _CompanysignUp();
}

class _CompanysignUp extends State<CompanysignUp> {
  final _emailController = TextEditingController();
  String? _emailError;
  String? _storedEmail;
  final _locationController = TextEditingController();
  String? _locationError;
  String? _storedLocation;
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String? _passwordError;
  String? _confirmPasswordError;
  final _contactController = TextEditingController();
  String? _contactError;
  String? _storedContact;
  final _companyNameController = TextEditingController();
  String? _companyNameError;
  String? _storedCompanyName;

  @override
  void dispose() {
    _locationController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _contactController.dispose();
    _companyNameController.dispose();
    super.dispose();
  }

  bool _isCompanyNameValid(String name) {
    return name.isNotEmpty;
  }

  bool _isValidContact(String contact) {
    final contactRegex = RegExp(r'^\d{10}$'); // Example: 10 digit phone number
    return contactRegex.hasMatch(contact);
  }

  bool _isPasswordValid(String password) {
    return password.isNotEmpty; // Add any additional validation logic if needed
  }

  bool _doPasswordsMatch(String password, String confirmPassword) {
    return password == confirmPassword;
  }

  bool _isValidLocation(String location) {
    // Add your custom validation logic here if needed
    return location.isNotEmpty;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    return emailRegex.hasMatch(email);
  }

  void _submit() {
    setState(() {
      if (_isValidEmail(_emailController.text)) {
        _emailError = null;
        _storedEmail = _emailController.text;
        // Handle successful email validation (e.g., store the email or navigate to another screen)
      } else {
        _emailError = 'Please enter a valid email';
        _storedEmail = null;
      }
      if (_isValidLocation(_locationController.text)) {
        _locationError = null;
        _storedLocation = _locationController.text;
        // Handle successful location validation (e.g., store the location or navigate to another screen)
      } else {
        _locationError = 'Please enter a valid location';
        _storedLocation = null;
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
      if (_isValidContact(_contactController.text)) {
        _contactError = null;
        _storedContact = _contactController.text;
        // Handle successful contact validation (e.g., store the contact or navigate to another screen)
      } else {
        _contactError = 'Please enter a valid contact number';
        _storedContact = null;
      }
      if (_isCompanyNameValid(_companyNameController.text)) {
        _companyNameError = null;
        _storedCompanyName = _companyNameController.text;
      } else {
        _companyNameError = "Please enter a valid company name";
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
                  labelText: 'Company Name', errorText: _companyNameError),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _contactController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                labelText: 'Contact No.',
                errorText: _contactError,
              ),
            ),
            SizedBox(
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
            SizedBox(
              height: 20,
            ),
            // input location should be a input field here
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                errorText: _passwordError,
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirm Password',
                errorText: _confirmPasswordError,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
                errorText: _locationError,
              ),
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
                      Navigator.pushNamed(context, '/companyLogin');
                    },
                    child: Text("Log in"),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
