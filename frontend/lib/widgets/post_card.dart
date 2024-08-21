import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/Location/Location.dart';
import 'package:flutter_application_1/pages/Profile/UserProfile.dart';

class Post extends StatefulWidget {
  final String profilePic;
  final String userName;
  final String mainImage;
  final int commentCount;
  final int heartCount;
  final bool isHearted;
  final String placeImage;
  final String placeName;
  final String countryName;
  final int starsCount;
  final String description;

  const Post({
    super.key,
    required this.userName,
    required this.mainImage,
    required this.commentCount,
    required this.heartCount,
    required this.isHearted,
    required this.profilePic,
    required this.placeName,
    required this.countryName,
    required this.starsCount,
    required this.description,
    required this.placeImage,
  });

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  void _goToUserProfile() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Userprofile()));
  }

  void _goToLocationPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Location()));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [
                const Color.fromRGBO(10, 77, 104, 1).withOpacity(0.8),
                const Color.fromARGB(0, 0, 0, 0),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.only(
                top: 6.0, left: 12.0, right: 6.0, bottom: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _goToUserProfile,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      widget.profilePic,
                      width: 30,
                      height: 30,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  widget.userName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 255, 255),
                    decoration: TextDecoration.none,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 0.5,
        ),
        Stack(
          children: [
            ClipRRect(
              // borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                widget.mainImage,
                width: MediaQuery.of(context).size.width,
                height: 700,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      const Color.fromRGBO(10, 77, 104, 1).withOpacity(0.8),
                      const Color.fromARGB(0, 0, 0, 0)
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.comment_rounded,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        widget.commentCount.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Icon(
                        widget.isHearted
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.white,
                        size: 30,
                      ),
                      Text(
                        widget.heartCount.toString(),
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Icon(
                        Icons.more_vert,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        GestureDetector(
          onTap: _goToLocationPage,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 8.0, left: 16, top: 8, bottom: 0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    widget.placeImage,
                    width: 80,
                    height: 80,
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 8, bottom: 8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "${widget.placeName} , ",
                            style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            widget.countryName,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              decoration: TextDecoration.none,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Row(
                            children: [
                              ...List.generate(
                                widget.starsCount,
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 15,
                                ),
                              ),
                              ...List.generate(
                                5 - widget.starsCount,
                                (index) => const Icon(
                                  Icons.star,
                                  color: Colors.grey,
                                  size: 15,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        widget.description,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 15,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
