
import 'package:cloud_firestore/cloud_firestore.dart';
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
                  ElevatedButton(onPressed: (){}, child: const Text('DELETE')),
                  ElevatedButton(onPressed: (){

                    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                      return const UpdateTaskScreen();
                    }));


                  }, child: const Text('UPDATE')),
                ],
              )
            ],
          )),
    );
  }



}
