import 'package:akti4_firebase_todo/screens/profile_screen.dart';
import 'package:akti4_firebase_todo/screens/update_task_screen.dart';
import 'package:flutter/material.dart';

import '../widgets/task_card.dart';
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
          TaskCard(),
          TaskCard(),
          TaskCard(),
          TaskCard(),

        ],
      ),
    );
  }
}

