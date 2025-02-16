import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dashboard_screen.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {

  Timer? timer;

  // this will execute first time the screen is opened
  @override
  void initState() {
    super.initState();

    FirebaseAuth.instance.currentUser!.sendEmailVerification();

    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      checkEmailVerification();
    });

  }

  checkEmailVerification() {
    FirebaseAuth.instance.currentUser!.reload();

    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return const DashboardScreen();
      }));
    }

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Verification'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          children: [
            Text('Email Verification Screen'),
            Text(
              'An email has been sent to your email address. Please verify your email to continue.',
              textAlign: TextAlign.center,
            ),
            CircularProgressIndicator(),
            ElevatedButton(onPressed: () {
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
            }, child: const Text('Resend Email')),
          ],
        ),
      ),
    );
  }
}
