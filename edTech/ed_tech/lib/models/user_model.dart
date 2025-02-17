class UserModel {
  final String? id;
  String name;
  final String email;
  String password;

  UserModel({
    this.id,
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

  static UserModel fromJson(json, String id) {
    return UserModel(
      id: id,
      name: json["name"],
      email: json["email"],
      password: json["password"],
    );
  }
}
