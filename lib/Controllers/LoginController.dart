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
    // TODO: implement onInit
    super.onInit();
    _load_shared_prefernces();

  }

  void _load_shared_prefernces () async
  {
    prefs = await SharedPreferences.getInstance();

    if(prefs.getString('token')!=null)
    {
      Get.offNamed(AppRoute.home);
    }
  }




  void login() async
  {
    User user = User(email: email.value.text, password: password.value.text);
    String request_body = user.toJson();

    var post = await DioClient().getInstance().post("/login",data: request_body);
    if(post.statusCode==200)
      {
        showSuccessDialog(Get.context!, "Success", "User Logged In Successfully", (){
            print(post.data);
            prefs.setString('token', post.data['token']);
            Get.toNamed(AppRoute.home);
        });
      }
  }


}