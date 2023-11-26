import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  Rx<double> opacity = 0.4.obs;

  setOpacity(double value) {
    opacity.value = value;
  }

  Rx<bool> isSwitched = false.obs;

  void setIsSwitched(bool value) {
    isSwitched.value = value;
    if (isSwitched.isTrue) {
      Get.changeTheme(ThemeData.dark());
    } else {
      Get.changeTheme(ThemeData.light());
    }
  }

  RxList<String> fruitList = [
    "apple",
    "banana",
    "orange",
    "grape",
    "strawberry",
    "mango",
    "pineapple",
    "watermelon",
    "kiwi",
    "pear"
  ].obs;
  RxList favFruitList = [].obs;

  addtoFavourite(String value) {
    favFruitList.add(value);
    // Toggle the favorite status of the current fruit
  }

  removefromFavourite(String value) {
    favFruitList.remove(value);
  }
}
