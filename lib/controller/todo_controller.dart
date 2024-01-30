import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_practice/model/todoModel.dart';
import 'package:http/http.dart' as http;

class ToDoController extends GetxController {
  TextEditingController taskController = TextEditingController();
  var ToDoList = RxList<TodoModel>();

  @override
  void onInit() {
    super.onInit();
    getToDoList();
  }

  Future<RxList<TodoModel>> getToDoList() async {
    var response = await http.get(Uri.parse(
        "https://65b80bc546324d531d55e479.mockapi.io/TodoApp/ToDoList"));
    var data = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map<String, dynamic> index in data) {
        ToDoList.add(TodoModel.fromJson(index));
      }
      // print(ToDoList.to);
      return ToDoList;
    } else {
      return ToDoList;
    }
  }
}
