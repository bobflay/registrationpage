import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Core/Network/DioClient.dart';
import 'package:registrationpage/Core/showSuccessDialog.dart';
import 'package:registrationpage/Models/User.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();

  late SharedPreferences prefs;

  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }


  void register() async
  {
      User user = User(name: name.value.text, email: email.value.text, phone: phone.value.text,password: password.value.text);
      String request_body = user.toJson();
      var post = await DioClient().getInstance().post("/register",data: request_body);
      if (post.statusCode==200)
        {
          showSuccessDialog(Get.context!, 'Success', 'User Registered Successfully', (){
            print("inside print data");
            print(post.data);
            prefs.setString('token', post.data['token']);
            Get.offNamed(AppRoute.home);
          });
        }
  }

}