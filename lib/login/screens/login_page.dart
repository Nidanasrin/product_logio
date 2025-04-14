import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logiology/login/controller/login_controller.dart';

class Loginpage extends StatelessWidget {
  final LoginController controller = LoginController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          "Login",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: Form(
            key: controller.formkey,
            child: Column(children: [
              TextFormField(
                  controller: controller.usernamecontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Username"),
                  validator: (username) {
                    if (username!.isEmpty) {
                      return "Username is required";
                    }
                    if (!username.contains('@') || !username.contains('.com')) {
                      return "Username must be a valid email";
                    }
                    return null;
                  }),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                  controller: controller.passwordcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: "Password"),
                  validator: (password) {
                    if (password == null || password.isEmpty) {
                      return "Password is required";
                    }
                    if (password.length < 6) {
                      return "Password must be at least 6 characters";
                    }
                    return null;
                  }),
              SizedBox(
                height: 25,
              ),
              ElevatedButton(
                  onPressed: controller.login, child: Text("Login ")),
            ]),
          ),
        ),
      ]),
    );
  }
}
