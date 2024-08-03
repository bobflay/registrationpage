import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:registrationpage/Controllers/HomeController.dart';
import 'package:registrationpage/Controllers/LoginController.dart';
import 'package:registrationpage/Routes/AppRoute.dart';



class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return GetX<HomeController>(
        builder: (_){
          return  Scaffold(
            appBar: AppBar(
              // TRY THIS: Try changing the color here to a specific color (to
              // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
              // change color while the other colors stay the same.
              backgroundColor: Theme.of(context).colorScheme.inversePrimary,
              // Here we take the value from the MyHomePage object that was created by
              // the App.build method, and use it to set our appbar title.
              title: Center(child: Text("Home")),
            ),
            body: ListView.builder(
                itemCount: controller.songs.length,
                itemBuilder: (context,index){
                  var music = controller.songs[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(music.coverPhoto),
                      title: Text(music.title),
                      subtitle: Text("${music.artist} . ${music.views}"),
                    ),
                  );
                }
            ),
            drawer: Drawer(
              backgroundColor: Colors.purple,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: (){
                        controller.logout();
                      },
                      child: Text("Logout!")),
                ],
              ),
            ),
            // This trailing comma makes auto-formatting nicer for build methods.
          );
        }
    );
  }
}
