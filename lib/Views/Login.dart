import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Controllers/LoginController.dart';
import 'package:registrationpage/Routes/AppRoute.dart';

class Login extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Center(child: Text("Login")),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("Email"),
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                  controller: controller.email,
                ),
                SizedBox(height: 10),
                Text("Password"),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder()
                  ),
                  controller: controller.password,
                ),
                SizedBox(height: 10),
                Center(
                  child: ElevatedButton(
                      onPressed: (){
                        print("clicked!!!");
                        print(controller.email.value.text);
                        print(controller.password.value.text);
                        controller.login();
                      },
                      child: Text("Login")
                  ),
                ),
                Center(
                  child: ElevatedButton(
                      onPressed: (){
                        Get.toNamed(AppRoute.register);
                      },
                      child: Text("Register")
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}