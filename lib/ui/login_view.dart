import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController login = Get.put(LoginController());
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(
              hintText: "Email"
            ),
            controller: login.emailController.value,
          ),
           TextFormField(
            decoration: const InputDecoration(
              hintText: "Password"
            ),
            controller: login.passwordController.value,
          ),
          ElevatedButton(
            onPressed: () {}, child: const Text("Login"),)
        ],
      ),
    );
  }
}