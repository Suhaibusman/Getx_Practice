import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/todo_controller.dart';

class ToDoView extends StatelessWidget {
  const ToDoView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ToDoController toDoController = Get.put(ToDoController());

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('To Do'),
      ),
      body: Container(
        // Wrap the Column in a Container with a specified height
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: toDoController.taskController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Your Task',
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    toDoController.postToDoList();
                    toDoController.taskController.clear();
                  },
                  child: const Text("Add"),
                ),
              ],
            ),
            // Remove Expanded from the ListView.builder
            Obx(
              () => toDoController.ToDoList.isEmpty
                  ? const Center(child: Text("No Data Found"))
                  : ListView.builder(
                      shrinkWrap: true, // Add this line
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
                                  Get.dialog(
                                    AlertDialog(
                                      title: const Text("Update Task"),
                                      content: TextField(
                                        controller:
                                            toDoController.taskController,
                                        decoration: const InputDecoration(
                                          border: OutlineInputBorder(),
                                          labelText: 'Enter Your Task',
                                        ),
                                      ),
                                      actions: [
                                        ElevatedButton(
                                          onPressed: () {
                                            toDoController.updateTask(task);
                                            toDoController.taskController
                                                .clear();
                                            Get.back();
                                          },
                                          child: const Text("Update"),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () {
                                  toDoController.deleteToDoList(task.id);
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
