class User {
  final int id;
  final String userName;
  String token = '';

  User({
    required this.id,
    required this.userName,
  });

  setToken(String token) {
    this.token = token;
  }

  getToken() {
    return this.token;
  }

  factory User.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'username': String userName,
      } =>
        User(
          id: id,
          userName: userName,
        ),
      _ => throw const FormatException('Failed to load user.'),
    };
  }
}
