import 'package:firebase_auth_app/services.dart/authentication_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Container(
        margin: const EdgeInsets.all(30.0),
        child: ListView(
          children: [
            const SizedBox(height: 50.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                prefixIcon: Icon(Icons.mail),
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: _pwdController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blue,
                  ),
                ),
                prefixIcon: Icon(Icons.lock),
                labelText: 'Password',
              ),
            ),
            const SizedBox(height: 100.0),
            FloatingActionButton(
              onPressed: () {
                final email = _emailController.text.trim();
                final password = _pwdController.text.trim();

                if (email.isNotEmpty && password.isNotEmpty) {
                  context
                      .read<AuthenticationService>()
                      .signIn(email: email, password: password);
                }
              },
              child: const Icon(
                Icons.keyboard_arrow_right,
                size: 40.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
