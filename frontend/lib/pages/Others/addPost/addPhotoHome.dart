import 'package:flutter/material.dart';
import 'addPhotoQR.dart';

class Addphotohome extends StatefulWidget {
  const Addphotohome({super.key});

  @override
  _AddphotohomeState createState() => _AddphotohomeState();
}

class _AddphotohomeState extends State<Addphotohome> {
  int _selectedIndex = 0;
  bool _showPopupMenu = false;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _togglePopupMenu() {
    setState(() {
      _showPopupMenu = !_showPopupMenu;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Photo'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: _togglePopupMenu,
        child: const Icon(Icons.add),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          if (_showPopupMenu)
            Positioned(
              bottom: 40, // Adjust this value to position the menu correctly
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.purple, width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.qr_code_scanner,
                            color: Colors.purple),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Addphotoqr(),
                            ),
                          );
                          _togglePopupMenu();
                        },
                      ),
                      const Text('Scan',
                          style: TextStyle(color: Colors.purple)),
                      const SizedBox(height: 10),
                      IconButton(
                        icon: const Icon(Icons.photo_camera,
                            color: Colors.purple),
                        onPressed: () {
                          _togglePopupMenu();
                        },
                      ),
                      const Text('Add', style: TextStyle(color: Colors.purple)),
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
