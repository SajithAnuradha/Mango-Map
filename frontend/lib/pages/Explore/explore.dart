import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Explore(),
//     );
//   }
// }

class Explore extends StatelessWidget {
  final List<String> imagePaths = [
    'assets/image1.png',
    'assets/image2.png',
    'assets/image3.png',
    'assets/image4.png',
    'assets/image5.png',
    'assets/image6.png',
    'assets/image7.png',
    'assets/image8.png',
    'assets/image9.png',
    'assets/image10.png',
    'assets/image11.png',
    'assets/image12.png',
    'assets/image13.png',
    'assets/image14.png',
    'assets/image15.png',
    'assets/image16.png',
    'assets/image17.png',
    'assets/image18.png',
    'assets/image19.png',
    'assets/image20.png',
    'assets/image21.png',
  ];

  Explore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: GridView.custom(
          gridDelegate: SliverQuiltedGridDelegate(
            crossAxisCount: 4,
            mainAxisSpacing: 1,
            crossAxisSpacing: 1,
            repeatPattern: QuiltedGridRepeatPattern.inverted,
            pattern: [
              const QuiltedGridTile(2, 2),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 1),
              const QuiltedGridTile(1, 2),
            ],
          ),
          childrenDelegate: SliverChildBuilderDelegate(
            (context, index) => Image.asset(
              imagePaths[index],
              fit: BoxFit.cover,
            ),
            childCount: imagePaths.length,
          ),
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.explore),
      //       label: 'Explore',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.add),
      //       label: 'Add',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.map),
      //       label: 'Map',
      //     ),
      //   ],
      //   selectedItemColor: Colors.purple,
      // ),
    );
  }
}
