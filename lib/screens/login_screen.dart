import 'package:akti4_firebase_todo/screens/dashboard_screen.dart';
import 'package:akti4_firebase_todo/screens/sign_up_screen.dart';
import 'package:flutter/material.dart';

import 'forgot_password_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailC = TextEditingController();
  var passC = TextEditingController();

  bool passwordChupaLo = true;

  @override
  void dispose() {
    emailC.dispose();
    passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('LOGIN'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16.0,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: emailC,
              decoration: InputDecoration(
                hintText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            TextField(
              controller: passC,
              obscureText: passwordChupaLo,
              decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Handle password visibility toggle

                      passwordChupaLo = !passwordChupaLo;

                      setState(() {});
                    },
                    icon: Icon(
                      passwordChupaLo ? Icons.visibility_off : Icons.visibility,
                    ),
                  )),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return const ForgotPasswordScreen();
                    }));
                  },
                  child: const Text(
                    "Forgot Password?",
                  )),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // Handle login button press
                String email = emailC.text.trim();
                String password = passC.text.trim();
                print(email);
                print(password);

                // front end validation
                // if (email.isEmpty || password.isEmpty) {
                //   return;
                // }



                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return const DashboardScreen();
                }));
              },
              child: const Text('Login'),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const SignUpScreen();
                  }));
                },
                child: const Text('Not Registered Yet? Create Account'))
          ],
        ),
      ),
    );
  }
}
