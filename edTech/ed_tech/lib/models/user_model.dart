class UserModel {
  final String name;
  final String email;
  final String password;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
  });

  Object toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  static UserModel fromJson(json) {
    return UserModel(
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }
}
