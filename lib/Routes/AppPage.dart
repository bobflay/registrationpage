import 'package:get/get.dart';
import 'package:registrationpage/Bindings/LoginBinding.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:registrationpage/Views/Login.dart';
import 'package:registrationpage/Views/Registration.dart';

class AppPage {
  static final List <GetPage> pages = [
    GetPage(name: AppRoute.register, page: ()=> Registration()),
    GetPage(name: AppRoute.login, page: ()=> Login(),binding: LoginBinding())

  ];
}