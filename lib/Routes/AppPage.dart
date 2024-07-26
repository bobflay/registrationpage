import 'package:get/get.dart';
import 'package:registrationpage/Bindings/HomeBinding.dart';
import 'package:registrationpage/Bindings/LoginBinding.dart';
import 'package:registrationpage/Bindings/RegistrationBinding.dart';
import 'package:registrationpage/Routes/AppRoute.dart';
import 'package:registrationpage/Views/Home.dart';
import 'package:registrationpage/Views/Login.dart';
import 'package:registrationpage/Views/Registration.dart';

class AppPage {
  static final List <GetPage> pages = [
    GetPage(name: AppRoute.register, page: ()=> Registration(), binding: RegistrationBinding()),
    GetPage(name: AppRoute.login, page: ()=> Login(),binding: LoginBinding()),
    GetPage(name: AppRoute.home, page: ()=> Home(),binding: Homebinding())
  ];
}