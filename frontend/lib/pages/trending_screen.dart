import 'package:flutter/material.dart';

class TrendingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Trending Locations'),
      ),
      body: ListView.builder(
        itemCount: 5,  // The number of trending locations
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10.0),
            child: ListTile(
              leading: Image.network('https://via.placeholder.com/150'),
              title: Text('Sigiriya'),
              subtitle: Text(
                  'Sigiriya, also known as Lion Rock, is an ancient rock fortress in Sri Lanka, renowned for its stunning frescoes, landscaped gardens, and remarkable archaeological significance.'),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Overall Rating:'),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(5, (index) => Icon(Icons.star, size: 15, color: Colors.blue)),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text('See Location', style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
