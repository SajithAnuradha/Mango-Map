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
    return const Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchCard(),
              SectionCard(
                title: 'Your Account',
                children: [
                  SettingListTile(
                    icon: Icons.person_outlined,
                    text: 'Your personal details, security',
                  ),
                ],
              ),
              SectionCard(
                title: 'How to use Mango Map',
                children: [
                  SettingListTile(
                    icon: Icons.saved_search_rounded,
                    text: 'Saved',
                  ),
                  SettingListTile(
                    icon: Icons.place_outlined,
                    text: 'Your Places',
                  ),
                  SettingListTile(
                    icon: Icons.notifications_outlined,
                    text: 'Notifications',
                  ),
                  SettingListTile(
                    icon: Icons.reviews_outlined,
                    text: 'Your Reviews',
                  ),
                  SettingListTile(
                    icon: Icons.payment,
                    text: 'Payments',
                  ),
                ],
              ),
              SectionCard(
                title: 'For Professionals',
                children: [
                  SettingListTile(
                    icon: Icons.account_box_outlined,
                    text: 'Account Type',
                  ),
                  SettingListTile(
                    icon: Icons.verified_outlined,
                    text: 'Verified',
                  ),
                ],
              ),
              SectionCard(
                title: '',
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
            ],
          ),
        ),
      ),
    );
  }
}

class SearchCard extends StatelessWidget {
  const SearchCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Card(
      elevation: 5.0,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({Key? key, required this.title, required this.children})
      : super(key: key);

  final String title;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (title.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
    );
  }
}
