import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/controller/counter_controller.dart';

import '../controller/image_picker_controller.dart';


class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
      CounterController counterController = Get.put(CounterController());
    ImagePickerController imagepicker = Get.put(ImagePickerController());
    // CounterController counterController = CounterController();
    return  Scaffold(
      appBar: AppBar(title: const Text("Counter View"),),
      body: Center(
        child: Column(
          children: [
          Obx(()=>Text(counterController.count.value.toString())),
          ElevatedButton(onPressed: (){
            Get.toNamed("/homeView" ,  parameters: {"name": "Suhaib"});
            // Get.to(const HomeView());
          }, child: const Text("Navigate to Home")),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
             Get.changeTheme(ThemeData.dark());
          }, child: const Text("theme")),
           ElevatedButton(onPressed: (){
            Get.bottomSheet(Container(   
               color: Colors.blue,
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.light_mode),
                    title: const Text("Light Mode"),
                    onTap: (){
                      Get.changeTheme(ThemeData.light());
                    },
                  ),
                   ListTile(
                    leading: const Icon(Icons.dark_mode),
                    title: const Text("Dark Mode"),
                    onTap: (){
                      Get.changeTheme(ThemeData.dark());
                    },
                  )
                ],
              ),
            ));
          }, child: const Text("Theme Mode")),
          Obx((){
            return Column(
              children: [
                CircleAvatar(
                  radius: 40,
                    backgroundImage: imagepicker.imagePath.isNotEmpty ? FileImage(File(imagepicker.imagePath.toString())) : null,
                ),
                InkWell(
                  onTap: (){
                    imagepicker.getImage();
                  },
                  child: const Text("Pick Image"))
              ],
            );
          })
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterController.incrementCount(); 
      }, child: const Icon(Icons.add),),
    );
  }
}