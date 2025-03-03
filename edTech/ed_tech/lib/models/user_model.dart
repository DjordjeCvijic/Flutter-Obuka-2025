class UserModel {
  final String? id;
  String name;
  final String email;
  String password;
  String? passwordChangedAt;
  List<String>? savedCourses;

  UserModel({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    this.passwordChangedAt,
    this.savedCourses,
  });

  Object toJson() {
    return {
      "name": name,
      "email": email,
      "password": password,
    };
  }

  static UserModel fromJson(json, String id) {
    String? saveCoursesAsString = json["saved_courses"];
    List<String>? savedCourses;
    if (saveCoursesAsString != null) {
      savedCourses = saveCoursesAsString.split(",");
    }

    return UserModel(
      id: id,
      name: json["name"],
      email: json["email"],
      password: json["password"],
      passwordChangedAt: json["password_changed_at"],
      savedCourses: savedCourses,
    );
  }
}
