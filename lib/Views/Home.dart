import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:registrationpage/Controllers/HomeController.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final HomeController controller = Get.put(HomeController());

    return GetX<HomeController>(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Center(child: Text("Home")),
          ),
          body: Center(
            child: ListView.builder(
                itemCount: controller.musics.length,
                itemBuilder: (context,index) {
                  final music = controller.musics[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(music.coverPhoto),
                      title: Text(music.title),
                      subtitle: Text('${music.artist} • ${music.views} views'),
                    ),
                  );
                }
            )
          ),
          drawer: Drawer(
            backgroundColor: Colors.purple,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton(
                  onPressed: () {
                    _.logout();
                  },
                  child: Text("Logout!"),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}