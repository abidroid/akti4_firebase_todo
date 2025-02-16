import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  var taskC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        title: const Text('ADD TASK'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: taskC,
              decoration: InputDecoration(
                hintText: 'Task Name',
                border: OutlineInputBorder(),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                String taskName = taskC.text.trim();

                if (taskName.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task Name is required'),
                    ),
                  );
                  return;
                }

                int createdOn = DateTime.now().millisecondsSinceEpoch;
                String uid = FirebaseAuth.instance.currentUser!.uid;

                var taskRef = FirebaseFirestore.instance
                    .collection('tasks')
                    .doc(uid)
                    .collection('tasks')
                    .doc();

                taskRef.set({
                  'taskName': taskName,
                  'createdOn': createdOn,
                  'taskId': taskRef.id,
                });
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
