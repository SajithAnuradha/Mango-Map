import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key, required this.title});

  final String title;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Align(
        alignment: Alignment.topLeft,
        child: Column(
          children: <Widget>[
            // Card(
            //   elevation: 5.0,
            //   child: TextField(
            //     decoration: InputDecoration(
            //       hintText: 'Search',
            //       prefixIcon: Icon(Icons.search),
            //     ),
            //   ),
            // ),
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Text(
                    'Your Account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.person_outlined),
                    title: Text('Your personal details, security'),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Text(
                    'How to use Mango Map',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.saved_search_rounded),
                    title: Text('Saved'),
                  ),
                  ListTile(
                    leading: Icon(Icons.place_outlined),
                    title: Text('Your Places'),
                  ),
                  ListTile(
                    leading: Icon(Icons.notifications_outlined),
                    title: Text('Notifications'),
                  ),
                  ListTile(
                    leading: Icon(Icons.reviews_outlined),
                    title: Text('Your Reviews'),
                  ),
                  ListTile(
                    leading: Icon(Icons.payment),
                    title: Text('Payments'),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  Text(
                    'For Professionals',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.account_box_outlined),
                    title: Text('Account Type'),
                  ),
                  ListTile(
                    leading: Icon(Icons.verified_outlined),
                    title: Text('Verified'),
                  ),
                ],
              ),
            ),
            Card(
              elevation: 5.0,
              child: Column(
                children: [
                  ListTile(
                    title: Text('Log in'),
                  ),
                  ListTile(
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Color.fromARGB(255, 201, 58, 48)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
