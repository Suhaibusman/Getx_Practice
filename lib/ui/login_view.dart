import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practice/controller/login_controller.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    LoginController login = Get.put(LoginController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            
              controller: login.emailController.value,
            ),
             TextFormField(
              decoration: const InputDecoration(
                hintText: "Password"
              ),
              controller: login.passwordController.value,
            ),
           login.loading.value?  Obx(() => CircularProgressIndicator()): ElevatedButton(
              onPressed: () {
                login.loginAPi();
              }, child: const Text("Login"),)
          ],
        ),
      ),
    );
  }
}