// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/controller/counter_controller.dart';
import 'package:getx_practice/ui/counter_view.dart';

import '../controller/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var name;
  HomeView({
    Key? key,
    this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find<CounterController>();
    HomeController homeController = Get.put(HomeController());
    
    return Scaffold(
      appBar: AppBar(
        title: Text("Home View ${Get.parameters["name"]}"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => Container(
                  color: Colors.red.withOpacity(homeController.opacity.value),
                  height: Get.height * 0.1,
                  width: Get.width,
                )),
            Obx(() => Slider(
                value: homeController.opacity.value,
                onChanged: (value) {
                  homeController.setOpacity(value);
                })),
            Obx(
              () => Switch(
                  value: homeController.isSwitched.value,
                  onChanged: (value) {
                    homeController.setIsSwitched(value);
                  }),
            ),
            Text("message".tr),
            Text("name".tr),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale("en", "US"));
                    },
                    child: const Text("English")),
                OutlinedButton(
                    onPressed: () {
                      Get.updateLocale(const Locale("ur", "PK"));
                    },
                    child: const Text("Urdu")),
              ],
            ),
            Obx(
              () => Text("Counter Value ${counterController.count}"),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.to(const CounterView());
                },
                child: const Text("Navigate to CounterScreen")),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                    title: "Dialog",
                    middleText: "Getx is better than bloc",
                    textConfirm: "yes",
                    textCancel: "no",
                    onConfirm: () {
                      Get.snackbar("Getx", "Your Choice is Getx");
                      Get.back();
                    },
                    onCancel: () {
                      //2 function use nhi horhe isme
                      // Get.snackbar("Bloc", "Your Choice is bloc");
                      Get.back();
                    });
              },
              child: const Text("SnackBar"),
            ),
            Expanded(
                child: ListView.builder(
                    shrinkWrap: false,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeController.fruitList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(homeController.fruitList[index]),
                        trailing: IconButton(
                            onPressed: () {
                              
                              if (homeController.favFruitList
                                  .contains(homeController.fruitList[index])) {
                                // If the fruit is in the list, remove it
                                homeController.removefromFavourite(
                                    homeController.fruitList[index]);
                              } else {
                                // If the fruit is not in the list, add it
                                homeController.addtoFavourite(
                                    homeController.fruitList[index]);
                              }
                            },
                            icon: Obx(
                              () => Icon(
                                Icons.favorite,
                                color: homeController.favFruitList.contains(
                                        homeController.fruitList[index])
                                    ? Colors.red
                                    : Colors.grey,
                              ),
                            )),
                      );
                    }))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counterController.incrementCount();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
