import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatefulWidget {
  const EmailVerificationScreen({super.key});

  @override
  State<EmailVerificationScreen> createState() =>
      _EmailVerificationScreenState();
}

class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
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
            ElevatedButton(onPressed: () {}, child: const Text('Resend Email')),
          ],
        ),
      ),
    );
  }
}
