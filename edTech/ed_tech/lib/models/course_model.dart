import 'dart:developer';

class CourseModel {
  final String? id;
  final String name;
  final String description;
  final String duration;
  final String price;
  final String creatorId;

  CourseModel({
    this.id,
    required this.name,
    required this.description,
    required this.duration,
    required this.price,
    required this.creatorId,
  });

  Object toJson() {
    return {
      "name": name,
      "description": description,
      "duration": duration,
      "price": price,
      "creator_id": creatorId,
    };
  }

  static CourseModel fromJson(json, String id) {
    late CourseModel resultModel;
    try {
      resultModel = CourseModel(
        id: id,
        name: json["name"],
        description: json["description"],
        duration: json["duration"],
        price: json["price"],
        creatorId: json["creator_id"],
      );
    } catch (e) {
      log("EXCEPTION CourseModel fromJson: $e");
    }

    return resultModel;
  }
}
