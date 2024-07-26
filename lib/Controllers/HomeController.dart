import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  late SharedPreferences prefs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _load_shared_preferences();
  }

  void _load_shared_preferences() async
  {
    prefs = await SharedPreferences.getInstance();
  }


  void logout()
  {
    prefs.remove('token');
    Get.offNamed(AppRoute.login);
  }

}