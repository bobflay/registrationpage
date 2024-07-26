import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:registrationpage/Controllers/LoginController.dart';
import 'package:registrationpage/Routes/AppRoute.dart';



class Login extends GetView<LoginController> {



  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Center(child: Text("Login")),
      ),
      body: Expanded(
        child: SingleChildScrollView(
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Padding(
              padding: const EdgeInsets.all(
                  16.0),
              child: Column(
                // Column is also a layout widget. It takes a list of children and
                // arranges them vertically. By default, it sizes itself to fit its
                // children horizontally, and tries to be as tall as its parent.
                //
                // Column has various properties to control how it sizes itself and
                // how it positions its children. Here we use mainAxisAlignment to
                // center the children vertically; the main axis here is the vertical
                // axis because Columns are vertical (the cross axis would be
                // horizontal).
                //
                // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
                // action in the IDE, or press "p" in the console), to see the
                // wireframe for each widget.
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
                  SizedBox(height: 10,),
                  Text("Password"),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder()
                    ),
                    controller: controller.password,
                  ),
                  SizedBox(height: 10,),
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
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
