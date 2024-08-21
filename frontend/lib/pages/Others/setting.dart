import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key, required this.title});

  final String title;

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  late String searchText = '';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              const SizedBox(height: 10.0),
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
                    title: const Text('Log in'),
                  ),
                  ListTile(
                    title: const Text(
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

class SearchCard extends StatefulWidget {
  const SearchCard({super.key, this.onChanged});

  final ValueChanged<String>? onChanged;

  @override
  // ignore: library_private_types_in_public_api
  _SearchCardState createState() => _SearchCardState();
}

class _SearchCardState extends State<SearchCard> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        decoration: const InputDecoration(
          hintText: 'Search',
          prefixIcon: Icon(Icons.search),
          contentPadding:
              EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class SectionCard extends StatelessWidget {
  const SectionCard({super.key, required this.title, required this.children});

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
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ...children,
        ],
      ),
    );
  }
}

class SettingListTile extends StatelessWidget {
  const SettingListTile(
      {super.key, required this.icon, required this.text, this.onTap});

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_rounded),
      onTap: onTap,
    );
  }
}
