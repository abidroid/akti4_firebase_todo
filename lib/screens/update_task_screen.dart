import 'package:flutter/material.dart';

class UpdateTaskScreen extends StatefulWidget {
  const UpdateTaskScreen({super.key});

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  var taskC = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update Task'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
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

                if( taskName.isEmpty){
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Task Name is required'),
                    ),
                  );
                }

              },
              child: const Text('Update'),
            ),
          ],
        ),
      ),

    );
  }
}
