import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Core/Network/DioClient.dart';
import 'package:registrationpage/Models/Music.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {

  late SharedPreferences prefs;
  
  var songs = <Music>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _load_shared_preferences();
    getMusic();
  }

  void _load_shared_preferences() async
  {
    prefs = await SharedPreferences.getInstance();
  }
  
  void getMusic() async
  {
    var request = await DioClient().getInstance().get('/music');
    if(request.statusCode == 200)
      {
        var request_data = request.data as List;
        songs.value = request_data.map((music) => Music.fromjson(music)).toList();
        print("Fetched Music list : ${songs.length} items");
      }
  }


  void logout()
  {
    prefs.remove('token');
    Get.offNamed(AppRoute.login);
  }

}