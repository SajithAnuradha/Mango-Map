// import 'package:flutter/material.dart';
// import 'addPhotoQR.dart';
// import 'addPhotoDefault.dart';

// class Addphotohome extends StatefulWidget {
//   const Addphotohome({super.key});

//   @override
//   _AddphotohomeState createState() => _AddphotohomeState();
// }

// class _AddphotohomeState extends State<Addphotohome> {
//   int _selectedIndex = 0;
//   bool _showPopupMenu = false;

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   void _togglePopupMenu() {
//     setState(() {
//       _showPopupMenu = !_showPopupMenu;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Add Photo'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[

//           BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
//           BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Map'),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//       floatingActionButton: FloatingActionButton(
//         onPressed: _togglePopupMenu,
//         child: const Icon(Icons.add),
//       ),
//       body: Stack(
//         alignment: Alignment.center,
//         children: [
//           if (_showPopupMenu)
//             Positioned(
//               bottom: 40, // Adjust this value to position the menu correctly
//               child: Material(
//                 color: Colors.transparent,
//                 child: Container(
//                   padding:
//                       const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(20),
//                     border: Border.all(color: Colors.purple, width: 1),
//                   ),
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.qr_code_scanner,
//                             color: Colors.purple),
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => const Addphotoqr(),
//                             ),
//                           );
//                           _togglePopupMenu();
//                         },
//                       ),
//                       const Text('Scan',
//                           style: TextStyle(color: Colors.purple)),
//                       const SizedBox(height: 10),
//                       IconButton(
//                         icon: const Icon(Icons.photo_camera,
//                             color: Colors.purple),
//                         onPressed: () {
//                           Navigator.of(context).push(
//                             MaterialPageRoute(
//                               builder: (context) => const Addphotodefault(),
//                             ),
//                           );
//                           _togglePopupMenu();
//                         },
//                       ),
//                       const Text('Add', style: TextStyle(color: Colors.purple)),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Explore/explore.dart';
import 'package:flutter_application_1/pages/home.dart';
import 'addPhotoQR.dart';
import 'addPhotoDefault.dart';
import 'package:flutter_application_1/pages/map/map_screen.dart';

class Addphotohome extends StatefulWidget {
  const Addphotohome({super.key});

  @override
  _AddphotohomeState createState() => _AddphotohomeState();
}

class _AddphotohomeState extends State<Addphotohome> {
  int _selectedIndex = 0;
  bool _showPopupMenu = false;

  final List<Widget> _pages = <Widget>[
    Home(), // Your Home page implementation
    Placeholder(), // Replace Placeholder with your Map page implementation
    Explore(), // Add your Explore page implementation here
    MapScreen(), // Replace Placeholder with your Map page implementation
  ];

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
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () => _onItemTapped(0),
            ),
            IconButton(
              icon: Icon(Icons.add),
              onPressed: _togglePopupMenu,
            ),
            IconButton(
              icon: Icon(Icons.explore),
              onPressed: () => _onItemTapped(2),
            ),
            IconButton(
              icon: Icon(Icons.map),
              onPressed: () => _onItemTapped(3),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Stack(
        alignment: Alignment.center,
        children: [
          // Main content based on selected index
          _pages.elementAt(_selectedIndex),

          // Popup menu
          if (_showPopupMenu)
            Positioned(
              bottom: 5, // Adjust this value to position the menu correctly
              left: 110,
              right: 210,
              child: Material(
                color: Colors.transparent,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.qr_code_scanner,
                            color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Addphotoqr(),
                            ),
                          );
                          _togglePopupMenu();
                        },
                      ),
                      const Text('Scan', style: TextStyle(color: Colors.black)),
                      const SizedBox(height: 10),
                      IconButton(
                        icon:
                            const Icon(Icons.photo_camera, color: Colors.black),
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const Addphotodefault(),
                            ),
                          );
                          _togglePopupMenu();
                        },
                      ),
                      const Text('Add', style: TextStyle(color: Colors.black)),
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
