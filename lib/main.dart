import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/ui/counter_view.dart';
import 'package:getx_practice/ui/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterView(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => const CounterView(),
        ),
         GetPage(
          name: '/homeView',
          page: () => const HomeView(),
        ),                             
      ],
    );
  }
}

