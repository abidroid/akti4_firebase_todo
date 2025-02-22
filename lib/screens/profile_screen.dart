import 'package:akti4_firebase_todo/utility/functions.dart';
import 'package:akti4_firebase_todo/widgets/user_info_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DocumentSnapshot? userSnapshot;

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  loadUser() async {
    userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('PROFILE'),
      ),
      body: userSnapshot == null
          ? SpinKitDualRing(color: Colors.green)
          : SingleChildScrollView(
              child: Column(children: [
                UserInfoWidget(title: "Name", value: userSnapshot!['name']),
                UserInfoWidget(title: 'Email', value: userSnapshot!['email']),
                UserInfoWidget(
                    title: 'Member Since',
                    value: getHumanReadableDate(userSnapshot!['createdOn']))
              ]),
            ),
    );
  }
}

// WET ( nahe karna )
// We Enjoy Typing

// DRY ( krna ha )
// Don't Repeat Yourself
