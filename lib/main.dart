import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/home_controller.dart';
import 'package:getx_practice/localization/languages.dart';
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
    Get.lazyPut(() => HomeController());
     HomeController homeController = Get.find<HomeController>();
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CounterView(),
      locale: const Locale("en","US"),
      translations: Languages(),
      fallbackLocale: const Locale("en","US"),
      theme: ThemeData.light(), // Initial theme
      darkTheme: ThemeData.dark(), // Initial dark theme
      themeMode: homeController.isSwitched.isTrue
          ? ThemeMode.dark
          : ThemeMode.light,
      getPages: [
        GetPage(
          name: '/',
          page: () => const CounterView(),
        ),
         GetPage(
          name: '/homeView',
          page: () =>  HomeView(),
        ),                             
      ],
    );
  }
}

