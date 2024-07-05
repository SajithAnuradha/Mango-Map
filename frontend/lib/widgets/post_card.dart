import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  child: Image.asset(
                widget.profilePic,
                width: 30,
                height: 30,
              )),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.userName,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            ClipRRect(
              child: Image.asset(
                widget.mainImage,
                width: MediaQuery.of(context).size.width,
                height: 500,
                fit: BoxFit.cover,
              ),
            ),
            // Text(
            //   widget.userName,
            //   style: const TextStyle(
            //     fontSize: 10,
            //   ),
            // ),
          ],
        ),
        const SizedBox(
          height: 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.asset(
                  widget.placeImage,
                  width: 100,
                  height: 100,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${widget.placeName} , ",
                        style: const TextStyle(
                            fontSize: 20,
                            decoration: TextDecoration.none,
                            color: Colors.black),
                      ),
                      Text(
                        widget.countryName,
                        style: const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '${widget.starsCount}',
                        style: const TextStyle(
                          fontSize: 25,
                          decoration: TextDecoration.none,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    widget.description,
                    style: const TextStyle(
                      fontSize: 25,
                      decoration: TextDecoration.none,
                      color: Colors.black,
                    ),
                    maxLines: 3, // Set the maximum number of lines
                    overflow: TextOverflow
                        .ellipsis, // Set overflow behavior to ellipsis
                  )
                ],
              ),
            )
          ],
        ),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
