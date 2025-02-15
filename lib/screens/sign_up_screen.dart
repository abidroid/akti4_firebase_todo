import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var nameC = TextEditingController();
  var phoneC = TextEditingController();
  var emailC = TextEditingController();
  var passC = TextEditingController();
  var confirmPassC = TextEditingController();

  bool passwordChupaLo = true;
  String gender = 'Male';

  @override
  void dispose() {
    nameC.dispose();
    phoneC.dispose();
    confirmPassC.dispose();
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
        title: const Text('SIGN UP'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            spacing: 16.0,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: nameC,
                decoration: InputDecoration(
                  hintText: 'Name',
                  border: OutlineInputBorder(),
                ),
              ),
              TextField(
                controller: phoneC,
                decoration: InputDecoration(
                  hintText: 'Phone',
                  border: OutlineInputBorder(),
                ),
              ),
              Text('Gender'),
              Row(

                spacing: 36,
                children: [
                  Row(
                    children: [
                      Radio(value: 'Male', groupValue: gender, onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                      Text('Male'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio(value: 'Female', groupValue: gender, onChanged: (value) {
                        setState(() {
                          gender = value!;
                        });
                      }),
                      Text('Female'),
                    ],
                  ),
                ],
              ),
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

              TextField(
                controller: confirmPassC,
                obscureText: passwordChupaLo,
                decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                ),
                onPressed: () async {
                  // Handle login button press
                  String name = nameC.text.trim();
                  String phone = phoneC.text.trim();
                  String email = emailC.text.trim();
                  String password = passC.text.trim();
                  String confirmPassword = confirmPassC.text.trim();

                  // if( name.isEmpty){
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Name is required'),
                  //     ),
                  //   );
                  //
                  //   return;
                  // }

                  // if( password.length < 6 ){
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Password must be at least 6 characters'),
                  //     ),
                  //   );
                  //   return;
                  // }

                  // if( password != confirmPassword){
                  //   ScaffoldMessenger.of(context).showSnackBar(
                  //     const SnackBar(
                  //       content: Text('Passwords do not match'),
                  //     ),
                  //   );
                  //   return;
                  // }

                  FirebaseAuth auth = FirebaseAuth.instance;

                  try {
                    UserCredential userCredentials = await auth.createUserWithEmailAndPassword(email: email, password: password);


                    if( userCredentials.user != null){

                      // Save user data in cloud firestore

                      FirebaseFirestore firestore = FirebaseFirestore.instance;

                      await firestore.collection('users')
                      .doc(userCredentials.user!.uid)
                      .set({

                        'name': name,
                        'phone': phone,
                        'email': email,
                        'gender': gender,
                        'uid': userCredentials.user!.uid,
                        'photo': null,
                        'createdOn': DateTime.now().millisecondsSinceEpoch,
                      });




                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration successful'),
                        ),
                      );
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Registration failed'),
                        ),
                      );
                    }
                  }
                  on FirebaseAuthException catch (e){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(e.message!),
                      ),
                    );
                  }



                },
                child: const Text('REGISTER'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
