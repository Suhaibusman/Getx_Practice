import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/todo_controller.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoController toDoController = Get.put(ToDoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Column(
        children: [
          TextField(
            controller: toDoController.taskController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter Your Task',
            ),
          ),
          Expanded(
            child: Obx(
              () => toDoController.ToDoList.isEmpty
                  ? const Center(child: Text("No Data Found"))
                  : ListView.builder(
                      itemCount: toDoController.ToDoList.length,
                      itemBuilder: (context, index) {
                        var task = toDoController.ToDoList[index];

                        return ListTile(
                          title: Text(
                            '${task.id} ${task.title}',
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () {
                                  // Implement edit functionality
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  // Implement delete functionality
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
