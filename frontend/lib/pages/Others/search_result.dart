import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SearchResultsScreen extends StatelessWidget {
  SearchResultsScreen({super.key});
  final List<String> imagePaths = [
    'image17.png',
    'image18.png',
    'image19.png',
    'image20.png',
    'image21.png',
    'image6.png',
    'image7.png',
    'image8.png',
    'image9.png',
    'image10.png',
    'image11.png',
    'image12.png',
    'image13.png',
    'image14.png',
    'image15.png',
    'image3.png',
    'image16.png',
    'image1.png',
    'image2.png',
    'image4.png',
    'image5.png',
  ];

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            const SizedBox(height: 10.0),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildSearchRow(context),
                    const SizedBox(height: 10.0),
                    Container(
                      width: double.maxFinite,
                      margin: const EdgeInsets.only(
                        left: 12.0, // Corrected margin
                        right: 12.0, // Corrected margin
                      ),
                      decoration: const BoxDecoration(
                        color: Colors
                            .white, // Assuming AppDecoration.fillWhiteA is a white background
                      ),
                      child: Column(
                        children: [
                          _trendingMessageRow(
                            context,
                            subtitle:
                                'Lake Geneva (Lac Léman) : Known for its....',
                          ),
                          _trendingMessageRow(
                            context,
                            subtitle:
                                'Lake Zurich (Zürichsee) : Known for its Mediterranean climate....',
                          ),
                          _trendingMessageRow(
                            context,
                            subtitle:
                                'Lake Thun (Thunersee) : A historic town with a beautiful castle...',
                          ),
                          _trendingMessageRow(
                            context,
                            subtitle:
                                'Lake Lucerne : Known for its preserved medieval architecture....',
                          ),
                        ],
                      ),
                    ),
                    // Explore(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: _buildImageRow(context),
                    ),
                    const SizedBox(height: 8.0), 
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRow(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.only(left: 12.0, top: 8),
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: TextField(
              style: Theme.of(context).textTheme.bodyLarge,
              controller: searchController,
              decoration: const InputDecoration(
                hintText: 'lakesides switzerland',
                hintStyle: TextStyle(),
                border: InputBorder.none, // No border
                suffixIcon: Icon(Icons.search, color: Colors.blue),
                contentPadding:
                    EdgeInsets.only(left: 16.0,
                    top: 14),// Padding inside the TextField
                
              ),
              
            ),
        
          ),
        ),
        const SizedBox(
            width: 5.0), // Space between the search box and the trending icon
        Container(
          margin: const EdgeInsets.only( top: 8),

          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), // Shadow color
                spreadRadius: 2, // How much the shadow spreads
                blurRadius: 2, // How blurry the shadow is
                offset: const Offset(0, 3), // Position of the shadow
              ),
            ],
          ),
          padding: const EdgeInsets.all(
              12.0), // Padding inside the rounded container
          child: const Icon(Icons.local_fire_department, color: Colors.red),
        ),
      ],
    );
  }

  Widget _trendingMessageRow(BuildContext context, {required String subtitle}) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color.fromARGB(255, 80, 180, 252),
            Colors.white,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8.0),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(8.0),
          bottomRight: Radius.circular(20),
        ),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 223, 222, 222)
                .withOpacity(0.5), // Shadow color
            spreadRadius: 5, // How much the shadow spreads
            blurRadius: 7, // How blurry the shadow is
            offset: const Offset(0, 3), // Position of the shadow
          ),
        ], // Blue border
      ),
      margin: const EdgeInsets.symmetric(
          vertical: 8.0, horizontal: 2.0), // Margin for spacing
      child: Row(
        children: [
          Expanded(
            child: ListTile(
              subtitle: Text(
                subtitle,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                // Implement navigation or functionality
              },
            ),
          ),
          const Icon(
            Icons.share_location_outlined,
            color: Colors.green,
            size: 35,
          ),
        ],
      ),
    );
  }

  Widget _buildImageRow(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Number of columns
        mainAxisSpacing: 4.0, // Vertical spacing between grid items
        crossAxisSpacing: 4.0, // Horizontal spacing between grid items
        childAspectRatio: 1.0, // Aspect ratio of each grid item
      ),
      itemBuilder: (context, index) {
        return Image.asset(
          imagePaths[index],
          fit: BoxFit.cover,
        );
      },
      itemCount: imagePaths.length,
    );
  }
}
