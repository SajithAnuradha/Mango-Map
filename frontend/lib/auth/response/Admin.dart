class Admin {
  final int id;
  final String businessname;
  String token = '';

  Admin({
    required this.id,
    required this.businessname,
  });

  setToken(String token) {
    this.token = token;
  }

  getToken() {
    return this.token;
  }

  factory Admin.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': int id,
        'businessname': String businessName,
      } =>
        Admin(
          id: id,
          businessname: businessName,
        ),
      _ => throw const FormatException('Failed to load Admin.'),
    };
  }
}
