import 'package:flutter/material.dart';

class TrendingLocations extends StatelessWidget {
  final VoidCallback onClose;

  TrendingLocations({required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      'Trending',
                      style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue,),
                    ),
                    Icon(
                      Icons.local_fire_department,
                      color: Colors.blue,
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(Icons.close),
                  onPressed: onClose,
                ),
              ],
            ),
          ),
           Divider(
            color: Colors.blue,
            thickness: 3.0, 
          ),

          Expanded(
            child: ListView.builder(
            padding: EdgeInsets.only(top: 2.0),
              itemCount: 8,
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
          ),
        ],
      ),
    );
  }
}
