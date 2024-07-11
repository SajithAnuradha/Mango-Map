class PostData {
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

  PostData({
    required this.profilePic,
    required this.userName,
    required this.mainImage,
    required this.commentCount,
    required this.heartCount,
    required this.isHearted,
    required this.placeImage,
    required this.placeName,
    required this.countryName,
    required this.starsCount,
    required this.description,
  });
}
