import 'package:get/get.dart';
import 'package:registrationpage/Controllers/HomeController.dart';

class Homebinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => HomeController());
  }



}