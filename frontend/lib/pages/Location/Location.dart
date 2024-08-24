import 'package:flutter/material.dart';

class Location extends StatefulWidget {
  const Location({super.key});

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60.0),
                        child: Image.asset(
                          "assets/image6.png",
                          width: 120,
                          height: 120,
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 16.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                              children: [
                                Text(
                                  "Lakeside ,",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Text(
                                  " Switzerland",
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8.0),
                            const Text(
                              "Stay in the quiet of a lakeside resort, soak up the sun and enjoy the gentle pace of life. Switzerland’s lakes are stunningly beautiful, and each lake has its own personality. Our favourite resorts include Weggis and Brunnen on Lake Lucerne, Spiez on Lake Thun, Bönigen on Lake Brienz and Ascona on Lake Maggiore where Switzerland meets the border with Italy.",
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                            const SizedBox(height: 10),
                            Row(
                              children: [
                                const Text(
                                  "Overall Ratings: ",
                                  style: TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                Row(
                                  children: [
                                    ...List.generate(
                                      4,
                                      (index) => const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                        size: 10,
                                      ),
                                    ),
                                    ...List.generate(
                                      1,
                                      (index) => const Icon(
                                        Icons.star,
                                        color: Colors.grey,
                                        size: 10,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8.0),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // padding: const EdgeInsets.all(10.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, // Number of columns
                    crossAxisSpacing: 1.0,
                    mainAxisSpacing: 1.0,
                  ),
                  itemCount: imagePaths.length,
                  itemBuilder: (context, index) {
                    return Image.asset(imagePaths[index], fit: BoxFit.cover);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
