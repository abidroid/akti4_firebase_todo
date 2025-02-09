import 'package:akti4_firebase_todo/screens/profile_screen.dart';
import 'package:akti4_firebase_todo/screens/update_task_screen.dart';
import 'package:flutter/material.dart';

import 'add_task_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
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
              onPressed: () {},
              icon: Icon(Icons.logout),
            ),
          ]),
      body: ListView(
        children: [
          Card(
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
          ),
          Card(
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
                        ElevatedButton(onPressed: (){}, child: const Text('UPDATE')),
                      ],
                    )
                  ],
                )),
          ),

        ],
      ),
    );
  }
}
