class UserModel {
  final String? id;
  String name;
  final String email;
  String password;
  String? passwordChangedAt;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.passwordChangedAt,
  });

  Object toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  static UserModel fromJson(json, String id) {
    return UserModel(
      id: id,
      name: json["name"],
      email: json["email"],
      password: json["password"],
      passwordChangedAt: json["password_changed_at"],
    );
  }
}
