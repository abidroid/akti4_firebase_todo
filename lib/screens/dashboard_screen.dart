import 'package:akti4_firebase_todo/screens/profile_screen.dart';
import 'package:akti4_firebase_todo/screens/update_task_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
import 'add_task_screen.dart';
import 'login_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  CollectionReference? taskRef;

  @override
  void initState() {
    super.initState();

    taskRef = FirebaseFirestore.instance
        .collection('tasks')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('tasks');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return const AddTaskScreen();
          }));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
          backgroundColor: Colors.green,
          foregroundColor: Colors.white,
          title: const Text('DASHBOARD'),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return const ProfileScreen();
                  }));
                },
                icon: Icon(Icons.person)),
            IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirmation!!!'),
                        content: Text('Are you sure to logout ?'),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('No')),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();

                                FirebaseAuth.instance.signOut();

                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }));
                              },
                              child: Text('Yes')),
                        ],
                      );
                    });
              },
              icon: Icon(Icons.logout),
            ),
          ]),
      body: StreamBuilder(
        stream: taskRef!.snapshots(),
        builder: (context, snapshot) {

          if( snapshot.hasData){

            QuerySnapshot querySnapshot =  snapshot.data as QuerySnapshot;
            List<QueryDocumentSnapshot> docs = querySnapshot.docs;

            return ListView.builder(
              itemCount: docs.length,
              itemBuilder: (context, index) {

                QueryDocumentSnapshot taskDoc = docs[index];

                return TaskCard(taskDoc: taskDoc);
              });



          }else{
            return Center(
              child: CircularProgressIndicator(),
            );
          }

        },
      ),
    );
  }
}
