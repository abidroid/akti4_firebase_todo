import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../screens/update_task_screen.dart';
import '../utility/functions.dart';

// Re-usable Widget
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
    required this.taskDoc,
  });

  final QueryDocumentSnapshot taskDoc;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.amber,
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            spacing: 16,
            children: [
              Row(
                children: [
                  Text('Task: '),
                  Text(taskDoc['taskName']),
                ],
              ),
              Row(
                children: [
                  Text('Date: '),
                  Text(getHumanReadableDate(taskDoc['createdOn'])),
                ],
              ),
              Row(
                spacing: 16,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                      onPressed: () async {
                        // alert dialog

                        // CTRL + ALT + L
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Confirmation!!!'),
                                content:
                                    Text('Are you sure to delete this task ?'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('No')),
                                  TextButton(
                                      onPressed: () async {
                                        Navigator.of(context).pop();
                                        await FirebaseFirestore.instance
                                            .collection('tasks')
                                            .doc(FirebaseAuth
                                                .instance.currentUser!.uid)
                                            .collection('tasks')
                                            .doc(taskDoc.id)
                                            .delete();

                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text('Task Deleted'),
                                          ),
                                        );
                                      },
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(Icons.delete),
                                          Text('Delete'),
                                        ],
                                      )),
                                ],
                              );
                            });
                      },
                      child: const Text('DELETE')),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return UpdateTaskScreen(taskSnapshot: taskDoc,);
                        }));
                      },
                      child: const Text('UPDATE')),
                ],
              )
            ],
          )),
    );
  }
}
