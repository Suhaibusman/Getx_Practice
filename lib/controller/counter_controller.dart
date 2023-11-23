import 'package:get/get.dart';

class CounterController extends GetxController {
  
  Rx<int> count =0.obs;
  incrementCount(){

    count.value++;
    print(count);
  }
}