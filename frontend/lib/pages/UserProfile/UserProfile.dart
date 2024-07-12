import 'package:flutter/material.dart';

class Userprofile extends StatefulWidget {
  Userprofile({super.key});

  @override
  State<Userprofile> createState() => _UserprofileState();
}

class _UserprofileState extends State<Userprofile> {
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
        body: Padding(
          padding: const EdgeInsets.only(
            left: 0,
            right: 0,
            top: 0,
            bottom: 0,
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        "assets/profile.png",
                        width: 120,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/profile.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                          ],
                        ),
                        const Text("Sanjana Kumarasinghe"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/profile.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const Text("Ambalangoda,Sri Lnka"),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              child: Image.asset(
                                "assets/profile.png",
                                width: 30,
                                height: 30,
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Level 1 Reviwer"),
                                Text("Reviews Count: 15"),
                                Text("Last Travelled Location")
                              ],
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Follwers"),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/profile.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/profile.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/profile.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/profile.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            child: Image.asset(
                              "assets/profile.png",
                              width: 80,
                              height: 80,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.red[200],
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text("Gallery"),
                  // GridView.builder(
                  //   padding: const EdgeInsets.all(10.0),
                  //   gridDelegate:
                  //       const SliverGridDelegateWithFixedCrossAxisCount(
                  //     crossAxisCount: 3, // Number of columns
                  //     crossAxisSpacing: 10.0,
                  //     mainAxisSpacing: 10.0,
                  //   ),
                  //   itemCount: imagePaths.length,
                  //   itemBuilder: (context, index) {
                  //     return Image.asset(imagePaths[index], fit: BoxFit.cover);
                  //   },
                  // ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
