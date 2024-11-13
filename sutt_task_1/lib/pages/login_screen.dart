import 'package:flutter/material.dart';
import 'package:sutt_task_1/pages/home.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String title = "";
  var _passWordVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: userNameController,
              obscureText: false,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'username',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: TextField(
              controller: passwordController,
              obscureText: _passWordVisible,
              decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: 'password',
                  suffixIcon: IconButton(
                    icon: _passWordVisible
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _passWordVisible = !_passWordVisible;
                      });
                    },
                  )),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              child: const Text("Clik me Daddy!"))
        ],
      ),
    );
  }
}
