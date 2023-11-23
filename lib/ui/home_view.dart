import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/counter_controller.dart';
import 'package:getx_practice/ui/counter_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = Get.find<CounterController>();
    return Scaffold(
      appBar: AppBar(title: const Text("Home View"),),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
        Obx(() =>   Text("Counter Value ${counterController.count}"),),
            ElevatedButton(onPressed: (){
            Get.to(const CounterView());
          }, child: const Text("Navigate to CounterScreen")),
          
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
        // Get.snackbar("Bloc", "Your Choice is bloc");
        Get.back();
      }
    );
  },
  child: const Text("SnackBar"),
)

          
        ],
      ),
    ),
         floatingActionButton: FloatingActionButton(onPressed: (){
        counterController.incrementCount(); 
      }, child: const Icon(Icons.add),),
    );
  }
}