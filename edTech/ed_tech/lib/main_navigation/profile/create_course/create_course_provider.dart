import 'dart:convert';

import 'package:ed_tech/models/course_model.dart';
import 'package:ed_tech/services/course_service.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../../helpers/et_scaffold_messenger.dart';

class CreateCourseProvider extends ChangeNotifier {
  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseDescriptionController =
      TextEditingController();
  final TextEditingController coursePriceController = TextEditingController();
  XFile? image;
  Duration duration = Duration(hours: 0, minutes: 0);

  void setDuration({required Duration newDuration}) {
    duration = newDuration;
    notifyListeners();
  }

  Future<bool> saveCourse({
    required BuildContext context,
    required String loggedUserId,
  }) async {
    if (courseNameController.text.isEmpty ||
        courseDescriptionController.text.isEmpty ||
        coursePriceController.text.isEmpty ||
        duration.inSeconds == 0) {
      ETScaffoldMessenger.showMessage(
          context: context, messageText: "Please enter all date");
    } else {
      String? base64Image;
      if (image != null) {
        List<int> imageBytes = await image!.readAsBytes();
        base64Image = base64Encode(imageBytes);
      }

      CourseModel courseModel = CourseModel(
        name: courseNameController.text,
        description: courseDescriptionController.text,
        duration: "${duration.inHours} h ${(duration.inMinutes % 60)} min",
        price: coursePriceController.text,
        creatorId: loggedUserId,
        photoBase64Code: base64Image,
      );

      bool success = await CourseService.saveCourseDataOnFirebase(
          courseModel: courseModel);

      if (success) {
        ETScaffoldMessenger.showMessage(
            context: context, messageText: "Course created");
        return true;
      } else {
        ETScaffoldMessenger.showMessage(context: context, messageText: "ERROR");
      }
    }
    return false;
  }

  void pickPhotoFromGallery() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
  }
}
