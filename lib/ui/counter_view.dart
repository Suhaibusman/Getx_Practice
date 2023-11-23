import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_practice/controller/counter_controller.dart';

class CounterView extends StatelessWidget {
  const CounterView({super.key});

  @override
  Widget build(BuildContext context) {
    CounterController counterController = CounterController();
    return  Scaffold(
      appBar: AppBar(title: const Text("Counter View"),),
      body: Center(
        child: Column(
          children: [
          Obx(()=>Text(counterController.count.value.toString()))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        counterController.incrementCount();
      }, child: const Icon(Icons.add),),
    );
  }
}