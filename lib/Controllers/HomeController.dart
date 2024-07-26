import 'package:get/get.dart';
import 'package:registrationpage/Core/Network/DioClient.dart';
import 'package:registrationpage/Models/Music.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  late SharedPreferences prefs;
  var musics = <Music>[].obs; // Change to a list of Music objects

  @override
  void onInit() {
    print("Inside onInit");
    _initSharedPreferences();
    getMusics();
    super.onInit();
  }

  void _initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  void getMusics() async {
    print("Inside getting music");
    var client = await DioClient().getInstance().get('/music');
    if (client.statusCode == 200) {
      var musicData = client.data as List;
      musics.value = musicData.map((music) => Music.fromjson(music)).toList();
      print("Fetched music list: ${musics.length} items");
    }
  }

  void logout() async {
    prefs = await SharedPreferences.getInstance();
    prefs.remove('token');
    Get.offNamed(AppRoute.login);
  }
}