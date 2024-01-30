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

  Future<void> postToDoList() async {
    var response = await http.post(
        Uri.parse(
            "https://65b80bc546324d531d55e479.mockapi.io/TodoApp/ToDoList"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(<String, String>{
          "title": taskController.text,
          "time": DateTime.now().toString()
        }));

    if (response.statusCode == 201) {
      print("done");
    } else {
      print("error");
    }
  }

  Future<void> deleteToDoList(id) async {
    var response = await http.delete(
      Uri.parse(
          "https://65b80bc546324d531d55e479.mockapi.io/TodoApp/ToDoList/$id"),
    );

    if (response.statusCode == 200) {
      print("done");
    } else {
      print("error");
    }
  }

  Future<bool> updateTask(TodoModel task) async {
    try {
      var response = await http.put(
        Uri.parse(
            "https://65b80bc546324d531d55e479.mockapi.io/TodoApp/ToDoList/${task.id}"),
        body: jsonEncode(task.toJson()),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        // Assuming the API returns a success status
        return true;
      } else {
        // Handle error, maybe show a message to the user
        print('Failed to update task: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle exceptions, maybe show a message to the user
      print('Error updating task: $e');
      return false;
    }
  }
}
