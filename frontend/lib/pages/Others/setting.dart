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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Align(
        alignment: Alignment.centerLeft,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SearchCard(
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              SectionCard(
                title: 'Your Account',
                children: [
                  SettingListTile(
                    icon: Icons.person_outlined,
                    text: 'Your personal details, security',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                ],
              ),
              SectionCard(
                title: 'How to use Mango Map',
                children: [
                  SettingListTile(
                    icon: Icons.saved_search_rounded,
                    text: 'Saved',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  SettingListTile(
                    icon: Icons.place_outlined,
                    text: 'Your Places',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  SettingListTile(
                    icon: Icons.notifications_outlined,
                    text: 'Notifications',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  SettingListTile(
                    icon: Icons.reviews_outlined,
                    text: 'Your Reviews',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  SettingListTile(
                    icon: Icons.payment,
                    text: 'Payments',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                ],
              ),
              SectionCard(
                title: 'For Professionals',
                children: [
                  SettingListTile(
                    icon: Icons.account_box_outlined,
                    text: 'Account Type',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  SettingListTile(
                    icon: Icons.verified_outlined,
                    text: 'Verified',
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                ],
              ),
              SectionCard(
                title: '',
                children: [
                  ListTile(
                    title: Text('Log in'),
                    onTap: () {
                      // Handle tile tap
                    },
                  ),
                  ListTile(
                    title: Text(
                      'Log out',
                      style: TextStyle(color: Color.fromARGB(255, 201, 58, 48)),
                    ),
                    onTap: () {
                      // Handle tile tap
                    },
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
