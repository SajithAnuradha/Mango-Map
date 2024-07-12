import 'package:flutter_application_1/model/post_data.dart';

class PostDetails {
  final List<PostData> dummyData = [
    
    PostData(
      profilePic: 'assets/profile.png',
      userName: 'alice_wonder',
      mainImage: 'assets/image2.jpeg',
      commentCount: 200,
      heartCount: 1500,
      isHearted: true,
      placeImage: 'assets/image2.jpeg',
      placeName: 'Great Wall of China',
      countryName: 'China',
      starsCount: 5,
      description:
          'The Great Wall of China is a series of fortifications made of stone, brick, tamped earth, wood, and other materials.',
    ),
    PostData(
      profilePic: 'assets/profile.png',
      userName: 'john_doe',
      mainImage: 'assets/image1.jpeg',
      commentCount: 150,
      heartCount: 1200,
      isHearted: true,
      placeImage: 'assets/image1.jpeg',
      placeName: 'Eiffel Tower',
      countryName: 'France',
      starsCount: 5,
      description:
          'The Eiffel Tower is a wrought-iron lattice tower on the Champ de Mars in Paris, France.',
    ),
    PostData(
      profilePic: 'assets/profile.png',
      userName: 'jane_smith',
      mainImage: 'assets/image20.png',
      commentCount: 80,
      heartCount: 900,
      isHearted: false,
      placeImage: 'assets/image20.png',
      placeName: 'Statue of Liberty',
      countryName: 'USA',
      starsCount: 4,
      description:
          'The Statue of Liberty is a colossal neoclassical sculpture on Liberty Island in New York Harbor.',
    ),
  ];
}
