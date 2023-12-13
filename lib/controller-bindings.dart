// ignore_for_file: file_names

import 'package:chat_app/controller/authController.dart';
import 'package:get/get.dart';

class ControllereBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
