
import 'package:flutter/material.dart';

import '../screens/update_task_screen.dart';

// Re-usable Widget
class TaskCard extends StatelessWidget {
  const TaskCard({
    super.key,
  });

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
                  Text('Perform Umrah'),
                ],
              ),
              Row(
                children: [
                  Text('Date: '),
                  Text('9 Feb 2025'),
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
