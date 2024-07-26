import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Core/Network/DioClient.dart';
import 'package:registrationpage/Core/showSuccessDialog.dart';
import 'package:registrationpage/Models/User.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() {
    print("onInit Logincontroller");
    super.onInit();
    _initSharedPreferences();
  }

  void _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('token') != null) {
      Get.toNamed(AppRoute.home);
    }
  }

  void login() async {
    User user = User(email: email.value.text, password: password.value.text);
    String requestBody = user.toJson();
    var post = await DioClient().getInstance().post("/login", data: requestBody);

    if (post.statusCode == 200) {
      showSuccessDialog(Get.context!, "Success", "User Logged in Successfully", () {
        print(post.data);
        prefs.setString("token", post.data['token']);
        Get.offNamed(AppRoute.home);
      });
    }
  }
}