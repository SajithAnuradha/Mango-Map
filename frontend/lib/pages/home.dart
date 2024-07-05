import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data/post_details_data.dart';
import 'package:flutter_application_1/model/post_data.dart';
import 'package:flutter_application_1/widgets/post_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final postDetails = PostDetails().dummyData;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          top: 5,
          bottom: 0,
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    "assets/logo.png",
                    width: 140,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      "assets/profile.png",
                      width: 60,
                      height: 60,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: postDetails.length,
                itemBuilder: (context, index) {
                  PostData postData = postDetails[index];
                  return Post(
                    profilePic: postData.profilePic,
                    userName: postData.userName,
                    mainImage: postData.mainImage,
                    commentCount: postData.commentCount,
                    heartCount: postData.heartCount,
                    isHearted: postData.isHearted,
                    placeImage: postData.placeImage,
                    placeName: postData.placeName,
                    countryName: postData.countryName,
                    starsCount: postData.starsCount,
                    description: postData.description,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
